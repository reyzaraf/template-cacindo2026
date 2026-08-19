/* ==========================================================================
   CAC INDONESIA / KAKI — i18n.js
   --------------------------------------------------------------------------
   Pengalih bahasa ID ⇄ EN untuk prototipe statis.

   DUA MEKANISME — sengaja dipisah agar pemetaan ke Laravel jelas:

   1. Teks antarmuka (menu, judul section, tombol, label form, footer)
      → atribut  data-i18n="kunci"  yang dicari di kamus DICT di bawah.
      Di Laravel  →  {{ __('site.kunci') }}
      Kamus ini bisa langsung disalin menjadi:
          resources/lang/id/site.php
          resources/lang/en/site.php

   2. Konten panjang dari admin panel (halaman About/Why/How/Benefit/…)
      → dua blok berdampingan:
          <div lang="id"> … </div>
          <div lang="en"> … </div>
        Yang tidak aktif disembunyikan lewat CSS.
      Di Laravel  →  {!! app()->getLocale() === 'en'
                          ? $page->content_en : $page->content !!}
      (perlu kolom baru `content_en` pada tabel `pages`)

   Varian atribut lain:
      data-i18n-ph="kunci"     → placeholder
      data-i18n-aria="kunci"   → aria-label
      data-i18n-html="kunci"   → innerHTML (untuk teks yang memuat <br> dsb.)

   Pilihan bahasa disimpan di localStorage. Di Laravel, route yang sudah ada
   `GET locale/{locale}` + Session sudah menangani hal yang sama.
   ========================================================================== */
