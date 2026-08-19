# CAC Indonesia / KAKI — Prototipe HTML + CSS + JS

Prototipe statis untuk preview ke klien, dibuat sebagai **restyle** dari situs
`cac-indonesia.or.id` yang berjalan di Laravel (`cacindo-be-new`).

> **Prinsip utama:** urutan section dan alur tiap halaman dipertahankan sama
> dengan blade yang ada, begitu pula **nama class**-nya. Yang berubah adalah
> gaya visual (`css/style.css`), desain kartu, dan `js/main.js` sebagai
> pengganti Swiper/jQuery. Tujuannya agar penerapan ke Laravel sedekat mungkin
> dengan sekadar mengganti stylesheet, bukan menulis ulang view.

---

## 1. Menjalankan

Buka `index.html` langsung di browser — tidak perlu server.

Untuk membangun ulang setelah mengubah sumber:

```bash
python3 build.py                   # src/ → 22 file .html di root
python3 tools/gen-list-pages.py    # regenerate halaman daftar (seminar/training/news/…)
python3 tools/extract-articles.py  # ambil ulang isi 6 artikel dari situs live
```

## 2. Struktur berkas

```
index.html, about.html, …      ← hasil build (JANGAN diedit langsung)
css/style.css                  ← SATU-SATUNYA file gaya
js/main.js                     ← seluruh interaksi, tanpa dependensi
js/i18n.js                     ← kamus + mesin pengalih bahasa
tools/validate.py              ← pemeriksa tautan, tag, dan kamus i18n
assets/img/                    ← logo + placeholder gambar
build.py                       ← layout + partial + page → html
tools/gen-list-pages.py        ← generator halaman daftar
tools/extract-articles.py      ← ambil + bersihkan isi artikel dari situs live
src/layout.html                ← kerangka <head>/<body> bersama
src/partials/header.html       ← = components/public/navbar2.blade.php
src/partials/footer.html       ← = layouts/footer.blade.php
src/pages/*.html               ← isi tiap halaman + meta (title/description)
```

## 3. Pemetaan ke Laravel

| Prototipe | Route | View blade | Sumber konten |
|---|---|---|---|
| `index.html` | `/` | `landingpage.blade.php` | `$sliders`, `$events`, `$news`, `$partners` |
| `about.html` | `/about` | `paging.blade.php` | `Page` slug **about** |
| `member.html` | `/member` | `paging.blade.php` | `Page` slug **member** |
| `why-kaki.html` | `/why-kaki` | `paging.blade.php` | `Page` slug **why** |
| `how-kaki-work.html` | `/how-kaki-work` | `paging.blade.php` | `Page` slug **how-kaki-works** |
| `benefit.html` | `/benefit` | `paging.blade.php` | `Page` slug **benefit-kaki** |
| `contact.html` | `/contact` | `paging.blade.php` | `Page` slug **contact** |
| `join-us.html` | `/join-us` | `paging.blade.php` | `Page` slug join-us *(route belum ada di repo lokal)* |
| `seminar.html` | `/seminar` | `events.blade.php` | `Event` category **seminar** |
| `training.html` | `/training` | `events.blade.php` | `Event` category **training** |
| `media.html` | `/media` | `media.blade.php` | statis (hub kategori) |
| `news.html` | `/news` | `medias.blade.php` | `Media` category **news** |
| `in-the-news.html` | `/in-the-news` | `medias.blade.php` | `Media` category **in the news** |
| `podcast.html` | `/podcast` | `medias.blade.php` | `Media` category **podcast** |
| `video.html` | `/video` | `medias.blade.php` | `Media` category **video** |
| `image.html` | `/image` | `medias.blade.php` | `Media` category **image** |
| `artikel-*.html` (6) | `/event/{id}`, `/media/{id}` | `events/show.blade.php`, `medias/show.blade.php` | `Event->body` / `Media->body` |

### Konten dinamis

Semua teks/gambar yang terlihat di prototipe adalah **contoh hasil render**.
Di produksi semuanya datang dari admin panel:

