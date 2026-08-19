#!/usr/bin/env python3
"""
Ambil isi 6 artikel dari situs live, bersihkan, lalu tulis jadi halaman detail
di src/pages/.

Struktur halaman mengikuti events/show.blade.php dan medias/show.blade.php
yang isinya identik:

    <section class="portfolio-details">
      <div class="container">
        <div class="row"><div class="col-xl-12">
          <div class="portfolio-details__img"><img …></div>
          <h3 class="portfolio-details__title text-center mt-4 pt-3">judul</h3>
        </div></div>
        <div class="portfolio-details__content">{!! $event->body !!}</div>
      </div>
    </section>

Pembersihan yang dilakukan pada body WYSIWYG:
  · perbaiki mojibake (UTF-8 yang terlanjur dibaca sebagai latin-1)
  · buang semua atribut inline kecuali href pada <a>
  · sisakan tag semantik saja: p strong em a br ul ol li h2 h3
  · buang paragraf kosong dan &nbsp; beruntun

Pakai:  python3 tools/extract-articles.py   (perlu koneksi ke situs live)
"""

import html
import re
import sys
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "src" / "pages"
BASE = "https://cac-indonesia.or.id"
UA = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 Chrome/120 Safari/537.36"}

# slug asli di situs live  →  (nama berkas prototipe, kategori, kunci i18n kategori, tanggal ID/EN, gambar, halaman induk)
ARTICLES = [
    ("event/kaki-dorong-transparansi-kepemilikan-untuk-memperkuat-integritas-pasar-modal-indonesia",
     "artikel-pasar-modal", "page.seminar", "18 Juni 2026", "18 June 2026",
     "assets/img/seminar-01.jpg", "seminar.html"),
    ("event/webinar-kaki-kuhp-2023-dan-dunia-usaha-integritas-beralih-dari-nilai-moral-ke-strategi-perlindungan-korporasi",
     "artikel-kuhp-2023", "page.seminar", "Desember 2025", "December 2025",
     "assets/img/seminar-02.jpg", "seminar.html"),
    ("event/80-tahun-indonesia-saatnya-meneguhkan-governansi-dan-integritas-korporasi",
     "artikel-80-tahun-indonesia", "page.seminar", "Agustus 2025", "August 2025",
     "assets/img/seminar-03.jpg", "seminar.html"),
    ("media/kaki-hadir-dalam-oecd-fact-finding-mission-dorong-integritas-dan-kepastian-hukum-dalam-proses-aksesi-indonesia-ke-oecd",
     "artikel-oecd-fact-finding", "page.news", "Juni 2026", "June 2026",
     "assets/img/news-1.jpg", "news.html"),
    ("media/ketua-kaki-erry-riyana-hardjapamekas-tekankan-pentingnya-reformasi-antikorupsi-di-forum-unodc",
     "artikel-forum-unodc", "page.news", "Maret 2026", "March 2026",
     "assets/img/news-2.jpg", "news.html"),
    ("media/kaki-perkuat-komitmen-global-dalam-pemberantasan-korupsi-di-ace-award-2025-dan-11th-cosp-doha-qatar",
     "artikel-ace-award-doha", "page.news", "14–16 Desember 2025", "14–16 December 2025",
     "assets/img/news-3.jpg", "news.html"),
]

KEEP = {"p", "strong", "em", "a", "br", "ul", "ol", "li", "h2", "h3"}
RENAME = {"b": "strong", "i": "em"}


MOJI = re.compile(r"[\u00c3\u00c2]\S|\u00e2\u20ac")


def _to_bytes(seg: str) -> bytes:
    """Kembalikan karakter menjadi byte cp1252.

    Lima posisi (0x81 0x8D 0x8F 0x90 0x9D) kosong di cp1252 tetapi tetap dipakai
    oleh sistem asalnya — misalnya tanda kutip penutup ” yang byte ketiganya
    0x9D. Untuk itu dipakai nilai byte langsung sebagai cadangan.
    """
    out = bytearray()
    for ch in seg:
        try:
            out.extend(ch.encode("cp1252"))
        except UnicodeEncodeError:
            if ord(ch) < 256:
                out.append(ord(ch))
            else:
                raise
    return bytes(out)