(function (global) {
  'use strict';

  var STORAGE_KEY = 'kaki-lang';
  var DEFAULT_LANG = 'id';

  /* ------------------------------------------------------------------ kamus */
  var DICT = {
    id: {
      /* --- bar atas & navigasi ------------------------------------------ */
      'top.address'      : 'Gedung Prof. M. Sadli (Gedung Magister Akuntansi) Lt. 1 Jl. Salemba No.4, RT.4/RW.6, Kenari',
      'top.about'        : 'Tentang',
      'nav.home'         : 'Beranda',
      'nav.who'          : 'Tentang Kami',
      'nav.about'        : 'Tentang KAKI',
      'nav.member'       : 'Anggota Kami',
      'nav.join'         : 'Bergabung',
      'nav.events'       : 'Kegiatan',
      'nav.seminar'      : 'Seminar',
      'nav.training'     : 'Pelatihan',
      'nav.contact'      : 'Kontak',
      'nav.open'         : 'Buka menu navigasi',
      'nav.close'        : 'Tutup menu navigasi',
      'lang.switch'      : 'Pilih bahasa',


      /* --- navigasi struktur baru ------------------------------------- */
      'nav.governance'   : 'Tata Kelola KAKI',
      'nav.membership'   : 'Keanggotaan',
      'nav.whyJoin'      : 'Mengapa Bergabung',
      'nav.certification': 'Sertifikasi',
      'nav.assessment'   : 'Self-Assessment',
      'nav.knowledge'    : 'Pusat Pengetahuan',
      'nav.ac101'        : 'Anti-Korupsi 101',
      'nav.regulations'  : 'Regulasi',
      'nav.resources'    : 'Sumber Daya KAKI',
      'nav.eventsMedia'  : 'Kegiatan & Media',

      /* --- halaman hub -------------------------------------------------- */
      'hub.knowledgeSub' : 'pusat pengetahuan',
      'hub.knowledgeT'   : 'Pusat Pengetahuan',
      'hub.knowledgeLead': 'Materi rujukan, regulasi, dan perangkat kerja untuk membangun sistem integritas di perusahaan Anda.',
      'hub.ac101D'       : 'Materi dasar: apa itu korupsi, bentuk-bentuknya, dan mengapa penting bagi dunia usaha',
      'hub.regulationsD' : 'Rujukan regulasi nasional dan internasional yang mengikat dunia usaha',
      'hub.resourcesD'   : 'Checklist, templat kebijakan, dan publikasi yang dapat diunduh',
      'hub.resourcesSub' : 'unduhan',
      'hub.resourcesT'   : 'Sumber Daya KAKI',
      'hub.resourcesLead': 'Perangkat kerja dan publikasi yang dapat digunakan langsung oleh perusahaan.',
      'hub.checklistT'   : 'KAKI 75 Checklist',
      'hub.checklistD'   : 'Instrumen penilaian 75 kriteria, tersedia dalam Bahasa Indonesia dan Inggris',
      'hub.templatesT'   : 'Templat Kepatuhan Anti-Penyuapan',
      'hub.templatesD'   : 'Contoh kebijakan dan prosedur siap pakai untuk perusahaan',
      'hub.publicationsT': 'Publikasi & Referensi',
      'hub.publicationsD': 'Publikasi KAKI dan rujukan eksternal seperti OECD',
      'hub.eventsSub'    : 'kegiatan & media',
      'hub.eventsT'      : 'Kegiatan & Media',
      'hub.eventsLead'   : 'Seluruh seminar, pelatihan, berita, dan dokumentasi KAKI dalam satu halaman.',
      'hub.seminarD'     : 'Seminar, webinar, forum, dan roundtable yang diselenggarakan KAKI',
      'hub.trainingD'    : 'Pelatihan asesor, workshop 75 Checklist, dan advokasi kebijakan',

      /* --- status konten ------------------------------------------------ */
      'soon.badge'       : 'Sedang disiapkan',
      'soon.title'       : 'Halaman ini sedang disiapkan',
      'soon.lead'        : 'Materinya sedang disusun oleh tim KAKI dan akan tayang di halaman ini.',
      'soon.contact'     : 'Butuh materinya lebih cepat? Hubungi sekretariat KAKI.',
      'soon.cta'         : 'Hubungi Sekretariat',
      'soon.back'        : 'Kembali ke Pusat Pengetahuan',
      'soon.willCover'   : 'Yang akan dibahas di halaman ini:',
      'download.label'   : 'Unduh',
      'download.soon'    : 'Berkas menyusul',

      /* --- self-assessment ---------------------------------------------- */
      'quiz.sub'         : 'self-assessment',
      'quiz.title'       : 'Seberapa Siap Perusahaan Anda?',
      'quiz.lead'        : 'Ukur praktik anti-korupsi dan integritas bisnis perusahaan Anda menggunakan KAKI 75 Anti-Bribery Compliance Checklist.',
      'quiz.note'        : 'Hasil bersifat indikatif dan tidak menggantikan proses sertifikasi. Jawaban Anda tidak dikirim ke mana pun — seluruhnya diproses di peramban.',
      'quiz.start'       : 'Mulai Self-Assessment',
      'quiz.of'          : 'dari',
      'quiz.question'    : 'Pertanyaan',
      'quiz.prev'        : 'Sebelumnya',
      'quiz.next'        : 'Berikutnya',
      'quiz.finish'      : 'Lihat Hasil',
      'quiz.yes'         : 'Sudah diterapkan',
      'quiz.partial'     : 'Sebagian',
      'quiz.no'          : 'Belum ada',
      'quiz.resultTitle' : 'Hasil Self-Assessment',
      'quiz.score'       : 'Skor kesiapan',
      'quiz.gapsTitle'   : 'Area yang perlu diperkuat',
      'quiz.noGaps'      : 'Tidak ada area yang tertinggal. Perusahaan Anda siap mengajukan sertifikasi.',
      'quiz.retake'      : 'Ulangi',
      'quiz.toJoin'      : 'Bergabung dengan KAKI',
      'quiz.toCert'      : 'Pelajari Sertifikasi',
      'quiz.lvl1T'       : 'Tahap Awal',
      'quiz.lvl1D'       : 'Sistem integritas perusahaan Anda baru pada tahap awal. Langkah pertama yang disarankan adalah menandatangani Declaration of Intent dan menyusun kebijakan anti-penyuapan dasar.',
      'quiz.lvl2T'       : 'Sedang Berkembang',
      'quiz.lvl2D'       : 'Sebagian besar fondasi sudah ada, namun beberapa area masih perlu dilengkapi sebelum siap dinilai secara independen.',
      'quiz.lvl3T'       : 'Matang',
      'quiz.lvl3D'       : 'Sistem integritas perusahaan Anda sudah cukup matang. Perusahaan Anda layak mempertimbangkan pengajuan Sertifikasi KAKI.',

      /* --- Join Us ------------------------------------------------------- */
      'join.doiBtn'      : 'Unduh Declaration of Intent',
      'join.certBtn'     : 'Pelajari Sertifikasi KAKI',
      'join.formBtn'     : 'Isi Formulir Minat',

      /* --- beranda -------------------------------------------------------- */
      'home.eventsTitle' : 'Seminar & Kegiatan',
      'home.eventsAll'   : 'Lihat semua kegiatan',
      'home.newsSub'     : 'kabar terbaru',
      'home.newsTitle'   : 'Sorotan Berita',
      'home.newsAll'     : 'Lihat semua berita',
      'home.supported'   : 'Didukung Oleh',
      'home.supportedSub': 'mitra & asosiasi',
      'home.trackSub'    : 'Punya pertanyaan?',
      'home.trackTitle'  : 'Hubungi kontak kami',
      'home.trackBtn'    : 'Kontak',
      'home.videoCap'    : 'Webinar: Understanding How To Prevent Corruption In New Reality',
      'home.prevSlide'   : 'Slide sebelumnya',
      'home.nextSlide'   : 'Slide berikutnya',

      /* --- kartu & daftar ------------------------------------------------- */
      'card.readMore'    : 'Selengkapnya',
      'article.back'     : 'Kembali ke daftar',
      'card.tag'         : 'sorotan',
      'list.sub'         : 'informasi terkini',
      'list.empty'       : 'Belum ada konten pada kategori ini. Konten akan tampil otomatis setelah ditambahkan lewat admin panel.',
      'page.seminar'     : 'Seminar',
      'page.training'    : 'Pelatihan',
      'page.news'        : 'Berita',
      'page.inthenews'   : 'Liputan Media',
      'page.podcast'     : 'Podcast',
      'page.video'       : 'Video',
      'page.image'       : 'Galeri Foto',

      /* --- halaman media -------------------------------------------------- */
      'media.sub'        : 'pilih kategori',
      'media.title'      : 'Pusat Media KAKI',
      'media.lead'       : 'Semua kabar, liputan, dan dokumentasi Koalisi Anti Korupsi Indonesia dalam satu tempat.',
      'media.newsT'      : 'Berita',
      'media.newsD'      : 'Semua berita resmi dari KAKI',
      'media.inthenewsT' : 'Liputan Media',
      'media.inthenewsD' : 'Semua berita tentang KAKI di media massa',
      'media.podcastT'   : 'Podcast',
      'media.podcastD'   : 'Semua podcast dari KAKI',
      'media.videoT'     : 'Video',
      'media.videoD'     : 'Kanal YouTube resmi KAKI',
      'media.imageT'     : 'Galeri Foto',
      'media.imageD'     : 'Dokumentasi kegiatan KAKI',

      /* --- halaman kontak -------------------------------------------------- */
      'contact.sub'      : 'hubungi kami',
      'contact.title'    : 'Jangan ragu untuk menghubungi KAKI',

      /* --- footer ---------------------------------------------------------- */
      'footer.tagline'   : 'Suatu platform bagi sektor swasta Indonesia untuk secara kolektif menciptakan, mengadopsi, dan menyebarkan anti-korupsi yang efektif dan kebijakan kepatuhan, mengambil inisiatif untuk mengurangi korupsi dan mempromosikan ekosistem bisnis yang bersih.',
      'footer.contact'   : 'Kontak',
      'footer.hours'     : 'Jam Operasional',
      'footer.hoursTxt'  : 'Senin – Jumat: 09.00 – 16.00 WIB<br>Sabtu – Minggu: Tutup',
      'footer.copyright' : 'Hak cipta',
      'common.skip'      : 'Lewati ke konten utama',
      'common.toTop'     : 'Kembali ke atas halaman'
    },

    en: {
      /* --- top bar & navigation ------------------------------------------ */
      'top.address'      : 'Gedung Prof. M. Sadli (Magister Akuntansi Building) 1st Fl., Jl. Salemba No.4, RT.4/RW.6, Kenari',
      'top.about'        : 'About',
      'nav.home'         : 'Home',
      'nav.who'          : 'Who We Are',
      'nav.about'        : 'About KAKI',
      'nav.member'       : 'Our Member',
      'nav.join'         : 'Join Us',
      'nav.events'       : 'Events',
      'nav.seminar'      : 'Seminar',
      'nav.training'     : 'Training',
      'nav.contact'      : 'Contact',
      'nav.open'         : 'Open navigation menu',
      'nav.close'        : 'Close navigation menu',
      'lang.switch'      : 'Choose language',


      /* --- new navigation ----------------------------------------------- */
      'nav.governance'   : 'KAKI Governance',
      'nav.membership'   : 'Membership',
      'nav.whyJoin'      : 'Why Join',
      'nav.certification': 'Certification',
      'nav.assessment'   : 'Integrity Assessment',
      'nav.knowledge'    : 'Knowledge Hub',
      'nav.ac101'        : 'Anti-Corruption 101',
      'nav.regulations'  : 'Regulations',
      'nav.resources'    : 'KAKI Resources',
      'nav.eventsMedia'  : 'Events & Media',

      /* --- hub pages ------------------------------------------------------ */
      'hub.knowledgeSub' : 'knowledge hub',
      'hub.knowledgeT'   : 'Knowledge Hub',
      'hub.knowledgeLead': 'Reference material, regulations, and practical tools for building an integrity system in your company.',
      'hub.ac101D'       : 'The basics: what corruption is, its forms, and why it matters to business',
      'hub.regulationsD' : 'National and international regulations that bind the business sector',
      'hub.resourcesD'   : 'Downloadable checklists, policy templates, and publications',
      'hub.resourcesSub' : 'downloads',
      'hub.resourcesT'   : 'KAKI Resources',
      'hub.resourcesLead': 'Practical tools and publications companies can put to use straight away.',
      'hub.checklistT'   : 'KAKI 75 Checklist',
      'hub.checklistD'   : 'The 75-criteria assessment instrument, available in Indonesian and English',
      'hub.templatesT'   : 'Anti-Bribery Compliance Templates',
      'hub.templatesD'   : 'Ready-to-use policy and procedure templates for companies',
      'hub.publicationsT': 'Publications & Resources',
      'hub.publicationsD': 'KAKI publications and external references such as the OECD',
      'hub.eventsSub'    : 'events & media',
      'hub.eventsT'      : 'Events & Media',
      'hub.eventsLead'   : 'Every KAKI seminar, training, news item, and piece of documentation in one place.',
      'hub.seminarD'     : 'Seminars, webinars, forums, and roundtables hosted by KAKI',
      'hub.trainingD'    : 'Assessor training, 75 Checklist workshops, and policy advocacy',

      /* --- content status -------------------------------------------------- */
      'soon.badge'       : 'In preparation',
      'soon.title'       : 'This page is being prepared',
      'soon.lead'        : 'The material is being compiled by the KAKI team and will be published here.',
      'soon.contact'     : 'Need the material sooner? Get in touch with the KAKI secretariat.',
      'soon.cta'         : 'Contact the Secretariat',
      'soon.back'        : 'Back to Knowledge Hub',
      'soon.willCover'   : 'What this page will cover:',
      'download.label'   : 'Download',
      'download.soon'    : 'File to follow',

      /* --- integrity assessment -------------------------------------------- */
      'quiz.sub'         : 'integrity assessment',
      'quiz.title'       : 'How Ready is Your Company?',
      'quiz.lead'        : "Measure your company's anti-corruption and business integrity practices using KAKI's 75 Anti-Bribery Compliance Checklist.",
      'quiz.note'        : 'Results are indicative and do not replace the certification process. Your answers are never sent anywhere — everything is processed in your browser.',
      'quiz.start'       : 'Start the Assessment',
      'quiz.of'          : 'of',
      'quiz.question'    : 'Question',
      'quiz.prev'        : 'Previous',
      'quiz.next'        : 'Next',
      'quiz.finish'      : 'See Results',
      'quiz.yes'         : 'Already in place',
      'quiz.partial'     : 'Partially',
      'quiz.no'          : 'Not yet',
      'quiz.resultTitle' : 'Assessment Results',
      'quiz.score'       : 'Readiness score',
      'quiz.gapsTitle'   : 'Areas to strengthen',
      'quiz.noGaps'      : 'No gaps left. Your company is ready to apply for certification.',
      'quiz.retake'      : 'Retake',
      'quiz.toJoin'      : 'Join KAKI',
      'quiz.toCert'      : 'Learn about Certification',
      'quiz.lvl1T'       : 'Early Stage',
      'quiz.lvl1D'       : "Your company's integrity system is at an early stage. A good first step is signing the Declaration of Intent and drafting a basic anti-bribery policy.",
      'quiz.lvl2T'       : 'Developing',
      'quiz.lvl2D'       : 'Most of the foundations are in place, but several areas still need work before an independent assessment.',
      'quiz.lvl3T'       : 'Mature',
      'quiz.lvl3D'       : "Your company's integrity system is well developed. You are in a good position to apply for KAKI Certification.",

      /* --- Join Us --------------------------------------------------------- */
      'join.doiBtn'      : 'Download Declaration of Intent',
      'join.certBtn'     : 'Learn about KAKI Certification',
      'join.formBtn'     : 'Fill in the Interest Form',

      /* --- home ------------------------------------------------------------ */
      'home.eventsTitle' : 'Seminar & Events',
      'home.eventsAll'   : 'View all events',
      'home.newsSub'     : 'recent news feed',
      'home.newsTitle'   : 'Highlights News',
      'home.newsAll'     : 'View all news',
      'home.supported'   : 'Supported By',
      'home.supportedSub': 'partners & associations',
      'home.trackSub'    : 'Have a question?',
      'home.trackTitle'  : 'Get in touch with us',
      'home.trackBtn'    : 'Contact',
      'home.videoCap'    : 'Webinar: Understanding How To Prevent Corruption In New Reality',
      'home.prevSlide'   : 'Previous slide',
      'home.nextSlide'   : 'Next slide',

      /* --- cards & lists ---------------------------------------------------- */
      'card.readMore'    : 'Read more',
      'article.back'     : 'Back to list',
      'card.tag'         : 'highlight',
      'list.sub'         : 'recent info',
      'list.empty'       : 'No content in this category yet. Items will appear automatically once added from the admin panel.',
      'page.seminar'     : 'Seminar',
      'page.training'    : 'Training',
      'page.news'        : 'News',
      'page.inthenews'   : 'In The News',
      'page.podcast'     : 'Podcast',
      'page.video'       : 'Video',
      'page.image'       : 'Photos',

      /* --- media page -------------------------------------------------------- */
      'media.sub'        : 'choose a category',
      'media.title'      : 'KAKI Media Center',
      'media.lead'       : 'All news, coverage, and documentation from the Indonesia Anti-Corruption Coalition in one place.',
      'media.newsT'      : 'News',
      'media.newsD'      : 'All official news from KAKI',
      'media.inthenewsT' : 'In The News',
      'media.inthenewsD' : 'Press coverage about KAKI',
      'media.podcastT'   : 'Podcast',
      'media.podcastD'   : 'All podcasts from KAKI',
      'media.videoT'     : 'Video',
      'media.videoD'     : 'Official KAKI YouTube channel',
      'media.imageT'     : 'Photos',
      'media.imageD'     : 'Documentation of KAKI activities',

      /* --- contact page ------------------------------------------------------- */
      'contact.sub'      : 'get in touch',
      'contact.title'    : 'Feel free to contact KAKI',

      /* --- footer -------------------------------------------------------------- */
      'footer.tagline'   : 'A platform for Indonesia’s private sector to collectively create, adopt, and spread effective anti-corruption and compliance policies, taking the initiative to curb corruption and promote a clean business ecosystem.',
      'footer.contact'   : 'Contact',
      'footer.hours'     : 'Open Hours',
      'footer.hoursTxt'  : 'Mon – Fri: 9:00 am to 4:00 pm<br>Saturday – Sunday: Closed',
      'footer.copyright' : 'Copyright',
      'common.skip'      : 'Skip to main content',
      'common.toTop'     : 'Back to top of page'
    }
  };

  /* ------------------------------------------------------------------ mesin */
  function read() {
    try {
      var saved = global.localStorage.getItem(STORAGE_KEY);
      if (saved === 'id' || saved === 'en') return saved;
    } catch (e) { /* localStorage diblokir — abaikan */ }
    return null;
  }

  function save(lang) {
    try { global.localStorage.setItem(STORAGE_KEY, lang); }
    catch (e) { /* abaikan */ }
  }

  function t(key, lang) {
    var table = DICT[lang] || DICT[DEFAULT_LANG];
    if (Object.prototype.hasOwnProperty.call(table, key)) return table[key];
    return DICT[DEFAULT_LANG][key] !== undefined ? DICT[DEFAULT_LANG][key] : key;
  }

  function apply(lang) {
    var doc = global.document;
    var root = doc.documentElement;

    root.setAttribute('lang', lang);
    root.setAttribute('data-lang', lang);

    // 1. teks biasa
    Array.prototype.forEach.call(doc.querySelectorAll('[data-i18n]'), function (el) {
      el.textContent = t(el.getAttribute('data-i18n'), lang);
    });
    // 2. teks yang memuat markup ringan (<br>, <code>)
    Array.prototype.forEach.call(doc.querySelectorAll('[data-i18n-html]'), function (el) {
      el.innerHTML = t(el.getAttribute('data-i18n-html'), lang);
    });
    // 3. placeholder
    Array.prototype.forEach.call(doc.querySelectorAll('[data-i18n-ph]'), function (el) {
      el.setAttribute('placeholder', t(el.getAttribute('data-i18n-ph'), lang));
    });
    // 4. aria-label
    Array.prototype.forEach.call(doc.querySelectorAll('[data-i18n-aria]'), function (el) {
      el.setAttribute('aria-label', t(el.getAttribute('data-i18n-aria'), lang));
    });

    // 5. judul dokumen & meta description
    var body = doc.body;
    if (body) {
      var title = body.getAttribute(lang === 'en' ? 'data-title-en' : 'data-title-id');
      if (title) doc.title = title;
      var desc = body.getAttribute(lang === 'en' ? 'data-desc-en' : 'data-desc-id');
      var metaDesc = doc.querySelector('meta[name="description"]');
      if (desc && metaDesc) metaDesc.setAttribute('content', desc);
    }

    // 6. tombol pengalih
    Array.prototype.forEach.call(doc.querySelectorAll('[data-lang-btn]'), function (btn) {
      var active = btn.getAttribute('data-lang-btn') === lang;
      btn.classList.toggle('is-active', active);
      btn.setAttribute('aria-pressed', String(active));
    });

    // Blok <div lang="id"> / <div lang="en"> diatur sepenuhnya lewat CSS.
    global.dispatchEvent(new CustomEvent('kaki:langchange', { detail: { lang: lang } }));
  }

  function detect() {
    // Selalu mulai dari Bahasa Indonesia kecuali pengunjung pernah memilih EN.
    // Deteksi otomatis dari navigator.language sengaja TIDAK dipakai: banyak
    // pengguna di Indonesia memakai browser ber-locale Inggris, sehingga
    // deteksi otomatis justru sering salah menebak.
    return read() || DEFAULT_LANG;
  }

  var current = detect();

  // Terapkan sedini mungkin agar tidak ada kedipan bahasa yang salah.
  global.document.documentElement.setAttribute('data-lang', current);
  global.document.documentElement.setAttribute('lang', current);

  function setLang(lang) {
    if (lang !== 'id' && lang !== 'en') return;
    current = lang;
    save(lang);
    apply(lang);
  }

  global.KAKI_I18N = {
    get: function () { return current; },
    set: setLang,
    t: function (key) { return t(key, current); },
    dict: DICT,
    init: function () {
      apply(current);
      Array.prototype.forEach.call(
        global.document.querySelectorAll('[data-lang-btn]'),
        function (btn) {
          btn.addEventListener('click', function () {
            setLang(btn.getAttribute('data-lang-btn'));
          });
        }
      );
    }
  };

  if (global.document.readyState === 'loading') {
    global.document.addEventListener('DOMContentLoaded', global.KAKI_I18N.init);
  } else {
    global.KAKI_I18N.init();
  }

})(window);
