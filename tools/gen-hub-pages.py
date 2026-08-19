#!/usr/bin/env python3
"""
Generator halaman hub dan halaman "sedang disiapkan" pada struktur situs baru.

Menulis ke src/pages/:
  knowledge-hub.html          hub Pusat Pengetahuan (3 kanal)
  resources.html              hub Sumber Daya KAKI (3 kanal)
  events-media.html           hub Kegiatan & Media (7 kanal)
  anti-corruption-101.html    materi belum tersedia
  regulations.html            materi belum tersedia ("on progress" di dokumen)
  resources-templates.html    materi belum tersedia ("on progress" di dokumen)
  resources-checklist.html    unduhan KAKI 75 Checklist (INA & ENG)
  resources-publications.html publikasi & referensi

Pakai:  python3 tools/gen-hub-pages.py && python3 build.py
"""

from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "src" / "pages"

ARROW = ('<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" '
         'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
         '<path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>')

ICONS = {
    "book": '<path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/>',
    "scale": '<path d="m16 11 4-7H4l4 7"/><path d="M12 4v16"/><path d="M8 20h8"/><circle cx="6" cy="13" r="3"/><circle cx="18" cy="13" r="3"/>',
    "toolbox": '<rect x="2" y="7" width="20" height="14" rx="2"/><path d="M8 7V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/><path d="M2 13h20"/>',
    "check": '<path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/>',
    "file": '<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><path d="M14 2v6h6"/><path d="M9 15h6"/>',
    "library": '<path d="M4 21V6a2 2 0 0 1 2-2h2v17H6a2 2 0 0 1-2-2z"/><path d="M12 4h2a2 2 0 0 1 2 2v15h-4z"/><path d="m18 7 3 12-2 1-3-12z"/>',
    "calendar": '<rect x="3" y="4" width="18" height="17" rx="2"/><path d="M3 10h18"/><path d="M8 2v4"/><path d="M16 2v4"/>',
    "cap": '<path d="M22 9 12 4 2 9l10 5 10-5z"/><path d="M6 11.5V16c0 1.5 2.7 3 6 3s6-1.5 6-3v-4.5"/>',
    "news": '<path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2zm0 0a2 2 0 0 1-2-2v-9h4"/><path d="M18 14h-8M18 18h-8M18 10h-8"/>',
    "mega": '<path d="m3 11 18-5v12L3 14v-3z"/><path d="M11.6 16.8a3 3 0 1 1-5.8-1.6"/>',
    "mic": '<rect x="9" y="2" width="6" height="12" rx="3"/><path d="M19 10v2a7 7 0 0 1-14 0v-2"/><path d="M12 19v3"/>',
    "play": '<rect x="2" y="5" width="20" height="14" rx="3"/><path d="m10 9 5 3-5 3z"/>',
    "image": '<rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="9" cy="9" r="2"/><path d="m21 15-4.5-4.5L7 20"/>',
    "clock": '<circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/>',
    "download": '<path d="M12 3v12"/><path d="m7 10 5 5 5-5"/><path d="M5 21h14"/>',
}


def icon(name, stroke="1.8"):
    return ('<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="%s" '
            'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">%s</svg>'
            % (stroke, ICONS[name]))


def card(href, ico, title_key, desc_key, gold=False, external=False):
    cls = "media-card media-card--gold" if gold else "media-card"
    attrs = ' target="_blank" rel="noopener noreferrer"' if external else ""
    return f'''
            <a class="{cls} reveal" href="{href}"{attrs}>
              <span class="media-card__icon" aria-hidden="true">{icon(ico)}</span>
              <h2 class="media-card__title" data-i18n="{title_key}">{title_key}</h2>
              <p class="media-card__desc" data-i18n="{desc_key}">{desc_key}</p>
              <span class="media-card__go">
                <span data-i18n="card.readMore">Selengkapnya</span>{ARROW}
              </span>
            </a>'''


HUB = '''<!--@meta
title: {title}
title_en: {title_en}
description: {desc}
description_en: {desc_en}
page: {slug}
output: {slug}.html
-->
    <!-- ============================================================
         {name} — halaman hub pada struktur situs baru.
         Memakai komponen kartu yang sama dengan halaman Media.
         ============================================================ -->
    <section class="services-one">

      <div class="services-one__top">
        <div class="container">
          <div class="section-title text-center reveal">
            <div class="section-sub-title-box">
              <div class="section-title-shape-1" aria-hidden="true"></div>
              <p class="section-sub-title" data-i18n="{sub_key}">{sub_key}</p>
              <div class="section-title-shape-2" aria-hidden="true"></div>
            </div>
            <h1 class="section-title__title" data-i18n="{title_key}">{title_key}</h1>
            <p class="section-title__text" data-i18n="{lead_key}">{lead_key}</p>
          </div>
        </div>
      </div>

      <div class="services-one__bottom">
        <div class="container">
          <div class="media-grid">{cards}
          </div>
        </div>
      </div>

    </section>
'''


