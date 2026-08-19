#!/usr/bin/env python3
"""
Pemeriksa hasil build.

Mengecek untuk setiap file .html di root:
  - semua tautan internal & aset benar-benar ada
  - anchor #… punya target
  - tag HTML seimbang (komentar & <script> diabaikan)
  - id unik
  - setiap <img> punya alt
  - tidak ada token {{…}} atau @include yang tersisa
  - setiap kunci data-i18n ada di kamus js/i18n.js, dan kamus ID = kamus EN
  - melaporkan kunci kamus yang tidak dipakai

Pakai:  python3 tools/validate.py
"""

import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent

TAGS = ['html', 'head', 'body', 'header', 'nav', 'main', 'section', 'footer', 'div', 'article',
        'ul', 'ol', 'li', 'form', 'svg', 'a', 'p', 'span', 'button', 'aside', 'figure', 'table',
        'thead', 'tbody', 'tr', 'td', 'th', 'details', 'summary', 'h1', 'h2', 'h3', 'h4',
        'iframe', 'blockquote', 'caption', 'b', 'em', 'strong']

COMMENT = re.compile(r'(?s)<!--.*?-->')
SCRIPT = re.compile(r'(?s)<script.*?</script>')
I18N_ATTR = re.compile(r'data-i18n(?:-html|-ph|-aria)?="([^"]+)"')
DICT_KEY = re.compile(r"^\s*'([A-Za-z0-9.]+)'\s*:", re.M)


def strip(html: str) -> str:
    return SCRIPT.sub('', COMMENT.sub('', html))


def dict_keys():
    js = (ROOT / 'js' / 'i18n.js').read_text(encoding='utf-8')
    id_start, en_start = js.index('    id: {'), js.index('    en: {')
    return (set(DICT_KEY.findall(js[id_start:en_start])),
            set(DICT_KEY.findall(js[en_start:])))


def main() -> int:
    problems = []
    pages = [p for p in sorted(ROOT.glob('*.html')) if not p.name.startswith('_')]
    if not pages:
        print('[validate] tidak ada halaman — jalankan build.py dulu', file=sys.stderr)
        return 1

    keys_id, keys_en = dict_keys()
    if keys_id - keys_en:
        problems.append('kunci hanya ada di ID: %s' % sorted(keys_id - keys_en))
    if keys_en - keys_id:
        problems.append('kunci hanya ada di EN: %s' % sorted(keys_en - keys_id))

    used_keys = set()

    # Sebagian kunci hanya dipanggil saat runtime dari JavaScript (mis. label
    # tombol kuis dan teks hasil), jadi ikut dipindai supaya tidak dikira mati.
    for js_name in ("main.js", "i18n.js"):
        js_path = ROOT / "js" / js_name
        if js_path.exists():
            js_src = js_path.read_text(encoding="utf-8")
            used_keys |= set(re.findall(r"t\(\s*'([A-Za-z0-9.]+)'", js_src))
            used_keys |= set(re.findall(r"'(quiz\.lvl\d[TD])'", js_src))
            used_keys |= set(re.findall(r"setAttribute\(\s*'data-i18n'\s*,\s*'([A-Za-z0-9.]+)'", js_src))

    for page in pages:
        raw = page.read_text(encoding='utf-8')
        body = strip(raw)
        name = page.name

        used_keys |= set(I18N_ATTR.findall(raw))

        ids = re.findall(r'\sid="([^"]+)"', body)
        dup = [k for k, v in collections.Counter(ids).items() if v > 1]
        if dup:
            problems.append('%s: id ganda %s' % (name, dup))

        for ref in re.findall(r'(?:href|src)="([^"]+)"', body):
            if ref.startswith(('http', 'mailto:', 'tel:', 'data:', 'javascript:')):
                continue
            if ref.startswith('#'):
                if ref[1:] and ref[1:] not in ids:
                    problems.append('%s: anchor mati %s' % (name, ref))
                continue
            target = ROOT / ref.split('#')[0]
            if not target.exists():
                problems.append('%s: berkas tidak ada -> %s' % (name, ref))

        for tag in TAGS:
            opened = len(re.findall(r'<%s[\s>]' % tag, body))
            closed = body.count('</%s>' % tag)
            if opened != closed:
                problems.append('%s: <%s> %d buka / %d tutup' % (name, tag, opened, closed))

        if '{{' in body or '@include' in body or 'MISSING PARTIAL' in body:
            problems.append('%s: masih ada token yang belum diproses' % name)

        # index punya 1 <h1>; halaman dwibahasa punya 2 (blok ID + blok EN)
        n_h1 = len(re.findall(r'<h1[\s>]', body))
        if n_h1 not in (1, 2):
            problems.append('%s: jumlah <h1> = %d' % (name, n_h1))

        for img in re.findall(r'<img[^>]*>', body):
            if 'alt=' not in img:
                problems.append('%s: <img> tanpa alt' % name)
            if 'loading=' not in img:
                problems.append('%s: <img> tanpa loading' % name)

    missing = sorted(k for k in used_keys if k not in keys_id)
    if missing:
        problems.append('data-i18n tanpa entri kamus: %s' % missing)

    css = (ROOT / 'css' / 'style.css').read_text(encoding='utf-8')
    if css.count('{') != css.count('}'):
        problems.append('css/style.css: kurung kurawal tidak seimbang')

    unused = sorted(k for k in keys_id if k not in used_keys)

    print('halaman: %d | kunci kamus: %d | dipakai: %d' % (len(pages), len(keys_id), len(used_keys)))
    if unused:
        print('kunci kamus tidak terpakai: %s' % unused)
    if problems:
        print('\nMASALAH:')
        for p in problems:
            print('  -', p)
        return 1
    print('VALID — tautan, tag, id, gambar, token, dan kamus i18n semuanya bersih.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