def _repair_segment(seg: str) -> str:
    """Baca ulang runtun sebagai UTF-8. Bila ternyata bukan mojibake, biarkan."""
    try:
        return _to_bytes(seg).decode("utf-8")
    except (UnicodeEncodeError, UnicodeDecodeError):
        return seg


# Runtun karakter yang khas muncul akibat salah-baca UTF-8 sebagai cp1252.
MOJI_RUN = re.compile(
    "[\u0080-\u00ff\u0152\u0153\u0160\u0161\u0178\u017d\u017e\u0192"
    "\u02c6\u02dc\u2013\u2014\u2018\u2019\u201a\u201c\u201d\u201e"
    "\u2020\u2021\u2022\u2026\u2030\u2039\u203a\u20ac\u2122]+"
)


def _repair_pass(text: str) -> str:
    """Satu lintasan perbaikan, dikerjakan per runtun mojibake.

    Sengaja tidak memproses seluruh dokumen sekaligus: satu karakter di luar
    cp1252 di tempat lain tidak boleh membatalkan perbaikan bagian yang lain.
    Runtun yang ternyata bukan mojibake (mis. en dash yang sudah benar) gagal
    di-decode sebagai UTF-8 dan otomatis dibiarkan apa adanya.
    """
    return MOJI_RUN.sub(lambda m: _repair_segment(m.group(0)), text)


def demojibake(text: str) -> str:
    """Perbaiki teks UTF-8 yang terlanjur ditulis sebagai cp1252 — pada sumber
    ini pengkodean gandanya berlapis dua, jadi lintasan diulang."""
    for _ in range(3):
        if not MOJI.search(text):
            break
        fixed = _repair_pass(text)
        if fixed == text:
            break
        text = fixed
    return text


def unwrap_full_strong(par: str) -> str:
    """Editor lama membungkus seluruh paragraf dengan <strong>; itu dilepas
    supaya badan artikel tidak tercetak tebal semua."""
    inner = par
    while True:
        m = re.fullmatch(r"\s*<strong>(.*)</strong>\s*", inner, re.S)
        if not m:
            break
        cand = m.group(1)
        # hanya lepas bila memang membungkus penuh (tidak ada </strong> di tengah)
        if "</strong>" in cand and not re.fullmatch(r"\s*<strong>.*</strong>\s*", cand, re.S):
            break
        inner = cand
    return inner


def clean_body(raw: str) -> str:
    # 1. entitas dulu — mojibake pada sumber tersimpan sebagai &Atilde;&cent;…
    s = html.unescape(raw)
    s = demojibake(s)

    # 2. buang komentar dan tag pembungkus yang tidak dipakai
    s = re.sub(r"(?s)<!--.*?-->", "", s)
    s = re.sub(r"(?is)</?(html|body|head|figure|table|tbody|tr|td|span|div|font)[^>]*>", "", s)

    def tag(m):
        closing, name, attrs = m.group(1), m.group(2).lower(), m.group(3)
        name = RENAME.get(name, name)
        if name not in KEEP:
            return ""
        if closing:
            return "</%s>" % name
        if name == "br":
            return "<br>"
        if name == "a":
            href = re.search(r'href\s*=\s*"([^"]*)"', attrs or "")
            if not href:
                return ""
            return '<a href="%s">' % html.escape(href.group(1), quote=True)
        return "<%s>" % name

    s = re.sub(r"<(/?)(\w+)((?:\s[^>]*)?)/?>", tag, s)

    # 3. rapikan spasi
    s = s.replace("\u00a0", " ")
    s = re.sub("[\u0080-\u009f]", "", s)   # sisa karakter kendali C1
    s = re.sub(r"\s+", " ", s).strip()

    # 4. bangun ulang paragraf — sumbernya banyak <p> yang tidak pernah ditutup
    s = re.sub(r"(?i)</p>", "", s)
    chunks = [c.strip() for c in re.split(r"(?i)<p>", s)]

    paragraphs = []
    for c in chunks:
        c = re.sub(r"(?i)^(<br>\s*)+|(\s*<br>)+$", "", c).strip()
        c = re.sub(r"(?i)(<br>\s*){2,}", "<br>", c)
        # rapatkan tag kembar bersarang: <strong><strong>x</strong></strong>
        for t in ("strong", "em"):
            c = re.sub(r"(?is)<%s>\s*<%s>" % (t, t), "<%s>" % t, c)
            c = re.sub(r"(?is)</%s>\s*</%s>" % (t, t), "</%s>" % t, c)
        c = unwrap_full_strong(c).strip()
        # buang tag yang tersisa tanpa isi
        c = re.sub(r"(?is)<(strong|em)>\s*</\1>", "", c).strip()
        if not c or not re.sub(r"(?s)<[^>]+>", "", c).strip():
            continue
        paragraphs.append(c)

    # 5. amankan & yang berdiri sendiri
    out = "\n          ".join("<p>%s</p>" % p for p in paragraphs)
    out = re.sub(r"&(?![a-zA-Z#][a-zA-Z0-9]*;)", "&amp;", out)
    return out