SOON = '''<!--@meta
title: {title}
title_en: {title_en}
description: {desc}
description_en: {desc_en}
page: {slug}
output: {slug}.html
-->
    <!-- ============================================================
         {name} — materi belum tersedia.
         {note}
         Bagian "rancangan isi" di bawah adalah kerangka usulan, BUKAN naskah
         final; menunggu materi dari tim KAKI.
         ============================================================ -->
    <div class="container container--narrow">
      <div class="page-content">

        <p class="page-content__eyebrow">
          <span lang="id">Pusat Pengetahuan</span><span lang="en">Knowledge Hub</span>
        </p>
        <h1><span lang="id">{h1_id}</span><span lang="en">{h1_en}</span></h1>

        <div class="coming-soon reveal">
          <span class="coming-soon__badge">
            <span class="coming-soon__dot" aria-hidden="true"></span>
            <span data-i18n="soon.badge">Sedang disiapkan</span>
          </span>
          <h2 class="coming-soon__title" data-i18n="soon.title">Halaman ini sedang disiapkan</h2>
          <p class="coming-soon__lead" data-i18n="soon.lead">Materinya sedang disusun oleh tim KAKI dan akan tayang di halaman ini.</p>

          <div class="coming-soon__outline">
            <p class="coming-soon__outline-label" data-i18n="soon.willCover">Yang akan dibahas di halaman ini:</p>
            <ul>{outline}
            </ul>
          </div>

          <p class="coming-soon__contact" data-i18n="soon.contact">Butuh materinya lebih cepat? Hubungi sekretariat KAKI.</p>

          <div class="coming-soon__actions">
            <a class="thm-btn" href="contact.html">
              <span data-i18n="soon.cta">Hubungi Sekretariat</span>{arrow}
            </a>
            <a class="thm-btn btn--outline" href="knowledge-hub.html">
              <span data-i18n="soon.back">Kembali ke Pusat Pengetahuan</span>
            </a>
          </div>
        </div>

      </div>
    </div>
'''


def outline(items):
    return "".join(
        '\n              <li><span lang="id">%s</span><span lang="en">%s</span></li>' % (i, e)
        for i, e in items)


def write(name, text):
    (OUT / name).write_text(text, encoding="utf-8")
    print("  src/pages/%s" % name)


# ------------------------------------------------------------------ hub pages
write("knowledge-hub.html", HUB.format(
    slug="knowledge-hub", name="Knowledge Hub",
    title="Pusat Pengetahuan — CAC Indonesia",
    title_en="Knowledge Hub — CAC Indonesia",
    desc="Materi rujukan antikorupsi, regulasi nasional dan internasional, serta perangkat kerja KAKI.",
    desc_en="Anti-corruption reference material, national and international regulations, and KAKI's practical tools.",
    sub_key="hub.knowledgeSub", title_key="hub.knowledgeT", lead_key="hub.knowledgeLead",
    cards=(card("anti-corruption-101.html", "book", "nav.ac101", "hub.ac101D")
           + card("regulations.html", "scale", "nav.regulations", "hub.regulationsD", gold=True)
           + card("resources.html", "toolbox", "nav.resources", "hub.resourcesD"))))

write("resources.html", HUB.format(
    slug="resources", name="KAKI Resources",
    title="Sumber Daya KAKI — CAC Indonesia",
    title_en="KAKI Resources — CAC Indonesia",
    desc="Unduh KAKI 75 Checklist, templat kepatuhan anti-penyuapan, serta publikasi dan referensi.",
    desc_en="Download the KAKI 75 Checklist, anti-bribery compliance templates, and publications.",
    sub_key="hub.resourcesSub", title_key="hub.resourcesT", lead_key="hub.resourcesLead",
    cards=(card("resources-checklist.html", "check", "hub.checklistT", "hub.checklistD")
           + card("resources-templates.html", "file", "hub.templatesT", "hub.templatesD", gold=True)
           + card("resources-publications.html", "library", "hub.publicationsT", "hub.publicationsD"))))

