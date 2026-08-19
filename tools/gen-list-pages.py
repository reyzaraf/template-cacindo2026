#!/usr/bin/env python3
"""
Generator halaman daftar (seminar / training / news / in-the-news / podcast /
video / image).

Semua halaman ini di Laravel memakai satu view yang sama:
  - events.blade.php  → $events  (section.news-one + grid col-xl-6)
  - medias.blade.php  → $medias  (struktur identik)

Skrip ini menuliskan file ke src/pages/ dengan struktur & nama class yang
persis sama, supaya porting balik ke blade cukup mengganti isi @foreach.

Pakai:  python3 tools/gen-list-pages.py && python3 build.py
"""

import html
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "src" / "pages"

CAL_ICON = ('<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" '
            'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
            '<rect x="3" y="4" width="18" height="17" rx="2"/><path d="M3 10h18"/>'
            '<path d="M8 2v4"/><path d="M16 2v4"/></svg>')
NEWS_ICON = ('<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" '
             'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
             '<path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2zm0 0a2 2 0 0 1-2-2v-9h4"/>'
             '<path d="M18 14h-8M18 18h-8M18 10h-8"/></svg>')
ARROW_ICON = ('<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" '
              'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
              '<path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>')
MORE_ICON = ('<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" '
             'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
             '<path d="m13 17 5-5-5-5"/><path d="m6 17 5-5-5-5"/></svg>')

BASE = "https://cac-indonesia.or.id"


MONTHS = {'Januari':'January','Februari':'February','Maret':'March','April':'April',
          'Mei':'May','Juni':'June','Juli':'July','Agustus':'August','September':'September',
          'Oktober':'October','November':'November','Desember':'December'}


def when_en(txt):
    """Terjemahkan label waktu ID → EN (di Laravel ini otomatis oleh diffForHumans())."""
    m = re.match(r'^(\d+) (bulan|tahun) yang lalu$', txt)
    if m:
        n, unit = m.group(1), m.group(2)
        word = ('month' if unit == 'bulan' else 'year') + ('s' if n != '1' else '')
        return f'{n} {word} ago'
    out = txt
    for idn, eng in MONTHS.items():
        out = out.replace(idn, eng)
    return out


def bilingual(id_txt, en_txt):
    return f'<span lang="id">{id_txt}</span><span lang="en">{en_txt}</span>'


def card(item, tag_key, index, img):
    """Satu .news-one__single — desain kartu baru (kategori + tanggal di atas judul)."""
    url = item.get("url")
    title = html.escape(item["title"])
    excerpt = html.escape(item["excerpt"])
    when = html.escape(item["when"])
    delay = (index % 2) * 100

    title_el = f'<a href="{url}">{title}</a>' if url else f'<span>{title}</span>'
    if url:
        more = (f'<span class="news-one__read-more">'
                f'<span data-i18n="card.readMore">Selengkapnya</span>{MORE_ICON}</span>')
    else:
        more = ('<span class="news-one__read-more news-one__read-more--muted">'
                '<span lang="id">Arsip lengkap tersedia di situs KAKI</span>'
                '<span lang="en">Full archive available on the KAKI website</span></span>')

    return f'''
          <div class="col-xl-6 col-lg-6 col-sm-12 reveal" style="--delay:{delay}ms">
            <div class="news-one__single">
              <div class="news-one__img">
                <img src="{img}" width="800" height="450" alt="" loading="lazy" decoding="async">
              </div>
              <div class="news-one__content">
                <div class="news-one__meta">
                  <span class="news-one__tag">{NEWS_ICON}<span data-i18n="{tag_key}">{tag_key}</span></span>
                  <span class="news-one__date">{CAL_ICON}{bilingual(when, html.escape(when_en(item["when"])))}</span>
                </div>
                <h3 class="news-one__title">{title_el}</h3>
                <p class="news-one__text">{excerpt}</p>
                {more}
              </div>
            </div>
          </div>'''


EMPTY = '''
          <div class="col-xl-12">
            <div class="empty-state">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2zm0 0a2 2 0 0 1-2-2v-9h4"/><path d="M18 14h-8M18 18h-8"/></svg>
              <p data-i18n="list.empty">Belum ada konten pada kategori ini. Konten akan tampil otomatis setelah ditambahkan lewat admin panel.</p>
            </div>
          </div>'''