def fetch(url: str) -> str:
    req = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(req, timeout=30) as r:
        return r.read().decode("utf-8", "replace")


PAGE = """<!--@meta
title: {title_short} — CAC Indonesia
title_en: {title_short} — CAC Indonesia
description: {desc}
description_en: {desc}
page: {slug}
output: {slug}.html
-->
    <!-- ============================================================
         DETAIL ARTIKEL — struktur sama dengan events/show.blade.php
         dan medias/show.blade.php (isinya identik):
           .portfolio-details__img   → thumbnail
           .portfolio-details__title → $event->title / $media->title
           .portfolio-details__content → {{!! $event->body !!}}
         Sumber asli: {source}
         ============================================================ -->
    <section class="portfolio-details">
      <div class="container">

        <div class="row">
          <div class="col-xl-12">

            <p class="portfolio-details__back">
              <a href="{parent}">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M19 12H5"/><path d="m12 19-7-7 7-7"/></svg>
                <span data-i18n="article.back">Kembali ke daftar</span>
              </a>
            </p>

            <div class="portfolio-details__img">
              <img src="{image}" width="1200" height="675" alt="" loading="eager" decoding="async">
            </div>

            <h1 class="portfolio-details__title text-center mt-4 pt-3">{title}</h1>

            <p class="portfolio-details__meta">
              <span class="news-one__tag" data-i18n="{cat_key}">{cat_key}</span>
              <span class="news-one__date"><span lang="id">{date_id}</span><span lang="en">{date_en}</span></span>
            </p>

          </div>
        </div>

        <div class="portfolio-details__content">
          {body}
        </div>

      </div>
    </section>
"""


def main() -> int:
    for path, slug, cat_key, date_id, date_en, image, parent in ARTICLES:
        url = "%s/%s" % (BASE, path)
        try:
            page = fetch(url)
        except Exception as exc:                       # noqa: BLE001
            print("[artikel] GAGAL %s — %s" % (url, exc), file=sys.stderr)
            return 1

        m_title = re.search(r'portfolio-details__title[^>]*>(.*?)</h3>', page, re.S)
        m_body = re.search(
            r'<div class="portfolio-details__content">(.*?)</div>\s*</div>\s*</section>', page, re.S)
        if not m_title or not m_body:
            print("[artikel] struktur tak dikenali: %s" % url, file=sys.stderr)
            return 1

        title = re.sub(r"\s+", " ", demojibake(re.sub(r"<[^>]+>", "", m_title.group(1)))).strip()
        body = clean_body(m_body.group(1))

        plain = re.sub(r"<[^>]+>", "", body)
        desc = re.sub(r"\s+", " ", plain).strip()[:180].rsplit(" ", 1)[0] + "…"

        short = title if len(title) <= 70 else title[:67].rsplit(" ", 1)[0] + "…"

        (OUT / ("%s.html" % slug)).write_text(
            PAGE.format(slug=slug, title=html.escape(title), title_short=html.escape(short),
                        desc=html.escape(desc), cat_key=cat_key, date_id=date_id, date_en=date_en,
                        image=image, parent=parent, source=url, body=body),
            encoding="utf-8")
        print("  src/pages/%-28s %5d char" % (slug + ".html", len(body)))

    print("selesai — jalankan: python3 build.py")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
