#!/usr/bin/env python3
"""
Build script CAC Indonesia (KAKI).

Menggabungkan:
  src/layout.html      kerangka <head>/<body> bersama
  src/partials/*.html  komponen yang dipakai ulang (header, footer, section)
  src/pages/*.html     isi tiap halaman + meta-nya

menjadi file .html statis di root — bisa dibuka langsung lewat file://
maupun di-hosting di mana saja tanpa server aplikasi.

Pakai:  python3 build.py
"""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
LAYOUT = ROOT / "src" / "layout.html"
PARTIALS = ROOT / "src" / "partials"
PAGES = ROOT / "src" / "pages"

INCLUDE_RE = re.compile(r"^([ \t]*)<!--@include\s+([a-z0-9\-_]+)\s*-->[ \t]*$", re.MULTILINE)
META_RE = re.compile(r"^<!--@meta\s*\n(.*?)\n-->\s*\n", re.S)

BANNER = (
    "<!-- ============================================================\n"
    "     FILE INI DIHASILKAN OTOMATIS oleh build.py\n"
    "     Jangan edit langsung — ubah src/layout.html, src/pages/*.html,\n"
    "     atau src/partials/*.html lalu jalankan: python3 build.py\n"
    "     ============================================================ -->\n"
)

DEFAULTS = {
    "title": "CAC Indonesia — Koalisi Anti Korupsi Indonesia (KAKI)",
    "title_en": "",
    "description": "KAKI / CAC Indonesia — platform bagi sektor swasta Indonesia untuk secara kolektif melawan korupsi.",
    "description_en": "",
    "page": "",
    "output": "",
}


def parse_meta(raw: str) -> dict:
    """Baca blok <!--@meta ... --> di awal file halaman."""
    meta = dict(DEFAULTS)
    match = META_RE.match(raw)
    if not match:
        return meta, raw
    for line in match.group(1).splitlines():
        line = line.strip()
        if not line or ":" not in line:
            continue
        key, value = line.split(":", 1)
        meta[key.strip()] = value.strip()
    return meta, raw[match.end():]


def resolve_includes(html: str, missing: list) -> str:
    """Ganti setiap <!--@include nama--> dengan isi src/partials/nama.html."""

    def replace(match: "re.Match[str]") -> str:
        indent, name = match.group(1), match.group(2)
        partial = PARTIALS / f"{name}.html"
        if not partial.exists():
            missing.append(name)
            return f"{indent}<!-- MISSING PARTIAL: {name} -->"
        body = partial.read_text(encoding="utf-8").rstrip("\n")
        return body

    # dua lintasan: partial boleh memuat partial lain (satu tingkat)
    for _ in range(2):
        html, count = INCLUDE_RE.subn(replace, html)
        if not count:
            break
    return html


def main() -> int:
    if not LAYOUT.exists():
        print(f"[build] ERROR: layout tidak ditemukan: {LAYOUT}", file=sys.stderr)
        return 1
    if not PAGES.is_dir():
        print(f"[build] ERROR: folder halaman tidak ditemukan: {PAGES}", file=sys.stderr)
        return 1

    layout = LAYOUT.read_text(encoding="utf-8")
    sources = sorted(PAGES.glob("*.html"))
    if not sources:
        print("[build] ERROR: tidak ada file di src/pages/", file=sys.stderr)
        return 1

    missing = []
    built = []

    for source in sources:
        meta, content = parse_meta(source.read_text(encoding="utf-8"))
        output_name = meta["output"] or (source.stem + ".html")
        page_id = meta["page"] or source.stem

        html = layout
        html = html.replace("{{CONTENT}}", content.rstrip("\n"))
        html = html.replace("{{TITLE}}", meta["title"])
        html = html.replace("{{TITLE_EN}}", meta["title_en"] or meta["title"])
        html = html.replace("{{DESCRIPTION}}", meta["description"])
        html = html.replace("{{DESCRIPTION_EN}}", meta["description_en"] or meta["description"])
        html = html.replace("{{PAGE}}", page_id)
        html = html.replace("{{CANONICAL}}", "" if output_name == "index.html" else output_name)

        html = resolve_includes(html, missing)
        html = html.replace("<!DOCTYPE html>\n", "<!DOCTYPE html>\n" + BANNER, 1)

        (ROOT / output_name).write_text(html, encoding="utf-8")
        built.append(output_name)

    if missing:
        for name in sorted(set(missing)):
            print(f"[build] ERROR: partial hilang: src/partials/{name}.html", file=sys.stderr)
        return 1

    print(f"[build] OK — {len(built)} halaman dibuat:")
    for name in built:
        size = (ROOT / name).stat().st_size
        print(f"         {name:<22} {size:>7,} bytes")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
