#!/usr/bin/env python3
"""
Unduh gambar asli dari cac-indonesia.or.id lalu simpan ke assets/img/.

Sumber dan pemetaannya:
  /storage/sliders/*   → slider-1..4.jpg      (hero beranda)
  /storage/events/*    → seminar-01..21.jpg   (urutannya sama dengan daftar Seminar)
                         training-01..09.jpg  (urutannya sama dengan daftar Training)
  /storage/medias/*    → news-1..4.jpg        (kartu berita)
  /storage/partners/*  → partner-01..09.png   (logo mitra di beranda)

Semua gambar diperkecil dan dikompres agar prototipe tetap ringan.

Pakai:  python3 tools/fetch-images.py
"""

import html
import io
import json
import re
import sys
import time
import urllib.request
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "assets" / "img"
BASE = "https://cac-indonesia.or.id"
UA = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
                    "AppleWebKit/537.36 Chrome/120 Safari/537.36"}

PAGES = {"home": "", "seminar": "seminar", "training": "training"}


class NotAnImage(Exception):
    """Server membalas 200 tetapi isinya halaman HTML — berkasnya hilang."""


def get(url, tries=3, expect_image=True):
    last = None
    for attempt in range(tries):
        try:
            req = urllib.request.Request(url, headers=UA)
            with urllib.request.urlopen(req, timeout=45) as r:
                data = r.read()
            # Server KAKI membalas 200 + halaman HTML untuk berkas yang hilang,
            # jadi isinya perlu diperiksa — tetapi hanya saat mengambil gambar.
            if expect_image and (data[:15].lstrip().lower().startswith(b"<!doctype")
                                 or data[:5] == b"<html"):
                raise NotAnImage(url)
            return data
        except NotAnImage:
            raise
        except Exception as exc:                          # noqa: BLE001
            last = exc
            time.sleep(1 + attempt)
    raise last


def norm(u):
    u = html.unescape(u)
    if not u.startswith("http"):
        u = BASE + "/" + u.lstrip("/")
    return u.replace(BASE + "//", BASE + "/")


def cards(src):
    """(judul, url thumbnail) dari halaman daftar news-one, sesuai urutan tampil."""
    out = []
    for blk in re.findall(r"(?s)<div class=\"news-one__single\">(.*?)news-one__read-more", src):
        img = re.search(r'src="([^"]*?/storage/[^"]+)"', blk)
        ttl = re.search(r"(?s)news-one__title\">.*?<a[^>]*>(.*?)</a>", blk)
        if not img:
            continue
        title = re.sub(r"\s+", " ", re.sub(r"<[^>]+>", "", ttl.group(1))).strip() if ttl else ""
        out.append((title, norm(img.group(1))))
    return out


def save(data, name, box, quality=82):
    """Simpan sebagai JPEG/PNG dengan sisi terpanjang dibatasi `box`."""
    im = Image.open(io.BytesIO(data))
    keep_alpha = name.endswith(".png")
    im = im.convert("RGBA" if keep_alpha else "RGB")
    im.thumbnail(box, Image.LANCZOS)
    path = OUT / name
    if keep_alpha:
        im.save(path, "PNG", optimize=True)
    else:
        im.save(path, "JPEG", quality=quality, optimize=True, progressive=True)
    return path.stat().st_size


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)

    pages = {}
    for key, path in PAGES.items():
        try:
            pages[key] = get("%s/%s" % (BASE, path), expect_image=False).decode("utf-8", "replace")
        except Exception as exc:                          # noqa: BLE001
            print("[img] GAGAL memuat halaman %s — %s" % (key, exc), file=sys.stderr)
            return 1

    seminar = cards(pages["seminar"])
    training = cards(pages["training"])
    sliders = [norm(u) for u in re.findall(r'src="([^"]*?/storage/sliders/[^"]+)"', pages["home"])]
    medias = [norm(u) for u in re.findall(r'src="([^"]*?/storage/medias/[^"]+)"', pages["home"])]
    partners = [norm(u) for u in re.findall(r'src="([^"]*?/storage/partners/[^"]+)"', pages["home"])]

    print("ditemukan: %d slider · %d seminar · %d training · %d media · %d mitra"
          % (len(sliders), len(seminar), len(training), len(medias), len(partners)))

    jobs = []
    for i, u in enumerate(sliders[:4], 1):
        jobs.append(("slider-%d.jpg" % i, u, (1600, 1600), 80))
    for i, (_, u) in enumerate(seminar, 1):
        jobs.append(("seminar-%02d.jpg" % i, u, (900, 900), 78))
    for i, (_, u) in enumerate(training, 1):
        jobs.append(("training-%02d.jpg" % i, u, (900, 900), 78))
    for i, u in enumerate(medias[:4], 1):
        jobs.append(("news-%d.jpg" % i, u, (900, 900), 78))
    for i, u in enumerate(partners, 1):
        jobs.append(("partner-%02d.png" % i, u, (420, 420), 90))

    total = 0
    missing = []
    for name, url, box, q in jobs:
        target = OUT / name
        if target.exists() and target.stat().st_size > 2048:
            total += target.stat().st_size
            continue
        try:
            size = save(get(url), name, box, q)
            total += size
            print("  %-18s %6.1f KB" % (name, size / 1024))
        except NotAnImage:
            missing.append((name, box, q, "hilang di server"))
        except Exception as exc:                          # noqa: BLE001
            missing.append((name, box, q, str(exc)[:48]))

    # Beberapa thumbnail memang tidak ada lagi di server KAKI. Slot itu diisi
    # ulang memakai foto asli lain dari situs yang sama supaya tidak ada
    # placeholder tersisa (pengulangan gambar dapat diterima).
    if missing:
        print("\n%d berkas tidak tersedia di server — diisi foto asli lain:" % len(missing))
        pool = sorted(f for f in OUT.glob("seminar-*.jpg")) + sorted(OUT.glob("training-*.jpg"))
        for i, (name, box, q, why) in enumerate(missing):
            if name.startswith("partner-") or name.startswith("slider-"):
                print("  %-18s dilewati (%s)" % (name, why))
                continue
            if not pool:
                break
            src = pool[i % len(pool)]
            save(src.read_bytes(), name, box, q)
            print("  %-18s ← %s  (%s)" % (name, src.name, why))

    # Simpan pemetaan judul → berkas supaya generator halaman bisa memakainya.
    mapping = {
        "seminar": [{"title": t, "img": "assets/img/seminar-%02d.jpg" % i}
                    for i, (t, _) in enumerate(seminar, 1)],
        "training": [{"title": t, "img": "assets/img/training-%02d.jpg" % i}
                     for i, (t, _) in enumerate(training, 1)],
        "news": ["assets/img/news-%d.jpg" % i for i in range(1, min(len(medias), 4) + 1)],
        "partners": ["assets/img/partner-%02d.png" % i for i in range(1, len(partners) + 1)],
        "sliders": ["assets/img/slider-%d.jpg" % i for i in range(1, min(len(sliders), 4) + 1)],
    }
    (ROOT / "tools" / "image-map.json").write_text(
        json.dumps(mapping, indent=1, ensure_ascii=False), encoding="utf-8")

    have = sum(1 for f in OUT.glob("*") if f.suffix in (".jpg", ".png"))
    print("\n%d berkas gambar di assets/img, total %.1f MB" % (have, total / 1024 / 1024))
    print("pemetaan disimpan ke tools/image-map.json")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