write("events-media.html", HUB.format(
    slug="events-media", name="Events & Media",
    title="Kegiatan & Media — CAC Indonesia",
    title_en="Events & Media — CAC Indonesia",
    desc="Seminar, pelatihan, berita, liputan media, podcast, video, dan galeri foto Koalisi Anti Korupsi Indonesia.",
    desc_en="Seminars, training, news, press coverage, podcasts, videos, and the photo gallery of the Indonesia Anti-Corruption Coalition.",
    sub_key="hub.eventsSub", title_key="hub.eventsT", lead_key="hub.eventsLead",
    cards=(card("seminar.html", "calendar", "nav.seminar", "hub.seminarD")
           + card("training.html", "cap", "nav.training", "hub.trainingD", gold=True)
           + card("news.html", "news", "media.newsT", "media.newsD")
           + card("in-the-news.html", "mega", "media.inthenewsT", "media.inthenewsD", gold=True)
           + card("podcast.html", "mic", "media.podcastT", "media.podcastD")
           + card("video.html", "play", "media.videoT", "media.videoD", gold=True)
           + card("image.html", "image", "media.imageT", "media.imageD"))))

# --------------------------------------------------------- "sedang disiapkan"
write("anti-corruption-101.html", SOON.format(
    slug="anti-corruption-101", name="Anti-Corruption 101",
    title="Anti-Korupsi 101 — CAC Indonesia",
    title_en="Anti-Corruption 101 — CAC Indonesia",
    desc="Materi dasar antikorupsi untuk dunia usaha — sedang disiapkan oleh tim KAKI.",
    desc_en="Anti-corruption basics for the business sector — currently being prepared by the KAKI team.",
    note="Dokumen struktur situs hanya mencantumkan judulnya, belum ada naskah.",
    h1_id="Anti-Korupsi 101", h1_en="Anti-Corruption 101",
    arrow=ARROW,
    outline=outline([
        ("Apa itu korupsi dan bentuk-bentuknya dalam dunia usaha",
         "What corruption is and the forms it takes in business"),
        ("Mengapa korupsi merugikan perusahaan, bukan hanya negara",
         "Why corruption hurts companies, not just the state"),
        ("Penyuapan, gratifikasi, dan benturan kepentingan",
         "Bribery, gratuities, and conflicts of interest"),
        ("Tanggung jawab korporasi dan pengurusnya",
         "Corporate and management liability"),
        ("Langkah pertama membangun sistem pencegahan",
         "First steps in building a prevention system"),
    ])))

write("regulations.html", SOON.format(
    slug="regulations", name="Regulations",
    title="Regulasi — CAC Indonesia",
    title_en="Regulations — CAC Indonesia",
    desc="Rujukan regulasi antikorupsi nasional dan internasional bagi dunia usaha — sedang disiapkan.",
    desc_en="National and international anti-corruption regulations for business — currently in preparation.",
    note='Dokumen struktur situs menandainya sebagai "on progress".',
    h1_id="Regulasi Nasional &amp; Internasional",
    h1_en="National &amp; International Regulations",
    arrow=ARROW,
    outline=outline([
        ("Regulasi nasional: UU Tindak Pidana Korupsi dan KUHP 2023",
         "National: the Anti-Corruption Law and the 2023 Criminal Code"),
        ("Tanggung jawab pidana korporasi di Indonesia",
         "Corporate criminal liability in Indonesia"),
        ("Regulasi internasional: UNCAC, OECD Anti-Bribery Convention",
         "International: UNCAC and the OECD Anti-Bribery Convention"),
        ("Regulasi lintas negara: FCPA dan UK Bribery Act",
         "Cross-border: the FCPA and the UK Bribery Act"),
        ("Standar sistem manajemen: ISO 37001",
         "Management system standard: ISO 37001"),
    ])))

write("resources-templates.html", SOON.format(
    slug="resources-templates", name="Anti-Bribery Compliance Templates",
    title="Templat Kepatuhan Anti-Penyuapan — CAC Indonesia",
    title_en="Anti-Bribery Compliance Templates — CAC Indonesia",
    desc="Contoh kebijakan dan prosedur anti-penyuapan siap pakai untuk perusahaan — sedang disiapkan.",
    desc_en="Ready-to-use anti-bribery policy and procedure templates for companies — currently in preparation.",
    note='Dokumen struktur situs menandainya sebagai "on progress".',
    h1_id="Templat Kepatuhan Anti-Penyuapan",
    h1_en="Anti-Bribery Compliance Templates",
    arrow=ARROW,
    outline=outline([
        ("Kebijakan anti-penyuapan perusahaan",
         "Corporate anti-bribery policy"),
        ("Prosedur hadiah, jamuan, dan sponsorship",
         "Gifts, hospitality, and sponsorship procedure"),
        ("Formulir pengungkapan benturan kepentingan",
         "Conflict of interest disclosure form"),
        ("Prosedur uji tuntas pihak ketiga",
         "Third-party due diligence procedure"),
        ("Mekanisme pelaporan pelanggaran (whistleblowing)",
         "Whistleblowing mechanism"),
    ])))

print("selesai — jalankan: python3 build.py")