def page(slug, title, title_en, desc, desc_en, title_key, tag_key, items, source, imgs):
    cards = "".join(card(it, tag_key, i, imgs[i % len(imgs)]) for i, it in enumerate(items)) or EMPTY
    return f'''<!--@meta
title: {title}
title_en: {title_en}
description: {desc}
description_en: {desc_en}
page: {slug}
output: {slug}.html
-->
    <!-- ============================================================
         {slug.upper()} — struktur sama dengan {source}
         ============================================================ -->
    <section class="news-one">
      <div class="container">

        <div class="section-title text-center reveal">
          <div class="section-sub-title-box">
            <div class="section-title-shape-1" aria-hidden="true"></div>
            <p class="section-sub-title" data-i18n="list.sub">informasi terkini</p>
            <div class="section-title-shape-2" aria-hidden="true"></div>
          </div>
          <h1 class="section-title__title" data-i18n="{title_key}">{title_key}</h1>
        </div>

        <div class="row">{cards}
        </div>

      </div>
    </section>
'''


# ---------------------------------------------------------------- data nyata
E = f"{BASE}/event"
M = f"{BASE}/media"

SEMINAR = [
    dict(when="18 Juni 2026", title="KAKI Dorong Transparansi Kepemilikan untuk Memperkuat Integritas Pasar Modal Indonesia",
         excerpt="KAKI dan IICD bekerja sama dengan Bursa Efek Indonesia (BEI), didukung CIPE, AEI, dan IGCN, menyelenggarakan “Strengthening Market Integrity: Towards a New Era of Ownership Transparency in the Capital Market” di Main Hall BEI, Jakarta.",
         url="artikel-pasar-modal.html"),
    dict(when="Desember 2025", title="Webinar KAKI — KUHP 2023 dan Dunia Usaha: Integritas Beralih dari Nilai Moral ke Strategi Perlindungan Korporasi",
         excerpt="Dalam rangka HAKORDIA 2025, webinar KAKI bersama IICD menegaskan bahwa integritas kini menjadi tameng strategis bagi korporasi dan para pengurusnya menjelang berlakunya KUHP 2023 pada Januari 2026.",
         url="artikel-kuhp-2023.html"),
    dict(when="Agustus 2025", title="80 Tahun Indonesia, Saatnya Meneguhkan Governansi dan Integritas Korporasi",
         excerpt="Membahas peran sektor swasta lewat penerapan governansi korporat yang baik — dari prinsip TARIF hingga empat pilar ETAK (Etika, Akuntabilitas, Transparansi, Keberlanjutan) yang diperbarui KNKG pada 2021.",
         url="artikel-80-tahun-indonesia.html"),
    dict(when="25 September 2024", title="Leveraging Technology to Fight Corruption",
         excerpt="KAKI dan CIPE menyelenggarakan Roundtable “Teknologi untuk Anti-Korupsi”, menghadirkan sektor swasta, pemerintah, dan asosiasi bisnis untuk membahas pemanfaatan teknologi dalam memperkuat integritas."),
    dict(when="25 September 2024", title="Enhancing Beneficial Ownership Transparency in Indonesia: Private Sector Perspectives",
         excerpt="Roundtable KAKI dan CIPE mempertemukan sektor swasta, regulator, dan asosiasi bisnis untuk membahas perkembangan regulasi beneficial ownership di Indonesia."),
    dict(when="29 Agustus 2024", title="OECD – Basel Institute on Governance Southeast Asia Anti-Corruption Collective Action Workshop",
         excerpt="Di Bangkok, Ketua KAKI Erry Riyana Hardjapamekas memimpin sesi “Finding Incentives: How to Incentivize Private Sectors to Join Collective Action Against Corruption”."),
    dict(when="30–31 Juli 2024", title="Workshop Anti Korupsi di Balikpapan: Menggalang Persepsi Bersama untuk Pemberantasan Korupsi",
         excerpt="Kerja sama UNODC Indonesia, IGCN, dan KPK. Ketua KAKI menekankan pentingnya aksi kolektif serta peran digitalisasi dalam meminimalkan celah penyuapan."),
    dict(when="2 tahun yang lalu", title="KAKI bekerja sama dengan APINDO melakukan Members Gathering",
         excerpt="Bertajuk “Melindungi Bisnis dari Suap dan Korupsi: Memahami dampak undang-undang anti korupsi terhadap bisnis & efektivitas sistem anti suap untuk melindungi perusahaan”."),
    dict(when="2 tahun yang lalu", title="KAKI melakukan Audiensi ke Sesmen Koperasi dan UKM",
         excerpt="Sosialisasi Sistem Kepatuhan Anti Korupsi kepada Inspektur dan Deputi Kementerian Koperasi dan UKM, yang mendukung pengembangan sistem antisuap dan sertifikasi untuk koperasi dan usaha menengah."),
    dict(when="8 Desember 2023", title="KAKI Merayakan Hakordia melalui Peluncuran Buku Pedoman Aksi Kolektif Anti-Korupsi",
         excerpt="IGCN bersama KAKI, TII, Univ. Paramadina, ICC Indonesia, dan PPM Manajemen meluncurkan Buku Pedoman Melawan Korupsi melalui Aksi Kolektif."),
    dict(when="3 tahun yang lalu", title="KAKI Menang Anti-Corruption Excellence Award diselenggarakan oleh UNODC & ROLACC",
         excerpt="KAKI memenangkan Sheikh Tamim bin Hamad Al Thani Anti-Corruption Excellence Award untuk kategori Youth Creativity and Engagement."),
    dict(when="25 November 2022", title="Forum KAKI “Arah Kebijakan dan Tantangan tahun 2023: Pencegahan Korupsi oleh Sektor Swasta”",
         excerpt="Membahas peran sektor swasta dalam memerangi korupsi yang menghambat pertumbuhan ekonomi dan meningkatkan 10% dari total biaya aktivitas bisnis secara global."),
    dict(when="10 Oktober 2022", title="B20 Side Event Panel Discussion: Collective Action in Alleviating Integrity Risks",
         excerpt="KAKI mengisi sesi panel ketiga B20 Side Event untuk membagikan pengalaman koalisi aksi kolektif bisnis dalam melawan korupsi di Indonesia."),
    dict(when="9 Agustus 2022", title="Advancing Collective Action Against Corruption on Agribusiness Sector FGD",
         excerpt="Kolaborasi IGCN dengan KAKI, Paramadina University, Transparency International Indonesia, dan ICC Indonesia membahas korupsi di sektor agribisnis."),
    dict(when="3 tahun yang lalu", title="KAKI dalam 13th IICD CG Award",
         excerpt="Sekretariat IICD dan KAKI bekerja sama mempromosikan program KAKI ke lebih banyak perusahaan dalam acara 13th IICD CG Award 2022."),
    dict(when="30 November 2021", title="KAKI–IIPG Webinar",
         excerpt="Webinar bersama IIPG pada Selasa, 30 November 2021."),
    dict(when="31 Agustus 2021", title="KAKI Webinar “Managing the Risk of Bribery Amidst the Pandemic in the Private Sector”",
         excerpt="Webinar KAKI membahas pengelolaan risiko penyuapan di sektor swasta pada masa pandemi."),
    dict(when="7 Juli 2021", title="KAKI menghadirkan sesi dalam International Business Ethics Conference 2021",
         excerpt="Sesi bertajuk “Anti-Corruption Culture in Organization & KAKI (Koalisi Anti Korupsi Indonesia)” pada hari pertama IBEC 2021."),
    dict(when="1 Juli 2020", title="Establishment of CAC Advisory Committee",
         excerpt="CAC membentuk Advisory Committee yang beranggotakan sejumlah asosiasi bisnis."),
    dict(when="3 tahun yang lalu", title="The Establishment of Anti-Corruption Task Force",
         excerpt="IICD secara internal membentuk Anti-Corruption Task Force untuk membantu implementasi program CAC di Indonesia."),
    dict(when="25 Juni 2019", title="Workshop “Collective Action Coalition Against Corruption in Indonesian Private Sector: Issues and Challenges”",
         excerpt="Dua belas perusahaan yang tertarik pada program CAC mengikuti workshop yang diselenggarakan IICD."),
]