- **Sliders** → tabel `sliders`, diurutkan `position`
- **Events** → tabel `events` (`title`, `short_description`, `thumbnail`,
  `created_at->diffForHumans()`)
- **Medias** → tabel `medias`, difilter `category`
- **Partners** → tabel `partners`, diurutkan `position`
- **Pages** → tabel `pages`, satu field WYSIWYG `content` per halaman

Halaman bertipe `paging` sengaja dibungkus `<div class="container"><div
class="page-content">…</div></div>`. Cukup ganti isinya dengan
`{!! $page->content !!}` — kelas `.page-content` sudah mengatur gaya untuk
heading, paragraf, list, tabel, gambar, dan blockquote apa pun yang diketik
admin, termasuk membuat tabel lebar bisa discroll di mobile.

## 4. Bahasa desain

Arahnya **editorial/institusional**, mengambil karakter
[collective-action.com](https://collective-action.com) lalu dibuat lebih
bersih. Ciri yang diadopsi dan alasannya:

| Keputusan | Alasan |
|---|---|
| Heading **serif**, badan teks **sans** | Ciri paling kuat situs rujukan; memberi kesan terbitan/lembaga, bukan template |
| Radius **4px**, bukan 16–24px | Kartu membulat besar adalah penanda template SaaS |
| **Hampir tanpa box-shadow** — garis 1px sebagai pemisah | Rujukan praktis tidak memakai bayangan sama sekali |
| Tanpa efek "melayang" saat hover | Diganti perubahan warna garis & teks yang lebih tenang |
| Warna dipakai irit | Merah hanya untuk aksi, tautan, kategori, dan aksen kecil |
| Ruang putih longgar, tipografi besar | Section 64px (mobile) → 124px (desktop) |

**Tipografi**

- Heading: **Source Serif 4** — serif transisional modern, terbaca pada ukuran besar maupun kecil
- Badan teks: **Plus Jakarta Sans** — sans modern yang dirancang untuk kota Jakarta; dipilih agar tidak memakai pasangan font generik

**Palet — tetap dari logo KAKI**

| Token | Hex | Dipakai untuk |
|---|---|---|
| `--c-red` | `#AE1F24` | tombol utama, tautan, label kategori, aksen |
| `--c-gold` | `#B3892D` | aksen sekunder, ikon kecil, garis pita CTA |
| `--c-ink` | `#14140F` | judul, bar atas, footer, pita CTA |
| `--c-text` | `#58585A` | teks isi (abu logo) |
| `--c-bg-alt` | `#F6F5F2` | latar section selang-seling (off-white hangat) |
| `--c-border` | `#E4E1DA` | garis pemisah — tulang punggung tampilan |

Semua token ada di `:root` pada `css/style.css`.

### Halaman detail artikel

Enam artikel yang ditautkan dari beranda, `seminar.html`, dan `news.html` sudah
punya halaman detail sendiri, jadi tidak ada tautan yang keluar dari prototipe:

| Berkas | Sumber di situs live |
|---|---|
| `artikel-pasar-modal.html` | `/event/kaki-dorong-transparansi-kepemilikan-…` |
| `artikel-kuhp-2023.html` | `/event/webinar-kaki-kuhp-2023-…` |
| `artikel-80-tahun-indonesia.html` | `/event/80-tahun-indonesia-…` |
| `artikel-oecd-fact-finding.html` | `/media/kaki-hadir-dalam-oecd-fact-finding-mission-…` |
| `artikel-forum-unodc.html` | `/media/ketua-kaki-erry-riyana-…` |
| `artikel-ace-award-doha.html` | `/media/kaki-perkuat-komitmen-global-…` |

Strukturnya mengikuti `events/show.blade.php` dan `medias/show.blade.php`
(keduanya identik): `.portfolio-details__img` → `.portfolio-details__title` →
`.portfolio-details__content`.

Isi artikel diambil dari situs live lalu dibersihkan oleh
`tools/extract-articles.py`:

- **Mojibake diperbaiki.** Teks di database tersimpan dengan pengkodean ganda
  berlapis dua (`&Atilde;&cent;…` untuk tanda hubung), termasuk byte `0x9D`
  yang tidak ada di cp1252. Skrip memperbaikinya per runtun karakter.
- **Atribut inline dibuang** — WYSIWYG lama menyimpan ratusan `style="…"`.
  Hanya tag semantik yang disisakan: `p strong em a br ul ol li h2 h3`.
- **`<p>` yang tidak pernah ditutup** dirangkai ulang agar tag seimbang.
- **`<strong>` yang membungkus satu paragraf penuh dilepas**, supaya badan
  artikel tidak tercetak tebal seluruhnya seperti di situs sekarang.

Dua elemen yang **ditambahkan** dan tidak ada di blade asli — silakan dicoret
bila tidak dikehendaki:

1. `.portfolio-details__back` — tautan "Kembali ke daftar" (tanpa ini halaman
   detail jadi buntu)
2. `.portfolio-details__meta` — baris kategori + tanggal di bawah judul
   (di Laravel: `{{ $event->created_at->diffForHumans() }}`)

Judul dan isi artikel tidak diterjemahkan karena tabel `events`/`medias` hanya
punya satu kolom `title`/`body`; yang ikut berganti bahasa hanya label kategori
dan tanggalnya.

## 5. Dwibahasa (ID ⇄ EN)

Tombol **ID | EN** ada di bar atas (desktop) dan di dalam drawer (mobile).
Pilihan disimpan di `localStorage`, jadi ikut terbawa antar halaman.
Default selalu **Bahasa Indonesia** — deteksi otomatis dari `navigator.language`
sengaja tidak dipakai karena banyak pengguna di Indonesia memakai browser
ber-locale Inggris.

Ada **dua mekanisme**, sengaja dipisah supaya pemetaan ke Laravel jelas:

**1. Teks antarmuka** — menu, judul section, tombol, label, footer:

```html
<a href="index.html" data-i18n="nav.home">Beranda</a>
```

Kamusnya ada di `js/i18n.js` (65 kunci, ID dan EN lengkap). Isinya bisa
disalin langsung menjadi `resources/lang/id/site.php` dan
`resources/lang/en/site.php`, lalu di blade jadi:

```blade
<a href="{{ route('landingpage') }}">{{ __('site.nav.home') }}</a>
```

Varian atribut: `data-i18n-html` (teks ber-`<br>`), `data-i18n-ph`
(placeholder), `data-i18n-aria` (aria-label).

**2. Konten panjang dari admin panel** — dua blok berdampingan, yang tidak
aktif disembunyikan CSS:

```html
<div lang="id">…konten Bahasa Indonesia…</div>
<div lang="en">…konten Bahasa Inggris…</div>
```

Di Laravel cukup dirender salah satu:

```blade
{!! app()->getLocale() === 'en' ? $page->content_en : $page->content !!}
```

### Yang perlu disiapkan di backend

- Tambah kolom **`content_en`** (longtext) pada tabel `pages`. Isinya **sudah
  tersedia** — konten sekarang menyimpan EN dan ID berdampingan dalam satu
  tabel 2 kolom di field `content`; tinggal dipisah saat migrasi.
- Route `GET locale/{locale}` sudah ada di `routes/web.php` beserta Session
  locale, jadi tinggal dipakai untuk tombol switcher.
- Judul/isi **event dan media** tidak diterjemahkan karena tabelnya hanya punya
  satu kolom `title`/`short_description`. Yang ikut berubah hanya label waktu
  (`diffForHumans()` sudah otomatis mengikuti locale Laravel).

## 6. Responsif

Mobile-first dengan breakpoint mengikuti Bootstrap agar cocok dengan kelas
`.col-*` di blade: **576 / 640 / 768 / 992 / 1200 px**.

Sudah diverifikasi dengan Chrome headless pada 500 / 768 / 1024 / 1440 px:
`document.scrollWidth == viewport` di **seluruh 16 halaman** — tidak ada
komponen yang meluber ke samping.

Penyesuaian utama:
- **< 992px** — menu utama berubah jadi drawer geser dari kanan, top bar menumpuk
- **< 768px** — kartu event jadi 1 kolom (gambar di atas), tombol CTA melebar penuh,
  video sidebar jadi rasio 16:9
- Tabel panjang dibungkus `.table-wrap` (`overflow-x: auto`)

## 7. JavaScript

`js/i18n.js` menangani bahasa (lihat bagian 5). `js/main.js` menggantikan
Swiper + jQuery pada template lama, tanpa dependensi apa pun:

1. Sticky menu utama
2. Drawer mobile + focus trap + tutup dengan `Esc`
3. Dropdown (hover di desktop, accordion di mobile)
4. **Main slider** — pengganti `.mySwiper`; membaca berapa pun jumlah slide di DOM,
   autoplay, swipe sentuh, panah keyboard, jeda saat hover/tab tidak aktif
5. **Marquee mitra** — pengganti `.mySwiper2`, berhenti otomatis jika logo sudah muat
6. Reveal on scroll (Intersection Observer)
7. Penanda menu aktif (cocok untuk URL berekstensi maupun tidak)
8. Tombol kembali ke atas
9. Tahun otomatis di footer

Semua animasi mati otomatis bila pengguna mengaktifkan `prefers-reduced-motion`.

## 8. Perbedaan yang disengaja dari versi lama

1. **Sticky header** — versi lama menduplikasi seluruh `<nav>` (`.stricky-header`).
   Di sini cukup satu `<nav>` yang diberi class `.is-sticky` lewat JS. Tampilan
   sama, DOM tidak kembar.
2. **Ornamen `section-title-shape`** — dulu file PNG, sekarang garis CSS. Tidak
   ada request gambar tambahan.
3. **Halaman kontak** — alurnya dipertahankan persis seperti konten aslinya
   (judul tengah → email → alamat → band CTA → peta Google), **tanpa formulir**.
   Route `POST /send-email` memang ada di `routes/web.php` (field:
   `name`, `company_name`, `location`, `phone`, `message`) bila nanti ingin
   ditambahkan formulir.
4. **Grid** — kelas `.row` / `.col-*` didefinisikan ulang seperlunya di
   `style.css`, jadi markup blade bisa dipindah apa adanya tanpa memuat Bootstrap.
5. **Desain kartu** — kategori dan tanggal dipindah dari atas gambar ke baris
   meta di atas judul, tombol panah melayang dihapus, judul dan ringkasan
   dipotong rapi (`-webkit-line-clamp`) sehingga tinggi semua kartu seragam, dan
   seluruh kartu jadi satu area klik. Nama class tetap `news-one__*`.
6. **Halaman media** — kartu berbasis ikon menggantikan foto stok, disusun
   sebagai indeks katalog yang dipisah garis 1px.
7. **Ornamen `section-title-shape-2`** dan ikon di dalam `news-one__tag`
   disembunyikan lewat CSS (`display:none`) agar tampilan lebih tenang —
   markup blade tidak perlu diubah.

## 9. Yang perlu diganti sebelum produksi

- `assets/img/slider-*.jpg`, `event-*.jpg`, `news-*.jpg`, `media-*.jpg`
  — semua placeholder; di produksi datang dari admin panel
- `og-image.jpg` (1200×630) untuk preview share
- Favicon (kini SVG inline di `src/layout.html`)
- Video YouTube di homepage masih hardcoded `YY3pIMFfibM` (sama seperti blade
  saat ini). Iframe menampilkan error bila dibuka lewat `file://` — normal,
  akan jalan setelah diakses lewat domain.
- Tautan artikel individual masih mengarah ke `cac-indonesia.or.id` karena
  halaman detail (`/event/{id}`, `/media/{id}`) belum dibuat statis.
