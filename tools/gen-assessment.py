#!/usr/bin/env python3
"""
Generator halaman Integrity Assessment (self-assessment).

Dokumen struktur situs hanya menulis judul + catatan "Bisakah buat seperti Quiz",
tanpa daftar pertanyaan. Pertanyaan di bawah DITURUNKAN dari 14 area penilaian
KAKI 75 Checklist yang tercantum di dokumen — satu pertanyaan per area — dan
masih perlu divalidasi oleh tim KAKI sebelum dipakai sungguhan.

Skor: Sudah = 2, Sebagian = 1, Belum = 0  (maksimum 28)
Ambang: <40% Tahap Awal · 40–74% Sedang Berkembang · >=75% Matang

Pakai:  python3 tools/gen-assessment.py && python3 build.py
"""

import html
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "src" / "pages"

# (area ID, area EN, pertanyaan ID, pertanyaan EN)
QUESTIONS = [
    ("Prinsip Anti-Penyuapan", "Anti-Bribery Principles",
     "Perusahaan memiliki pernyataan prinsip anti-penyuapan yang disahkan secara resmi dan diketahui seluruh karyawan.",
     "The company has a formally endorsed anti-bribery principles statement that all employees are aware of."),
    ("Program Anti-Penyuapan", "Anti-Bribery Program",
     "Ada program anti-penyuapan yang terdokumentasi dan berjalan, bukan sekadar pernyataan komitmen.",
     "A documented anti-bribery programme is in place and running, not merely a statement of commitment."),
    ("Penilaian Risiko", "Risk Assessment",
     "Perusahaan melakukan penilaian risiko korupsi secara berkala dan hasilnya terdokumentasi.",
     "The company carries out corruption risk assessments at regular intervals and documents the results."),
    ("Kebijakan Perusahaan", "Corporate Policies",
     "Kebijakan turunan seperti pengadaan, keuangan, dan pemasaran sudah selaras dengan kebijakan anti-penyuapan.",
     "Supporting policies such as procurement, finance, and marketing are aligned with the anti-bribery policy."),
    ("Hadiah, Jamuan, dan Sponsorship", "Gifts, Hospitality & Sponsorship",
     "Ada aturan dan batas nilai yang jelas untuk pemberian maupun penerimaan hadiah, jamuan, dan sponsorship.",
     "Clear rules and value thresholds exist for giving and receiving gifts, hospitality, and sponsorship."),
    ("Benturan Kepentingan", "Conflict of Interest",
     "Karyawan wajib mengungkapkan benturan kepentingan, dan pengungkapan tersebut dicatat serta ditindaklanjuti.",
     "Employees are required to disclose conflicts of interest, and those disclosures are recorded and acted upon."),
    ("Pengelolaan Pihak Ketiga", "Third Party Management",
     "Mitra, agen, dan pemasok melalui uji tuntas integritas sebelum kerja sama dimulai.",
     "Partners, agents, and suppliers go through integrity due diligence before an engagement begins."),
    ("Komitmen Dewan dan Manajemen", "Board & Management Commitment",
     "Dewan dan manajemen puncak secara aktif dan terbuka menyuarakan komitmen antikorupsi.",
     "The board and senior management actively and visibly voice the anti-corruption commitment."),
    ("Sumber Daya Manusia", "Human Resources",
     "Aspek integritas masuk dalam proses rekrutmen, kontrak kerja, dan penilaian kinerja karyawan.",
     "Integrity is built into recruitment, employment contracts, and performance reviews."),
    ("Pelatihan dan Peningkatan Kesadaran", "Training & Awareness",
     "Karyawan mendapat pelatihan antikorupsi secara berkala, disesuaikan dengan tingkat risiko pekerjaannya.",
     "Employees receive regular anti-corruption training, matched to the risk exposure of their role."),
    ("Pengendalian Internal", "Internal Controls",
     "Ada pengendalian internal seperti otorisasi berjenjang dan pemisahan tugas untuk mencegah penyuapan.",
     "Internal controls such as tiered authorisation and segregation of duties are in place to prevent bribery."),
    ("Pembukuan dan Pencatatan", "Books & Records",
     "Seluruh transaksi tercatat secara akurat dan tidak ada dana maupun rekening di luar pembukuan.",
     "All transactions are recorded accurately and there are no off-the-books funds or accounts."),
    ("Pemantauan dan Audit Internal", "Monitoring & Internal Audit",
     "Audit internal secara berkala menguji efektivitas program anti-penyuapan, bukan hanya kepatuhan administratif.",
     "Internal audit periodically tests the effectiveness of the anti-bribery programme, not just administrative compliance."),
    ("Pelaporan dan Perbaikan Berkelanjutan", "Reporting & Continuous Improvement",
     "Tersedia kanal pelaporan pelanggaran yang aman, dan temuannya dipakai untuk memperbaiki program.",
     "A safe whistleblowing channel is available, and its findings are used to improve the programme."),
]