TRAINING = [
    dict(when="27 Februari 2024", title="KAKI Mensosialisasikan Peran Swasta dalam Implementasi IPEF (Indo-Pacific Economic Framework)",
         excerpt="Roundtable Discussion bertajuk “Galvanizing the Private Sector: IPEF Commitments (Pilar 4) dan Dampaknya terhadap Dunia Usaha Indonesia” bersama IICD dan CIPE."),
    dict(when="19–20 Desember 2023", title="KAKI Menekankan Pentingnya Bisnis dalam upaya Anti-Korupsi dalam Integrity Champions Forum, Tashkent, Uzbekistan",
         excerpt="KAKI hadir sebagai pembicara dalam “Integrity Champions Forum panel 1: International Perspectives on Corruption”."),
    dict(when="13 November 2023", title="KAKI mengadvokasi Pentingnya Aksi Kolektif Bisnis untuk Memerangi Korupsi",
         excerpt="Ketua KAKI, Erry Riyana Hardjapamekas, menjadi pembicara pada Workshop KPK–UNODC “Review Implementasi UNCAC di Indonesia” — satu-satunya pembicara dari pihak swasta."),
    dict(when="27 September 2023", title="KAKI Conference: “Strengthening Business Integrity: Creating a sustainable Economic Community in the ASEAN Indo-Pacific Region”",
         excerpt="Konferensi Koalisi Aksi Kolektif Bisnis bertema penguatan integritas bisnis di kawasan Indo-Pasifik ASEAN, di Jakarta."),
    dict(when="26 September 2023", title="Roundtable Discussion tentang Pilar 4: Fair Economy untuk Indo Pacific Economic Framework (IPEF)",
         excerpt="KAKI bekerja sama dengan Center for International Private Enterprise mengembangkan white paper tentang Pilar 4: Fair Economy untuk IPEF."),
    dict(when="10 Juni 2023", title="KAKI hadir dalam Rapat Pansel Calon Pimpinan dan Dewan Pengawas KPK 2024-2029 dari unsur CSO",
         excerpt="Anggota Taskforce KAKI, James Simanjuntak, menyampaikan masukan CSO terkait seleksi calon pimpinan dan Dewan Pengawas KPK, menekankan tata kelola dan etika moral sebagai kriteria terpenting."),
    dict(when="22–23 Mei 2023", title="Kick Off Program Sertifikasi Koalisi Anti Korupsi Indonesia",
         excerpt="Pelatihan Asesor Asesmen Mandiri KAKI diikuti PT MaxPower, PT Sigma Energy Compressindo Tbk, PT Mitra Bhadra Consulting, PT Binaman Utama, PT Supra International, PT Selamat Sempurna Tbk, dan PT Voksel Indonesia Tbk, dihadiri perwakilan CAC Thailand dan CIPE."),
    dict(when="3 tahun yang lalu", title="KAKI Assesment Workshop 75 Checklist",
         excerpt="Dalam acara ini PT Moya Indonesia dan PT Selamat Sempurna Tbk menandatangani declaration of intent, menyusul PT Max Power Indonesia, PT Sigma Energi Compressindo Tbk, PT Supra Internasional, PT Island Concepts Indonesia Tbk, CV Sembiring Consultant, dan CV Sembiring Ferdianza."),
    dict(when="3 tahun yang lalu", title="Focus Group Discussion: Council for The Coalition",
         excerpt="Sejumlah asosiasi bisnis terkemuka di Indonesia membentuk Council for the CAC Program untuk memandu dan mengundang perusahaan bergabung dalam koalisi."),
]