OPTIONS = [("2", "quiz.yes"), ("1", "quiz.partial"), ("0", "quiz.no")]

ARROW = ('<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" '
         'stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
         '<path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>')


def question_block(index, area_id, area_en, q_id, q_en):
    opts = "".join(
        f'''
              <label class="quiz__option">
                <input type="radio" name="q{index}" value="{value}">
                <span class="quiz__option-mark" aria-hidden="true"></span>
                <span class="quiz__option-text" data-i18n="{key}">{key}</span>
              </label>'''
        for value, key in OPTIONS)

    return f'''
          <li class="quiz__q" data-quiz-q
              data-area-id="{html.escape(area_id, quote=True)}"
              data-area-en="{html.escape(area_en, quote=True)}">
            <p class="quiz__area">
              <span lang="id">{html.escape(area_id)}</span><span lang="en">{html.escape(area_en)}</span>
            </p>
            <h2 class="quiz__text">
              <span lang="id">{html.escape(q_id)}</span><span lang="en">{html.escape(q_en)}</span>
            </h2>
            <div class="quiz__options">{opts}
            </div>
          </li>'''


questions = "".join(question_block(i, *q) for i, q in enumerate(QUESTIONS, 1))

PAGE = f'''<!--@meta
title: Self-Assessment Integritas — CAC Indonesia
title_en: Integrity Assessment — CAC Indonesia
description: Ukur kesiapan praktik anti-korupsi perusahaan Anda menggunakan 14 area KAKI 75 Anti-Bribery Compliance Checklist.
description_en: Measure your company's anti-corruption readiness across the 14 areas of the KAKI 75 Anti-Bribery Compliance Checklist.
page: integrity-assessment
output: integrity-assessment.html
-->
    <!-- ============================================================
         INTEGRITY ASSESSMENT — halaman baru.

         Dokumen struktur situs hanya menulis judul + catatan "Bisakah buat
         seperti Quiz", tanpa daftar pertanyaan. Empat belas pertanyaan di
         bawah DITURUNKAN dari 14 area penilaian KAKI 75 Checklist (satu
         pertanyaan per area) dan MASIH PERLU DIVALIDASI tim KAKI.

         Seluruh perhitungan dilakukan di peramban — tidak ada data yang
         dikirim ke server. Logikanya ada di js/main.js modul 10.
         Ubah pertanyaan lewat berkas ini, bukan lewat JavaScript.
         ============================================================ -->
    <section class="quiz" data-quiz aria-labelledby="quizTitle">
      <div class="container container--narrow">

        <!-- Layar pembuka -->
        <div class="quiz__intro" data-quiz-intro>
          <div class="section-title reveal">
            <div class="section-sub-title-box">
              <div class="section-title-shape-1" aria-hidden="true"></div>
              <p class="section-sub-title" data-i18n="quiz.sub">self-assessment</p>
            </div>
            <h1 class="section-title__title" id="quizTitle" data-i18n="quiz.title">Seberapa Siap Perusahaan Anda?</h1>
            <p class="section-title__text" data-i18n="quiz.lead">Ukur praktik anti-korupsi dan integritas bisnis perusahaan Anda menggunakan KAKI 75 Anti-Bribery Compliance Checklist.</p>
          </div>

          <ul class="quiz__facts reveal" style="--delay:60ms">
            <li><strong>14</strong> <span lang="id">area penilaian</span><span lang="en">assessment areas</span></li>
            <li><strong>±3</strong> <span lang="id">menit</span><span lang="en">minutes</span></li>
            <li><strong>0</strong> <span lang="id">data dikirim</span><span lang="en">data sent</span></li>
          </ul>

          <p class="quiz__note reveal" style="--delay:80ms" data-i18n="quiz.note">Hasil bersifat indikatif dan tidak menggantikan proses sertifikasi.</p>

          <p class="quiz__start reveal" style="--delay:100ms">
            <button class="thm-btn" type="button" data-quiz-start>
              <span data-i18n="quiz.start">Mulai Self-Assessment</span>{ARROW}
            </button>
          </p>
        </div>

        <!-- Layar pertanyaan -->
        <div class="quiz__runner" data-quiz-runner hidden>
          <div class="quiz__progress">
            <div class="quiz__progress-meta">
              <span>
                <span data-i18n="quiz.question">Pertanyaan</span>
                <b data-quiz-current>1</b>
                <span data-i18n="quiz.of">dari</span>
                <b data-quiz-total>14</b>
              </span>
              <span class="quiz__progress-pct" data-quiz-pct>0%</span>
            </div>
            <div class="quiz__progress-track">
              <div class="quiz__progress-bar" data-quiz-bar
                   role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"></div>
            </div>
          </div>

          <ol class="quiz__questions" data-quiz-questions>{questions}
          </ol>

          <div class="quiz__nav">
            <button class="thm-btn btn--outline" type="button" data-quiz-prev>
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M19 12H5"/><path d="m12 19-7-7 7-7"/></svg>
              <span data-i18n="quiz.prev">Sebelumnya</span>
            </button>
            <button class="thm-btn" type="button" data-quiz-next disabled>
              <span data-i18n="quiz.next">Berikutnya</span>{ARROW}
            </button>
          </div>
        </div>

        <!-- Layar hasil -->
        <div class="quiz__result" data-quiz-result hidden tabindex="-1">
          <div class="section-title">
            <div class="section-sub-title-box">
              <div class="section-title-shape-1" aria-hidden="true"></div>
              <p class="section-sub-title" data-i18n="quiz.resultTitle">Hasil Self-Assessment</p>
            </div>
            <h2 class="section-title__title" data-quiz-level-title>—</h2>
          </div>

          <div class="quiz__score">
            <div class="quiz__score-figure">
              <span class="quiz__score-value" data-quiz-score>0%</span>
              <span class="quiz__score-label" data-i18n="quiz.score">Skor kesiapan</span>
            </div>
            <p class="quiz__score-desc" data-quiz-level-desc></p>
          </div>

          <div class="quiz__gaps">
            <h3 class="quiz__gaps-title" data-i18n="quiz.gapsTitle">Area yang perlu diperkuat</h3>
            <ul class="quiz__gaps-list" data-quiz-gaps></ul>
          </div>

          <div class="quiz__result-actions">
            <a class="thm-btn" href="join-us.html">
              <span data-i18n="quiz.toJoin">Bergabung dengan KAKI</span>{ARROW}
            </a>
            <a class="thm-btn btn--outline" href="certification.html">
              <span data-i18n="quiz.toCert">Pelajari Sertifikasi</span>
            </a>
            <button class="quiz__retake" type="button" data-quiz-retake>
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M3 12a9 9 0 1 0 3-6.7L3 8"/><path d="M3 3v5h5"/></svg>
              <span data-i18n="quiz.retake">Ulangi</span>
            </button>
          </div>
        </div>

      </div>
    </section>
'''

(OUT / "integrity-assessment.html").write_text(PAGE, encoding="utf-8")
print("  src/pages/integrity-assessment.html  (%d pertanyaan)" % len(QUESTIONS))
print("selesai — jalankan: python3 build.py")