NEWS = [
    dict(when="1 bulan yang lalu", title="KAKI Hadir dalam OECD Fact-Finding Mission, Dorong Integritas dan Kepastian Hukum dalam Proses Aksesi Indonesia ke OECD",
         excerpt="Koalisi Anti Korupsi Indonesia (KAKI), yang diwakili oleh Ketua KAKI, Erry Riyana Hardjapamekas, berpartisipasi dalam OECD Fact-Finding Mission dan Gap Analysis terkait OECD Anti-Bribery Convention.",
         url="artikel-oecd-fact-finding.html"),
    dict(when="5 bulan yang lalu", title="Ketua KAKI Erry Riyana Hardjapamekas Tekankan Pentingnya Reformasi Antikorupsi di Forum UNODC",
         excerpt="Ketua Koalisi Anti Korupsi Indonesia menjadi narasumber dalam UNODC National Workshop dan menegaskan pentingnya percepatan reformasi hukum antikorupsi di Indonesia.",
         url="artikel-forum-unodc.html"),
    dict(when="6 bulan yang lalu", title="KAKI Perkuat Komitmen Global dalam Pemberantasan Korupsi di ACE Award 2025 dan 11th CoSP Doha Qatar",
         excerpt="KAKI menegaskan kembali komitmennya terhadap integritas, transparansi, dan praktik bisnis beretika melalui partisipasi aktif dalam rangkaian forum anti-korupsi internasional di Doha, Qatar, pada 14–16 Desember 2025.",
         url="artikel-ace-award-doha.html"),
]

# Gambar diambil dari situs asli dan diurutkan sama persis dengan daftar di
# sana, sehingga tiap kegiatan memakai fotonya sendiri (lihat tools/fetch-images.py).
SEMINAR_IMGS  = [f"assets/img/seminar-{i:02d}.jpg" for i in range(1, 22)]
TRAINING_IMGS = [f"assets/img/training-{i:02d}.jpg" for i in range(1, 10)]
NEWS_IMGS     = [f"assets/img/news-{i}.jpg" for i in (1, 2, 3, 4)]

PAGES = [
    ("seminar", "Seminar — CAC Indonesia", "Seminar — CAC Indonesia",
     "Arsip seminar, webinar, forum, dan roundtable Koalisi Anti Korupsi Indonesia (KAKI) sejak 2019.",
     "Archive of seminars, webinars, forums, and roundtables of the Indonesia Anti-Corruption Coalition since 2019.",
     "page.seminar", "page.seminar", SEMINAR, "events.blade.php ($events, category=seminar)", SEMINAR_IMGS),

    ("training", "Pelatihan — CAC Indonesia", "Training — CAC Indonesia",
     "Arsip pelatihan, workshop asesor 75 Checklist, roundtable, dan advokasi kebijakan KAKI.",
     "Archive of KAKI training, 75 Checklist assessor workshops, roundtables, and policy advocacy.",
     "page.training", "page.training", TRAINING, "events.blade.php ($events, category=training)", TRAINING_IMGS),

    ("news", "Berita — CAC Indonesia", "News — CAC Indonesia",
     "Semua berita resmi dari Koalisi Anti Korupsi Indonesia (KAKI).",
     "All official news from the Indonesia Anti-Corruption Coalition (KAKI).",
     "page.news", "page.news", NEWS, "medias.blade.php ($medias, category=news)", NEWS_IMGS),

    ("in-the-news", "Liputan Media — CAC Indonesia", "In The News — CAC Indonesia",
     "Liputan media massa tentang Koalisi Anti Korupsi Indonesia (KAKI).",
     "Press coverage about the Indonesia Anti-Corruption Coalition (KAKI).",
     "page.inthenews", "page.inthenews", [], "medias.blade.php ($medias, category=in the news)", NEWS_IMGS),

    ("podcast", "Podcast — CAC Indonesia", "Podcast — CAC Indonesia",
     "Podcast Koalisi Anti Korupsi Indonesia (KAKI).",
     "Podcasts from the Indonesia Anti-Corruption Coalition (KAKI).",
     "page.podcast", "page.podcast", [], "medias.blade.php ($medias, category=podcast)", NEWS_IMGS),

    ("video", "Video — CAC Indonesia", "Video — CAC Indonesia",
     "Video Koalisi Anti Korupsi Indonesia (KAKI) — kanal YouTube resmi.",
     "Videos from the Indonesia Anti-Corruption Coalition (KAKI) — official YouTube channel.",
     "page.video", "page.video", [], "medias.blade.php ($medias, category=video)", NEWS_IMGS),

    ("image", "Galeri Foto — CAC Indonesia", "Photos — CAC Indonesia",
     "Galeri foto kegiatan Koalisi Anti Korupsi Indonesia (KAKI).",
     "Photo gallery of the Indonesia Anti-Corruption Coalition (KAKI).",
     "page.image", "page.image", [], "medias.blade.php ($medias, category=image)", NEWS_IMGS),
]

if __name__ == "__main__":
    for slug, title, title_en, desc, desc_en, title_key, tag_key, items, source, imgs in PAGES:
        (OUT / f"{slug}.html").write_text(
            page(slug, title, title_en, desc, desc_en, title_key, tag_key, items, source, imgs),
            encoding="utf-8")
        print(f"  src/pages/{slug}.html  ({len(items)} item)")
    print("selesai — jalankan: python3 build.py")
