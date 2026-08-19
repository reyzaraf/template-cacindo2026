-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Feb 2023 pada 02.57
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cacindo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `slug` longtext NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `short_description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `short_description` text NOT NULL,
  `slug` longtext NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `events`
--

INSERT INTO `events` (`id`, `title`, `body`, `short_description`, `slug`, `thumbnail`, `category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Focus Group Discussion: Council for The Coalition', '<p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Jakarta &acirc;&#128;&#147; BEI (Indonesia Stock Exchange), KADIN (Indonesian Chamber of Commerce and Industry), AEI (Indonesian Public Listed Companies Association), IBL (Indonesia Business Links), APINDO (Employers\' Association of Indonesia), KNKG (National Committee on Governance Policy), and &amp;PERBANAS (Indonesian Banks Association), gathered to support the implementation of CAC program in Indonesia through a Focused Group of Discussion on 29<sup style=\'box-sizing:border-box;font-family:\"Century gothic\";font-size:12px;line-height:0;position:relative;top:-0.5em;vertical-align:baseline;\'>th</sup> October 2019. The purpose of this gathering is to form a Council for the CAC Program to guide and invite companies to join this coalition. It is important to continuously raise the awareness of promoting clean system and good corporate governance in the Indonesia business environment.<p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>In this forum Susi Rai Azizi from KADIN mentioned that most corporates will positively support any anti-bribery program as long as to be assured that they will gain any profitable and tangible compensation by implementing it.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>All of associations has agreed to consistently support this program as long as this program is proved will sustain in a long run. Iwan Zulkarnain, the Office Manager of APINDO stated that APINDO will surely support this program if the regulation applied not only towards Private Sector but also gives stricter law enforcement on Public Service. According to Andi Ilham Said, IICD\'s Chairman of Trustee Board, IICD as an institution that supports forming this council, can help companies when they want to develop anti-corruption programs.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>There will be a further discussion to coordinate and formalize this CAC Council group. (29/10/2019)</p></p>\n', 'Several prominent business association in Indonesia formed a Council for the CAC Program to guide and invite companies to join this coalition.', 'focus-group-discussion-council-for-the-coalition', 'events/JcVtRhMUje3XNLva9Kf5ZVaPuvr0qXMztdOh4feM.jpg', 'training', '2023-02-23 06:39:46', '2023-02-26 15:35:50', NULL),
(2, 'Workshop \"Collective Action Coalition Against Corruption in Indonesian Private Sector: Issues and Challenges\"', '<p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Jakarta &Atilde;&cent;&acirc;&#130;&not;&acirc;&#128;&#156; Twelve Companies who are keen on the CAC program have joined the workshop conducted by IICD entitled \"Collective Action Coalition Against Corruption in Indonesian Private Sector: Issues and Challenges\" 0n 25th June 2019. The workshop discussed the initial CAC principle documents that contain topics regarding; Principles on companies&Atilde;&cent;&acirc;&#130;&not;&acirc;&#132;&cent; internal controls, Principles on companies&Atilde;&cent;&acirc;&#130;&not;&acirc;&#132;&cent; efforts to address national anti-corruption concerns, and Principles on companies&Atilde;&cent;&acirc;&#130;&not;&acirc;&#132;&cent; efforts to address corruption in the private sector.<p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Mr. Phisanu Phromchanya, the Communication Consultant of CAC Thailand, shared the experience of CAC Thailand to implement and grow the program. One key of his presentation is that to ensure the quality of the coalition, CAC Thailand gives the companies that already signed the Declaration of Intent a timeframe limit to implement the checklist. The checklist has consisted of companies&Atilde;&cent;&acirc;&#130;&not;&acirc;&#132;&cent; anti-corruption policies.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Most of the companies that are participating in the workshop are eager to join the coalition. It was realized that this kind of program should be addressed by the top-down mechanism. The essential instrument is the owner/CEO/Director\'s commitment to implementing these anti-corruption compliances within their company management.&nbsp;&nbsp;</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>All participants positively welcomed the intention of this coalition and suggested that several items in the draft 71 list adopted from the Thai IOD, be adjusted to the KPK\'s Profit program, and ensure the sustainability of the program in Indonesia. (25/06/2019)</p></p>\n', 'Twelve Companies who are keen on the CAC program have joined the workshop conducted by IICD entitled \"Collective Action Coalition Against Corruption in Indonesian Private Sector: Issues and Challenges\" 0n 25th June 2019.', 'workshop-collective-action-coalition-against-corruption-in-indonesian-private-sector-issues-and-challenges', 'events/3pz0ezToAuQi8xmhzyWKDi1DkxBbhwRGLrTgdNIY.jpg', 'seminar', '2023-02-26 15:41:31', '2023-02-26 15:41:53', NULL),
(3, 'The Establishment of Anti-Corruption Task Force', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Jakarta - The Collective Action Coalition Against Corruption (CAC) program in Indonesia began to be prepared since the 19th of October 2018. In order to ensure the success of the program, IICD internally formed an Anti-Corruption Task Force intending to assist the implementation of the CAC program in Indonesia. Andi Ilham Said who acts as Chairman of the IICD Advisory Board was appointed as Chairman of Task Force along with members from IICD Board, including; Dodi Prawira Amtar, Endang Hoyaranda, Eko Saka Purnama, James Simanjuntak, Nina Insania Permana, Lukas Atmaja, and Sukono Soebekti. (19/10/2018)</span></span></p></body></html>\n', 'IICD internally formed an Anti-Corruption Task Force intending to assist the implementation of the CAC program in Indonesia.', 'the-establishment-of-anti-corruption-task-force', 'events/vhDVB6cL1ohGafI5Ogo79Nud6pc9fLmBvnMBNsJp.jpg', 'seminar', '2023-02-26 15:42:31', '2023-02-26 15:42:31', NULL),
(4, 'Establishment of CAC Advisory Committee', '<html><body><p>Content<strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>Jakarta</strong> &acirc;&#128;&#147; Amidst the global pandemic, CAC program implementation in Indonesia continues to grow strong. On 1 July 2020, CAC established its own Advisory Committee consisted of several business associations such as KNKG (National Committee on Governance Policy), and 5 (five) Business Associations: KADIN (Indonesian Chamber of Commerce and Industry), AEI (Indonesian Public Listed Companies Association), APINDO (Employers\' Association of Indonesia), IBL (Indonesia Business Links), and PERBANAS. The chairman of each association joins the virtual establishment meeting. FBN (Yayasan Fitrah Bisnis Keluarga Nusantara) and IGCN (Indonesia Global Compact Network) also convey their interest to join the committee but due to prior engagement could not attend this virtual establishment meeting yet.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>The meeting was also attended by the representative from Indonesia Stock Exchange (BEI) to show their support for the coalition. The meeting has officially established the CAC Advisory Committee and appointed Mr. Erry Riyana Hardjapamekas as the Chair of the Committee. The establishment of this committee is a step closer to finally grow the coalition and encourage fellow companies to be aware of this business anti-corruption movement. <strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>(01/07/2020)</strong></p></body></html>\n', 'On 1 July 2020, CAC established its own Advisory Committee consisted of several business associations', 'establishment-of-cac-advisory-committee', 'events/M8MlHIIwUcM1IBwW0dYqQF97FiVI79s8zH0CjJCX.png', 'seminar', '2023-02-26 15:43:53', '2023-02-26 15:43:53', NULL),
(5, 'KAKI menghadirkan sesi dalam International Business Ethics Conference 2021', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Jakarta - Pada hari Rabu, 7 Juli 2021, KAKI mengadakan sesi di hari pertama International Business Ethics Conference (IBEC) 2021 yang berjudul: \"Anti-Corruption Culture in Organization &amp; KAKI (Koalisi Anti Korupsi Indonesia). Pada sesi ini dijelaskan mengenai pentingnya memiliki etika bisnis yang baik untuk menghindari resiko-resiko korupsi. Pembicara sesi KAKI kali ini adalah Bapak Erry Riyana Hardjapamekas, Chairman of KAKI Advisory Committee dan Gibson Haynes, CIPE Indonesia program officer.&nbsp;</span></span></p></body></html>\n', 'Pada hari Rabu, 7 Juli 2021, KAKI mengadakan sesi di hari pertama International Business Ethics Conference (IBEC) 2021 yang berjudul: \"Anti-Corruption Culture in Organization & KAKI (Koalisi Anti Korupsi Indonesia).', 'kaki-menghadirkan-sesi-dalam-international-business-ethics-conference-2021', 'events/qag4SjO2k4TueFPZKwGK9Gx5k87Q0XNxUGwHx2EA.jpg', 'seminar', '2023-02-26 15:44:52', '2023-02-26 15:44:53', NULL),
(6, 'KAKI Webinar \"Managing the Risk of Bribery Amids the Pandemic in the Private Sector', '<html><body><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>Jakarta </strong>- Pada hari Selasa, 31 Agustus 2021 telah diselenggarakan webinar KAKI dengan tema,&nbsp; &acirc;&#128;&#156;<em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>Managing the Risk of Bribery Amidst the Pandemic in the Private Sector.&acirc;&#128;&#157;</i></em> Acara webinar ini merupakan rangkaian kegiatan dari KAKI untuk mempromosikan sistem tata kelola anti-korupsi yang baik bagi perusahaan.&nbsp;</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Acara hari ini dihadiri oleh Menteri Koordinator bidang Perekonomian RI, Bapak Airlangga Hartarto yang memberikan <em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>welcoming remarks</i></em> serta Menteri Koperasi dan Usaha Kecil Menengah RI, Bapak Teten Masduki sebagai pemberi <em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>keynote speech.</i></em></p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Ketua umum IICD, Bapak Sigit Pramono mengungkapkan pada kata sambutannya, program KAKI merupakan wujud nyata komitmen IICD dalam isu anti-korupsi untuk mempromosikan pentingnya kehadiran GCG di Indonesia. KAKI diharapkan dapat menjadi platform untuk mempersatukan pihak-pihak bisnis yang berintegritas dan membantu perusahaan-perusahaan untuk menciptakan iklim bisnis tanpa korupsi. &nbsp;Ketua Advisory Committee, Bapak Erry Riyana Hardjapamekas menegaskan &nbsp;bahwa solusi untuk menanggulangi praktik korupsi yang timbul terutama selama pandemi ini ada di depan mata, KAKI merupakan solusi yang cenderung sederhana bagi sektor swasta.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Pandemi memiliki dampak yang sangat signifikan bagi perusahaan. Risiko-risiko operasionalisasi perusahaan pun naik, terutama risiko suap. Webinar KAKI membahas tantangan-tantangan, kerugian laba, serta ketidakpastian yang selalu membayangi perusahaan-perusahaan di tengah situasi COVID-19 ini. Diskusi webinar ini meliputi bagaimana manajemen anti-suap yang baik beserta contoh-contoh sistem anti-suap yang telah teruji dan memiliki standar nasional maupun internasional.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Para pembicara webinar ini pun merupakan tokoh yang telah berkecimpung lama dan ahli dalam bidangnya masing-masing, antara lain; Mr. Kulvech Janvatanavit, Presiden IOD Thailand; Bapak Arsad Rasjid, Ketua KADIN Indonesia; Ibu Natalia Soebagjo (Dewan Penasihat Transparency Internasional Berlin); Bapak Irwan Habsjah (Komisioner Independen BTPN dan anggota Advisory Committee KAKI).&nbsp;</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Webinar ini didukung oleh <em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>Center for International Private Enterprise</i></em> (CIPE) yang berbasis di Washington DC dan juga merupakan afiliasi dari <em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>US Chamber of Commerce</i></em>. Acara ini pun didukung oleh asosiasi-asosiasi bisnis terkemuka di Indonesia yang juga merupakan bagian dari <em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>Advisory Committee</i></em> KAKI, yaitu: KADIN Indonesia, KNKG, AEI, IICG, APINDO, HIPMI Kota Bandung, Indonesia Business Link, IGCN, serta GRCI.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>IICD merupakan organisasi nirlaba yang didirikan pada tahun 2000 oleh 10 universitas/sekolah bisnis terkemuka di Indonesia, dan memilki visi melakukan internalisasi praktik-praktik tata kelola perusahaan yang baik berdasarkan standar internasional, dan pengembangan program anti korupsi ini adalah merupakan bagian dari kegiatan IICD dalam usaha mempromosikan pentingnya GCG di Indonesia.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>KAKI adalah koalisi bagi sektor swasta Indonesia untuk secara kolektif menciptakan, mengadopsi, dan menyebarkan anti-korupsi yang efektif melalui kebijakan kepatuhan dan pengambilan inisiatif untuk mengurangi korupsi dan mempromosikan ekosistem bisnis yang bersih di Indonesia.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Sistim Anti Korupsi ini didasarkan atas keberhasilan CAC Thailand yang telah mengajak lebih dari 1000 perusahaan Thailand mengurangi korupsi di sektor swasta dalam satu dekade terakhir. Webinar kali ini juga merupakan salah satu bentuk sosialisasi KAKI sebagai metode efektif untuk menyelesaikan masalah yang muncul salah satunya karena dampak pandemi, serta bagaimana perusahaan dapat bertahan dan menjunjung tinggi nilai integritas demi menciptakan iklim bisnis yang bersih di Indonesia</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Video Webinar dapat dilihat dalam YouTube channel IICD: <a href=\"https://www.youtube.com/watch?v=r4Di8beAexc&amp;t=4050s\">https://www.youtube.com/watch?v=r4Di8beAexc&amp;t=4050s</a></p></body></html>\n', 'Pada hari Selasa, 31 Agustus 2021 telah diselenggarakan webinar KAKI dengan tema,  “Managing the Risk of Bribery Amidst the Pandemic in the Private Sector.”', 'kaki-webinar-managing-the-risk-of-bribery-amids-the-pandemic-in-the-private-sector', 'events/3SdmCSLTmfpeyAcVj6OLmmfeP1tr82av6IWlExRS.jpg', 'seminar', '2023-02-26 15:45:58', '2023-02-26 15:45:58', NULL),
(7, 'UPCOMING: KAKI-IIPG WEBINAR', '<html><body><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Save the Date: Selasa, 30 November 2021! Pendaftaran: <a style=\'background-color:transparent;box-sizing:border-box;color:rgb(0, 123, 255);font-family:\"Century gothic\";text-decoration:none;\' href=\"https://bit.ly/webinarKAKI2021\">https://bit.ly/webinarKAKI2021</a></p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Koalisi Anti Korupsi Indonesia (KAKI) dan Indonesian Institute for Public Governance (IIPG) menyelenggarakan acara webinar dengan judul &acirc;&#128;&#156;Meningkatkan Transparansi &amp; Tata Kelola yang Baik dalam rangka Mencegah Korupsi selama Masa Pandemi&acirc;&#128;&#157;&nbsp;</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Acara ini \"FREE OF CHARGE\"&nbsp;</p></body></html>\n', 'Save the Date: Selasa, 30 November 2021! Pendaftaran: https://bit.ly/webinarKAKI2021', 'upcoming-kaki-iipg-webinar', 'events/IUd6MW6ztAzmR6cxKinlzwxu4FsFFvujLvOKcop7.png', 'seminar', '2023-02-26 15:46:51', '2023-02-26 15:46:51', NULL),
(8, 'KAKI dalam 13th IICD CG Award', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Dalam 13th IICD CG Award pada 27 Mei 2022. KAKI menggelar booth di samping meja pendaftaran acara.&nbsp; Booth tersebut difasilitasi dengan roller banner, brosur cetak, catatan satu halaman tentang KAKI, dan souvenir. Sekretariat&nbsp;KAKI juga berada di booth untuk menjawab pertanyaan-pertanyaan yang dilayangkan oleh perusahaan-perusahaan yang tertarik untuk bergabung bersama dengan koalisi bisnis anti-korupsi ini.&nbsp;</span></span></p></body></html>\n', 'Untuk mempromosikan program KAKI ke lebih banyak anggota perusahaan, sekretariat IICD dan KAKI bekerja sama untuk mempromosikan program KAKI dalam acara 13th IICD CG Award 2022', 'kaki-dalam-13th-iicd-cg-award', 'events/blHg5SV6hRIVeW53gFnCuuzl8ginZfk75IeFUViS.png', 'seminar', '2023-02-26 15:47:41', '2023-02-26 15:47:41', NULL),
(9, 'Join Us in Advancing Collective Action Against Corruption on Agribusiness Sector FGD!', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Hadiri acara FGD Korupsi di sektor Agribisnis, acara kolaborasi IGCN dengan KAKI, Paramadina University, Transparency International Indonesia, dan ICC Indonesia pada hari Selasa, 9 Agustus 2022 pukul 09:00 - 12:00 WIB&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Registrasi: </span></span><a href=\"bit.ly/ACCA-FGD-1\"><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>bit.ly/ACCA-FGD-1</span></span></a></p></body></html>\n', 'Hadiri acara FGD Korupsi di sektor Agribisnis, acara kolaborasi IGCN dengan KAKI, Paramadina University, Transparency International Indonesia, dan ICC Indonesia pada hari Selasa, 9 Agustus 2022 pukul 09:00 - 12:00 WIB Registrasi: bit.ly/ACCA-FGD-1', 'join-us-in-advancing-collective-action-against-corruption-on-agribusiness-sector-fgd', 'events/jR2PKEMEytLXuySWvE9ztWlAqVIM7iKSiTRKfNkY.jpg', 'seminar', '2023-02-26 15:48:47', '2023-02-26 15:48:47', NULL),
(10, 'Join KAKI in the B20 Side Event Panel Discussion Collective Action in Alleviating Integrity Risks', '<html><body><p class=\"p1\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Join Koalisi Anti Korupsi Indonesia (KAKI) in the 3rd Panel Session of the B20 Side event tto discuss Business Collective Action Coalition\'s experience in fighting against corruption in Indonesia on 10 October 2022 at 19:45 - 20:30 WIB !</p><p class=\"p1\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Online Registration: bit.ly/B20InCSideEvent_ONLINE</p></body></html>\n', 'Join Koalisi Anti Korupsi Indonesia (KAKI) in the 3rd Panel Session of the B20 Side event tto discuss Business Collective Action Coalition\'s experience in fighting against corruption in Indonesia on 10 October 2022 at 19:45 - 20:30 WIB ! Online Registration: bit.ly/B20InCSideEvent_ONLINE', 'join-kaki-in-the-b20-side-event-panel-discussion-collective-action-in-alleviating-integrity-risks', 'events/xLcrd2FMBTX1lXwV2gUNk1lhyemRmLpHSMpowU5G.jpg', 'seminar', '2023-02-26 15:49:33', '2023-02-26 15:49:33', NULL),
(11, 'Forum KAKI \"Arah Kebijakan dan Tantangan tahun 2023: Pencegahan Korupsi oleh Sektor Swasta\"', '<html><body><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>Menanti Peran Sektor Swasta dalam Pemberantasan Korupsi di Indonesia</strong></p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>Jakarta, 25 November 2022. </strong>Peran sektor swasta perlu lebih ditingkatkan dalam upaya memerangi korupsi yang selama ini telah memberikan dampak buruk bagi dunia bisnis di Indonesia, bukan saja karena menghambat pertumbuhan ekonomi dan pemerataan daya saing bisnis, namun juga meningkatkan 10% dari total biaya aktivitas bisnis secara global. Demikian disampaikan Erry Riyana Hardjapamekas, Ketua KAKI Advisory Committee, dalam <strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>KAKI Forum</strong>, bertema <strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>Arah Kebijakan dan Tantangan Tahun 2023: Pencegahan Korupsi oleh Sektor Swasta</strong>, di Jakarta.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Erry merujuk data pada Komisi Pemberantasan Korupsi [KPK] dari tahun 2004 hingga 2018, tercatat 238 kasus korupsi sektor swasta, yang merupakan angka korupsi tertinggi kedua setelah anggota parlemen.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&acirc;&#128;&#156;Banyak modus yang dilakukan dalam sejumlah praktek korupsi di sektor swasta, antara lain pembayaran tambahan atau insentif lainnya untuk mempermudah dan melancarkan bisnis, yang tentunya sangat merugikan dan menyebabkan ekonomi biaya tinggi dalam kegiatan bisnis,&acirc;&#128;&#157; ujar Erry Riyana Hardjapamekas.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Oleh karena itu Erry menilai sektor swasta memiliki peran penting dalam memberantas korupsi, sekaligus menciptakan solusi yang mendukung prioritas pembangunan Indonesia.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&acirc;&#128;&#156;Sektor swasta memiliki peran yang penting dalam menciptakan lingkungan bisnis yang bersih, transparan, dan akuntabel. Melalui ekosistem bisnis yang bebas korupsi, perekonomian Indonesia akan menarik lebih banyak investor dan memberikan potensi kerja sama bisnis jangka panjang.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Ditambahkannya, dengan meningkatkan transparansi, menerapkan kebijakan anti korupsi dan kepatuhan, perusahaan akan dapat mencapai bisnis yang berkelanjutan. &acirc;&#128;&#156;Ketika mayoritas perusahaan mengadopsi praktik bisnis yang bersih lingkungan bisnis akan berubah secara signifikan dan korupsi dalam segala bentuk atau menjadi praktik yang tidak dapat diterima,&acirc;&#128;&#157; kata Erry.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Lebih jauh&nbsp; mantan Ketua KPK ini menjelaskan meskipun belum ada undang-undang yang mengatur korupsi antara pihak swasta dan swasta, bukan berarti tidak ada kebijakan atau regulasi yang mengatur tindak pencegahan korupsi di sektor swasta.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&acirc;&#128;&#156;Korporasi saat ini bisa terjerat kasus korupsi jika tidak memiliki langkah-langkah kebijakan anti-korupsi,&acirc;&#128;&#157; tegas Erry. &acirc;&#128;&#156;Pada tahun 2017, pertama kalinya korporasi didakwa korupsi, dan meningkat menjadi empat perusahaan pada tahun. 2018, hal itu berarti bahwa dalam situasi saat ini sektor swasta juga akan bertanggung jawab atas praktik korupsi mereka,&acirc;&#128;&#157; tuturnya menambahkan.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Dia memaparkan, berdasar pada PERMA no. 13 Tahun 2016, Sistem Anti Suap OJK, UU Gratifikasi, dan Program Profit KPK, penanggulangan tindak pidana korupsi tidak hanya terfokus pada sektor publik tetapi juga pada sektor swasta.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&acirc;&#128;&#156;Untuk dapat mencapai itu semua, pentingya mewujudkan tindakan kolektif yang memperkuat serta mendukung terciptanya kolaborasi antara publik dan swasta sehingga dapat menjadi penggerak penting untuk menciptakan lingkungan bisnis yang bersih.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&acirc;&#128;&#156;Dengan bergerak bersama, sektor swasta akan memiliki teman-teman yang berpikiran sama untuk berjuang bersama dalam membangun integritas bisnis. Aliansi ini juga penting agar mereka memiliki saluran penyebaran dan pembahasan peraturan pemerintah yang baru, serta menyampaikan kepada pemerintah jika ada kebijakan yang tumpang tindih, tidak relevan, atau tidak sesuai dengan kondisi lapangan,&acirc;&#128;&#157; pungkas Erry.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Sejumlah pembicara penting turut hadir dalam kegiatan KAKI Forum --yang akan menjadi wadah bagi perusahaan untuk bertemu dan berdiskusi bersama tentang isu korupsi saat ini dan bersama-sama mencari solusi, antara lain; Sigit Pramono, Ketua Umum IICD dan IIPG, M. Arsjad Rasjid P. M., Ketua Umum KADIN Indonesia dan John Morrell, Regional Director for Asia and Pacific, Center for International Private Enterprise (CIPE).</p></body></html>\n', 'Jakarta, 25 November 2022 - Peran sektor swasta perlu lebih ditingkatkan dalam upaya memerangi korupsi yang selama ini telah memberikan dampak buruk bagi dunia bisnis di Indonesia, bukan saja karena menghambat pertumbuhan ekonomi dan pemerataan daya saing bisnis, namun juga meningkatkan 10% dari total biaya aktivitas bisnis secara global.', 'forum-kaki-arah-kebijakan-dan-tantangan-tahun-2023-pencegahan-korupsi-oleh-sektor-swasta', 'events/IKA7iyjKLMododoRdlWJwW4dlzM3GBb0y8iHoidC.jpg', 'seminar', '2023-02-26 15:50:40', '2023-02-26 15:50:40', NULL),
(12, 'KAKI Menang Anti-Corruption Excellence Award diselenggarakan oleh UNODC & ROLACC', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Doha, 8 Desember 2022 - Menyambut Hari Anti-Korupsi sedunia (9 Desember 2022), kabar baik datang dari Doha, Qatar untuk gerakan anti-korupsi di Indonesia. Koalisi Anti Korupsi Indonesia (KAKI) memenangkan penghargaan Sheikh Tamim bin Hamad Al Thani Anti-Corruption Excellence Award untuk kategori Youth Creativity and Engagement yang diprakarsai oleh Rule of Law and Anti-Corruption Center (ROLACC) dan United Nations Office on Drugs and Crime (UNODC) pada tanggal 8 Desember 2022.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>KAKI merupakan platform kerjasama bagi sektor swasta untuk bersama-sama membuat, mengadopsi, dan menyebarkan kebijakan anti-korupsi dan kepatuhan yang efektif, mengambil inisiatif untuk mengekang korupsi dan mempromosikan ekosistem bisnis yang bersih di Indonesia. KAKI berkomitmen untuk membantu perusahaan meningkatkan standar kepatuhan mereka dan mendukung mereka untuk menerapkan langkah-langkah yang diperlukan.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>&acirc;&#128;&#156;Penghargaan ini memotivasi kami untuk lebih giat lagi menggalang koalisi sektor swasta sekaligus menjadi peluang baik dalam menggalang kolaborasi global bersama UNODC dan merupakan tindak lanjut G20/2022, menuju Indonesia maju dan bersih dari korupsi,&acirc;&#128;&#157; ujar Erry Riyana Hardjapamekas, Ketua KAKI.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Erry menambahkan bahwa kemenangan ini juga berfungsi sebagai seruan dan pengingat bahwa korupsi tidak bisa diberantas hanya oleh satu atau dua individu. Semua memiliki peran untuk dimainkan agar perilaku korup menjadi praktik yang tidak dapat diterima di masyarakat.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Hal ini senada dengan tema Hari Anti-Korupsi Internasional yang diusung oleh UNODC: Uniting the world against corruption, semua memiliki hak dan kewajiban dalam memberantas korupsi dan hanya melalui kerja sama dan keterlibatan setiap orang dan lembaga kita dapat mengatasi dampak negatif dari kejahatan luar biasa ini.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Erry mengapresiasi Emir Qatar yang telah memprakarsai pemberian penghargaan terhadap gerakan anti-korupsi selama ini. Dengan adanya pengakuan internasional ini, Koalisi Anti-Korupsi Indonesia akan semakin berkembang dengan melibatkan lebih banyak pelaku bisnis dan wirausahawan muda sebagai penerus bangsa. Erry berharap penghargaan ini selanjutnya dapat diadakan di Indonesia terutama di Jakarta.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Sejumlah pembicara penting turut hadir dalam acara penghargaan ini, antara lain: Sheikh Tamim bin Hamad Al Thani (Emir Qatar), Ghada Fathi Waly (Eksekutif Direktur UNODC), Paul Kagame (President of Rwanda), Gianni Infantino (President of FIFA), dan Dr. Ali bin Fetais Al Marri (Ketua Dewan Pembina dan pendiri ROLACC).</span></span><br><br><a style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 123, 255);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:left;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\' href=\"https://www.linkedin.com/feed/hashtag/?keywords=unitedagainstcorruption&amp;highlightedUpdateUrns=urn%3Ali%3Aactivity%3A7007014324938371072\">#UnitedAgainstCorruption</a></p></body></html>\n', 'Koalisi Anti Korupsi Indonesia (KAKI) memenangkan penghargaan Sheikh Tamim bin Hamad Al Thani Anti-Corruption Excellence Award untuk kategori Youth Creativity and Engagement yang diprakarsai oleh Rule of Law and Anti-Corruption Center (ROLACC) dan United Nations Office on Drugs and Crime (UNODC)', 'kaki-menang-anti-corruption-excellence-award-diselenggarakan-oleh-unodc-rolacc', 'events/8BmWoh0gLFEVHUOnU9jf6ci8zsf4CWSYngWVgBEY.jpg', 'seminar', '2023-02-26 15:51:42', '2023-02-26 15:51:42', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `short_description` longtext NOT NULL,
  `body` longtext NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `media`
--

INSERT INTO `media` (`id`, `title`, `slug`, `thumbnail`, `short_description`, `body`, `category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '3 Sistem Antikorupsi Bisa Jadi Rujukan', '3-sistem-antikorupsi-bisa-jadi-rujukan', 'medias/403jPEehblGpN5xp7EJpxf9307bsSMc4roSkG4it.jpg', 'Untuk menghadapi praktik korupsi di Indonesia yang tidak ada habisnya, ada 3 sistem AntiKorupsi yang dapat dijadikan rujukan dan dipilih sebagai standar penegakan kebijakan antikorupsi yang sesuai dilaksanakan dalam organisasi nya.', '<p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Berita peluncuran CAC Indonesia di investor.id<p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&nbsp;</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>JAKARTA, investor.id &Atilde;&cent;&acirc;&#130;&not;&acirc;&#128;&#156; Untuk menghadapi praktik korupsi di Indonesia yang tidak ada habisnya, ada 3 sistem AntiKorupsi yang dapat dijadikan rujukan dan dipilih sebagai standar penegakan kebijakan antikorupsi yang sesuai dilaksanakan dalam organisasi nya. Pembahasan antikorupsi ini mengemuka pada acara seminar daring (sedaring) yang digelar IICD bekerjasama dengan Center for International Private Enterprises (CIPE) dengan didukung oleh IDX, KNKG, AEI, Apindo, Kadin, dan IBL yang mengangkat tema &Atilde;&cent;&acirc;&#130;&not;&Aring;&#147;Understanding How to Prevent Corruption in New Reality&Atilde;&cent;&acirc;&#130;&not;&Acirc;&#157;. Acara ini disiarkan Beritasatu TV, Rabu (15/7/2020).</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Sedaring ini dibuka dengan sambutan dari Ketua Umum IICD, Sigit Pramono dan mengangkat 3 sistem Antikorupsi yang sedang popular di Indonesia, yaitu ISO 37001 yang dibawakan oleh Roni Maulana, Profesional Berintegritas KPK oleh Pahala Nainggolan serta yang paling baru adalah Sistem Antikorupsi Collective Action Coalition (CAC) Indonesia yang dibawakan oleh Andi Ilham Said, Ketua Task Force CAC Indonesia, serta Frank Brown &amp; Gibson Haynes yang menginformasikan tentang sistem CAC yang sudah terlaksana dengan sukses di Thailand. Ada beberapa prinsip dalam Pengembangan Standar ISO yaitu;1.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Standar ISO merespons kebutuhan di pasar, 2. Standar ISO didasarkan pada pendapat ahli global, 3. Standar ISO dikembangkan melalui proses multi-pemangku kepentingan,4. Standar ISO didasarkan pada konsensus. ISO 37001 rilis di Indonesia tahun 2016 menjadi SNI ISO 37002 Sistem Manajemen Antipenyuapan diterjemahkan oleh Badan Standardisasi Nasional, ditegaskan oleh Roni Maulana, prakstisi ISO 37001. Pahala Nainggolan, Deputi Pencegahan KPK menyatakan bahwa jika pelaku korupsi dihitung berdasarkan jumlah orang di KPK, pelaku swasta menempati posisi paling banyak.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Tahun 2016 KPK mulai mengarahkan upaya pencegahan ke sektor swasta. 2016 awal KPK meluncurkan buku Panduan Cek untuk perusahaan memeriksakan diri pada buku itu sehingga bisa mengetahui di komponen mana harus diperbaiki. Panduan CEK dapat dijadikan sebagai sebagai self assess, sebelum masuk ke ISO. Profit (Profesional Berintegritas) merupakan sertifikasi thdp personal. Tahun 2017 disahkan kemenaker dan BNSP. Sudah 60 orang tersertifikasi dari beberapa perusahaan. Andi Ilham Said, Ketua Task Force CAC Indonesia menyatakan, CAC Thailand merupakan suatu sistim Aintikorupsi yang dapat diadopsi di Indonesia. &Atilde;&cent;&acirc;&#130;&not;&Aring;&#147;CAC merupakan Forum dari kita untuk kita. Sebagai platform bisnis untuk mempersatukan pihak-pihak yang berintegritas dalam menegakkan sistim Antikorupsi secara lebih mudah dan sederhana,&Atilde;&cent;&acirc;&#130;&not;&Acirc;&#157; katanya. Koalisi CAC mengadopsi sistim yang sudah sukses di Thailand dan disesuaikan dengan kondisi di Indonesia. Frank Brown &amp; Gibson Haynes menegaskan bahwa Pemberantasan korupsi perlu kerjasama antara sektor swasta dengan pemerintah dan sipil. CIPE dengan partner di Thailand sudah membuktikan&nbsp; keberhasilan CAC di THAILAND , dan sampai saat ini sudah lebih dari 1000 perusahaan bergabung dangan CAC. Erry Riyana Hardjapamekas yang merupakan Ketua Advisory Committee CAC Indonesia yang bertindak sebagai moderator pada acara sedaring ini menutup diskusi ini dengan menyatakan bahwa pada dasarnya penegakan antikorupsi di Indonesia bukanlah suatu perjalanan yang singkat. &Atilde;&cent;&acirc;&#130;&not;&Aring;&#147;Ini menyangkut akhlak dan budaya, dan untuk memperbaiki akhlak dan budaya&nbsp; bukan hanya pekerjaan KPK, Kejaksaan ataupun polisi saja, tapi merupakan tugas dari kita semua,&Atilde;&cent;&acirc;&#130;&not;&Acirc;&#157; katanya. Menurut Erry Riyana Hardjapamekas dengan istilah &Atilde;&cent;&acirc;&#130;&not;&Aring;&#147;It takes two to tango&Atilde;&cent;&acirc;&#130;&not;&Acirc;&#157; Birokrasi&nbsp; digoda swasta ataupun sebaliknya, sehingga tugas koalisi CAC adalah menggalang pihak swasta untuk teguh menjalankan bisnis tanpa korupsi, dan menjaga konsistensi dan keberlanjutan agenda korupsi di Indonesia, bukan hanya pemerintah, tapi juga pihak swasta, masyarakat sipil, media, akademisi dan sebagainya.</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&Atilde;&cent;&acirc;&#130;&not;&Aring;&#147;Mari Kita Wujutkan Indonesia yang bersih dari Korupsi dengan mulai memilih sistim Antikorupsi yang mudah, sederhana dan fleksibel sesuai dengan kebutuhan organisasi masing-masing,&Atilde;&cent;&acirc;&#130;&not;&Acirc;&#157; kata Host acara, Vita Diani Satiadhi menutup acara. (gr) Editor : Gora Kunjana (gora_kunjana@investor.co.id) Sumber : Investor Daily<br><br>Artikel ini telah tayang di&nbsp;<a style=\'background-color:transparent;box-sizing:border-box;color:rgb(0, 123, 255);font-family:\"Century gothic\";text-decoration:none;\' href=\"https://investor.id/\">Investor.id</a>&nbsp;dengan judul \"3 Sistem Antikorupsi Bisa Jadi Rujukan\"<br><a style=\'background-color:transparent;box-sizing:border-box;color:rgb(0, 123, 255);font-family:\"Century gothic\";text-decoration:none;\' href=\"https://investor.id/national/3-sistem-antikorupsi-bisa-jadi-rujukan\">https://investor.id/national/3-sistem-antikorupsi-bisa-jadi-rujukan</a></p></p>\n', 'news', '2023-02-26 20:38:38', '2023-02-26 20:39:40', NULL),
(3, 'Sistem Pencegahan-Antikorupsi CAC Diluncurkan', 'sistem-pencegahan-antikorupsi-cac-diluncurkan', 'medias/tsOd12PGg36HYxlrSfVRiamm7yqeJqAErF9hjcB0.jpg', 'Sistem pencegahan antikorupsi Collective Action Coalition (CAC) yang dibentuk oleh Indonesian Institute Corporate Directorship (IICD) dan Center for International Private Enterprises (CIPE) diluncurkan, Selasa (11/8).', '<html><body><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Media Republika meliput dan menaikkan berita mengenai peluncuran Collective Action Coalition against Corruption (CAC) Indonesia.&nbsp;</span></span></p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&nbsp;</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>REPUBLIKA.CO.ID, JAKARTA -- Sistem pencegahan antikorupsi&nbsp;</span></span><em style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(25, 25, 25);font-family:\"Open Sans\", Arial, Helvetica, sans-serif;font-size:18px;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:500;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><i>Collective Action Coalition</i></em><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>&nbsp;(CAC) yang dibentuk oleh&nbsp;</span></span><em style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(25, 25, 25);font-family:\"Open Sans\", Arial, Helvetica, sans-serif;font-size:18px;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:500;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><i>Indonesian</i></em><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>&nbsp;</span></span><em style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(25, 25, 25);font-family:\"Open Sans\", Arial, Helvetica, sans-serif;font-size:18px;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:500;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><i>Institute Corporate Directorship</i></em><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>&nbsp;(IICD) dan</span></span><em style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(25, 25, 25);font-family:\"Open Sans\", Arial, Helvetica, sans-serif;font-size:18px;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:500;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><i>&nbsp;Center for International Private Enterprises</i></em><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>&nbsp;(CIPE) diluncurkan, Selasa (11/8). Peluncuran tersebut dilakukan secara virtual bersama Komite Nasional Kebijakan Governance (KNKG), AEI, Asosiasi Pengusaha Indonesia (Apindo), Kamar Dagang dan Industri (Kadin), Perhimpunan Bank Swasta Nasional (Perbanas), serta IBL.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Ketua Task Force</span></span><a href=\"https://republika.co.id/tag/cac\"><strong><u>&nbsp;CAC&nbsp;</u></strong></a><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Indonesia Andi Ilham Said menegaskan pentingnya sistem</span></span><a href=\"https://republika.co.id/tag/antikorupsi\"><strong><u>&nbsp;antikorupsi&nbsp;</u></strong></a><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>CAC guna mendukung program antikorupsi di Indonesia. Ia mengharapkan sistem CAC Anti</span></span><a href=\"https://republika.co.id/tag/korupsi\"><strong><u>&nbsp;Korupsi&nbsp;</u></strong></a><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>di Indonesia&nbsp; ini terlaksana dengan sukses untuk membantu pemerintah mencegah korupsi.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>\"Sistem CAC Anti Korupsi di Indonesia yang sudah terlaksana ini diharapkan sukses seperti di Thailand yang berhasil mengajak lebih dari 1.000 perusahaan swasta untuk membantu pemerintahnya dalam mencegah korupsi,&acirc;&#128;&#157; kata Andi dalam siaran pers yang diterima&nbsp;</span></span><em style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(25, 25, 25);font-family:\"Open Sans\", Arial, Helvetica, sans-serif;font-size:18px;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:500;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><i>Republika.co.id,</i></em><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>&nbsp;Selasa (11/8).</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>CAC, menurut Andi, merupakan sistem antikorupsi sederhana yang dapat diadopsi di Indonesia. CAC merupakan forum dari dan untuk platform bisnis, untuk mempersatukan pihak-pihak yang berintegritas dalam menegakkan sistem antikorupsi, secara lebih mudah dan sederhana.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Pemberantasan korupsi di Indonesia, kata Andi, bukanlah perjalanan yang singkat, karena&nbsp; menyangkut akhlak dan budaya. Sehingga perlu kerja sama antara sektor swasta dengan pemerintah dan sipil.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Tugas koalisi CAC, lanjutnya, adalah menggalang pihak swasta untuk teguh menjalankan bisnis tanpa korupsi, dan menjaga konsistensi dan keberlanjutan agenda korupsi di Indonesia. \"Bukan hanya pemerintah, tapi juga pihak swasta, masyarakat sipil, media, akademisi, dan sebagainya,&acirc;&#128;&#157; ungkapnya.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Ditambahkannya, CCA juga diciptakan karena mereka menyadari bahwa peranan sektor swasta sangat penting dalam menangani korupsi secara efektif. Sekaligus menciptakan solusi yang mendukung prioritas pembangunan di Indonesia.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Andi Ilham mengatakan, ketika mayoritas pemain utama dari masing-masing industri mengadopsi praktik bisnis bersih, maka secara signifikan mengubah lanskap bisnis keseluruhan. Sehingga korupsi dalam segala bentuk pada akhirnya akan menjadi praktik yang tidak dapat diterima.&nbsp;</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Ada beberapa cara kerja CAC untuk memberantas korupsi di Indonesia. Pertama, bekerja dengan perusahaan Indonesia dan asosiasi bisnis, merujuk kerangka peraturan yang ada, CAC mengembangkan standar antikorupsi yang disesuaikan dengan kebutuhan sektor swasta Indonesia. Kedua, CAC mengundang perusahaan untuk bergabung dengan koalisi dan memungkinkan mereka untuk mengadopsi standar melalui sesi pelatihan dan dukungan teknis.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>&acirc;&#128;&#156;Ketiga, launching CAC secara publik mengangkat perusahaan yang memperjuangkan praktik bisnis yang transparan.&nbsp; Dengan kelompok perusahaan yang berkembang, CAC membangun budaya integritas antar industri,\" kata Andi.</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Sejak 2018, IICD bekerjasama dengan CIPE untuk mendukung sektor privat dalam membentuk kegiatan kolektif melawan korupsi berdasarkan model yang sangat sukses dilaksanakan Thailand sejak 2010. Hal inilah yang menjadi acuan bagi penerapan CAC di Indonesia. CAC di Indonesia akan akan segera dibentuk, dari, oleh, dan untuk sektor swasta Indonesia. IICD akan berperan sebagai Lokomotif, dengan dukungan dari beberapa asosiasi bisnis seperti Kamar Dagang Indonesia (Kadin), Asosiasi Emiten Indonesia (AEI), Bursa Efek Indonesia (BEI), Indonesia Business Link (IBL) dan Asosiasi Pengusaha Indonesia (APINDO).</span></span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(25,25,25);\"><span>Erry Riyana Hardjapamekas, Ketua Advisory Committee CAC Indonesia menyatakan istilah &acirc;&#128;&#156;It takes two to tango&acirc;&#128;&#157; di birokrasi&nbsp; digoda swasta ataupun sebaliknya, sehingga tugas koalisi CAC adalah menggalang pihak swasta untuk teguh menjalankan bisnis tanpa korupsi, dan menjaga konsistensi dan keberlanjutan agenda korupsi di Indonesia.</span></span></p></body></html>\n', 'news', '2023-02-27 18:45:44', '2023-02-27 18:45:44', NULL),
(4, 'Cegah Korupsi di Perusahaan, IICD dan CIPE Dorong Program CAC', 'cegah-korupsi-di-perusahaan-iicd-dan-cipe-dorong-program-cac', 'medias/RXkQg2NewSWiHiXXliid58mLCf0OYQw1rcCGV40r.jpg', 'Indonesian Institute for Corporate Directorship (IICD) bersama dengan Center for International Private Enterprises (CIPE) membentuk program atau kegiatan Collective Action Initiative Againts Corruption (CAC).', '<html><body><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><strong>SINDONEWS&nbsp;</strong>menerbitkan berita mengenai peluncuran CAC Indonesia.&nbsp;</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&nbsp;</p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><strong>JAKARTA</strong><span style=\"color:rgb(37,37,37);font-family:Arial, Helvetica, sans-serif;\"><span>&nbsp;- Indonesian Institute for Corporate Directorship (IICD) bersama dengan Center for International Private Enterprises (CIPE) membentuk program atau kegiatan Collective Action Initiative Againts Corruption (CAC). Program ini dinilai efektif dalam mencegah terjadinya praktik korupsi di Indonesia, khususnya dari manajemen perusahaan seperti di sektor swasta.</span></span><br><br><span style=\"color:rgb(37,37,37);font-family:Arial, Helvetica, sans-serif;\"><span>Ketua Task Force CAC Andi Ilham Said mengatakan, mereka menyadari bahwa peranan sektor swasta sangat penting dalam menangani korupsi secara efektif sekaligus menciptakan solusi yang mendukung prioritas pembangunan di Indonesia.</span></span><br><br><span style=\"color:rgb(37,37,37);font-family:Arial, Helvetica, sans-serif;\"><span>\"CAC menyediakan platform bagi sektor bisnis untuk menjadi bagian dari solusi untuk masalah korupsi. Melibatkan lebih banyak entitas bisnis dan membantu mereka memasang kebijakan dan mekanisme antikorupsi akan secara langsung mengurangi risiko penyuapan secara keseluruhan. Mengingat momentum antikorupsi yang terus bergulir dan partisipasi perusahaan swasta yang semakin meningkat dari semua jenis dan ukuran,\" kata Andi, di Jakarta, Senin (20/7/2020).</span></span><br><br><span style=\"color:rgb(37,37,37);font-family:Arial, Helvetica, sans-serif;\"><span>Andi mengatakan, ketika mayoritas pemain utama dari masing-masing industri mengadopsi praktik bisnis bersih, hal itu akan secara signifikan mengubah lanskap bisnis keseluruhan. Korupsi dalam segala bentuk pun pada akhirnya akan menjadi praktik yang tidak dapat diterima.</span></span></p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><span style=\"color:rgb(37,37,37);font-family:Arial, Helvetica, sans-serif;\"><span>\"Dengan jaringan bisnis bersih yang luas, CAC berniat memanfaatkan pengetahuan yang dikumpulkan dari sektor swasta untuk membantu pemerintah mengidentifikasi titik problem dalam proses pelayanan publik yang rentan terhadap risiko korupsi. Kami pun akan membantu mereka mengembangkan solusi potensial untuk mengurangi risiko tersebut,\" paparnya.</span></span></p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><span style=\"color:rgb(37,37,37);font-family:Arial, Helvetica, sans-serif;\"><span>Menurut Andi, ada beberapa cara kerja CAC untuk memberantas korupsi di Indonesia. Pertama, bekerja dengan perusahaan Indonesia dan asosiasi bisnis, merujuk kerangka peraturan yang ada, CAC mengembangkan standar antikorupsi yang disesuaikan dengan kebutuhan sektor swasta Indonesia. Kedua, CAC mengundang perusahaan untuk bergabung dengan koalisi dan memungkinkan mereka untuk mengadopsi standar melalui sesi pelatihan dan dukungan teknis.</span></span><br><br><span style=\"color:rgb(37,37,37);font-family:Arial, Helvetica, sans-serif;\"><span>\"Dan, ketiga, launching CAC secara publik mengangkat perusahaan yang memperjuangkan praktik bisnis yang transparan. Dengan kelompok perusahaan yang berkembang, CAC membangun budaya integritas antar industri,\" ujar Andi.</span></span></p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><span style=\"color:rgb(37,37,37);font-family:Arial, Helvetica, sans-serif;\"><span>Sejak tahun 2018, IICD bekerja sama dengan CIPE untuk mendukung sektor privat dalam membentuk kegiatan kolektif melawan korupsi berdasarkan model yang sangat sukses dilaksanakan Thailand sejak tahun 2010.</span></span></p><p style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><a style=\'background-color:transparent;box-sizing:border-box;color:rgb(0, 123, 255);font-family:\"Century gothic\";text-decoration:none;\' href=\"https://ekbis.sindonews.com/read/107816/34/cegah-korupsi-di-perusahaan-iicd-dan-cipe-dorong-program-cac-1595297247\"><span style=\"color:rgb(37,37,37);font-family:Arial, Helvetica, sans-serif;\"><span>https://ekbis.sindonews.com/read/107816/34/cegah-korupsi-di-perusahaan-iicd-dan-cipe-dorong-program-cac-1595297247</span></span></a></p></body></html>\n', 'news', '2023-02-27 18:47:14', '2023-02-27 18:47:14', NULL),
(5, 'Penandatanganan Letter of Commitment antara Koalisi Anti Korupsi Indonesia (KAKI) – Indonesian Institute for Corporate Directorship (IICD) – dan Kamar Dagang dan Industri Indonesia (KADIN)', 'penandatanganan-letter-of-commitment-antara-koalisi-anti-korupsi-indonesia-kaki-indonesian-institute-for-corporate-directorship-iicd-dan-kamar-dagang-dan-industri-indonesia-kadin', 'medias/Q6M1Z1vjibwoavEI1ttvRypLPxaSE193XnYzIiAJ.jpg', 'Pertemuan dan penandatanganan Letter of Commitment antara Ketua KADIN, Chairman IICD, dan Ketua Advisory Committee KAKI....', '<html><body><p><strong style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:bolder;letter-spacing:normal;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Jakarta</strong><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span> - Hari ini, Rabu 28 April 2021 pukul 13:00 WIB telah dilaksanakan pertemuan dan penandatanganan Letter of Commitment antara Ketua KADIN, Bapak Rosan Roeslani, Chairman IICD, Bapak Sigit Pramono, Ketua Advisory Committee KAKI, Bapak Erry Riyana Hardjapamekas, serta dihadiri Direktur Eksekutif IICD, Ibu Vita Diani Satiadhi, Project Manager KAKI, Ibu Dina Budi, serta Wakil Pengurus Khusus Pengusaha Berintegritas KADIN sekaligus anggota Advisory Committee KAKI, Ibu Susi Rai Azizi. Pertemuan yang dilaksanakan di kantor KADIN ini membahas beberapa isu terkait dengan peran serta bisnis dalam memberantas dan mengurangi praktik-praktik korupsi yang ada di Indonesia. IICD merupakan organisasi nirlaba yang didirikan pada tahun 2000 oleh 10 universitas/sekolah bisnis terkemuka di Indonesia, dan memiliki visi melakukan internalisasi praktik-praktik tata kelola perusahaan yang baik berdasarkan standar internasional, dan pengembangan program anti korupsi ini adalah merupakan bagian dari kegiatan IICD dalam usaha mempromosikan pentingnya GCG di Indonesia. KAKI atau Collective Action Coalition against Corruption (CAC) Indonesia merupakan suatu sistim Anti Korupsi yang sederhana yang dapat diadopsi di Indonesia. KAKI merupakan platform bisnis untuk mempersatukan pihak2 yg berintegritas dalam menegakkan sistim Anti korupsi secara lebih mudah dan sederhana. Dalam hal ini tugas koalisi KAKI adalah menggalang pihak swasta untuk teguh menjalankan bisnis tanpa korupsi, dan menjaga konsistensi dan keberlanjutan agenda korupsi di Indonesia Sistim Anti Korupsi ini didasarkan atas keberhasilan CAC Thailand yang telah mengajak lebih dari 1000 perusahaan Thailand mengurangi korupsi di sektor swasta dalam satu dekade terakhir. Program ini juga didukung oleh Center for International and Private Enterprise (CIPE), organisasi nirlaba berbasis di Washington DC yang juga merupakan afiliasi dari US Chamber of Commerce. Program KAKI telah diluncurkan pada Agustus tahun lalu, diresmikan oleh Menteri Koordinator Bidang Perekonomian, Bapak Airlangga Hartarto. KAKI telah didukung penuh oleh beberapa asosiasi bisnis terkemuka di Indonesia. Asosiasi-Asosiasi Bisnis yang telah bergabung dan menjadi bagian dari Advisory Committee KAKI, antara lain: KADIN, KNKG, APINDO, AEI, Indonesian Business Links, IICG, serta HIMPI Kota Bandung. Sebagai organisasi pengusaha yang terbesar di Indonesia, KADIN memiliki peranan penting dalam upaya-upaya pencegahan korupsi di Indonesia melalui program Komunitas Pengusaha Berintegritas (KUPAS) dan terutama telah mendukung dan menjadi mitra terpercaya IICD, dimulai dari inisiasi program KAKI hingga akhirnya saat ini bersama-sama membesarkan program ini. Diharapkan dengan dukungan KADIN yang tidak pernah putus ini, koalisi perusahaan KAKI dapat semakin besar dan perusahaan-perusahaan di Indonesia semakin sadar akan pentingnya penerapan GCG dan anti-corruption compliance dalam sistem manajemen perusahaan. Dalam pertemuan ini telah dilaksanakan penandatanganan Letter of Commitment antara KADIN, IICD, dan KAKI. Letter of Commitment berisikan komitmen KADIN untuk menjadi bagian dari Advisory Committee KAKI serta dukungan KADIN dalam mensosialisasikan program KAKI kepada perusahaan-perusahaan di bawah naungan KADIN. Semoga dengan ditandatanganinya Letter of Commitment ini, semakin banyak perusahaan yang akan bergabung dalam jaringan KAKI sehingga terciptanya iklim bisnis yang bebas dari korupsi.</span></span></p></body></html>\n', 'news', '2023-02-27 18:48:23', '2023-02-27 18:48:23', NULL),
(6, 'Kadin-IICD-KAKI Sinergikan Pencegahan Korupsi di Kalangan Bisnis', 'kadin-iicd-kaki-sinergikan-pencegahan-korupsi-di-kalangan-bisnis', 'medias/UFq3nq5i25rgdvytONz5B1zP2dpkmdJAoNcJYRw7.jpg', 'EmitenNews - Koalisi Anti Korupsi Indonesia (KAKI), Indonesian Institute for Corporate Directorship (IICD), dan Kamar Dagang dan Industri (Kadin) Indonesia, Rabu (28/4/2021) mengadakan pertemuan dan menandatangani Letter of Commitment (LoC) sebagai upaya pencegahan korupsi di luar Komisi Pemberantasan Korupsi (KPK).....', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>EmitenNews - Koalisi Anti Korupsi Indonesia (KAKI), Indonesian Institute for Corporate Directorship (IICD), dan Kamar Dagang dan Industri (Kadin) Indonesia, Rabu (28/4/2021) mengadakan pertemuan dan menandatangani Letter of Commitment (LoC) sebagai upaya pencegahan korupsi di luar Komisi Pemberantasan Korupsi (KPK). LoC berisikan komitmen Kadin untuk menjadi bagian dari Advisory Committee KAKI serta dukungan Kadin dalam mensosialisasikan program KAKI kepada perusahaan-perusahaan di bawah naungan Kadin. Dokumen komitmen ditandatangani langsung oleh Ketua Kadin Indonesia Rosan Roeslani, Chairman IICD Sigit Pramono, dan Ketua Advisory Committee KAKI Erry Riyana Hardjapamekas di Kantor Kadin Jakarta. Dalam pertemuan dibahas beberapa isu terkait dengan peran serta bisnis dalam memberantas dan mengurangi praktik-praktik korupsi yang ada di Indonesia. Rosan mengatakan, Kadin menyambut baik kolaborasi ini untuk menjadikan iklim investasi dan usaha menjadi meningkat dan mengharapkan hal yang positif bisa ditindaklanjuti. \"Kami siap mensosialisasikan ke perusahaan dan asosiasi di bawah Kadin. Di Kadin ini ada 345 ribu perusahaan dan kita akan sosialisasikan rutin ke 34 provinsi,\" katanya. Rosan menilai penting untuk mengupdate regulasi terbaru dari KPK dan menyosialisasikannya kepada pengusaha-pengusaha di daerah hal-hal yang harus mereka ketahui terkait dengan pemberantasan korupsi. \"Sebab ternyata di daerah ada yang dianggap hal biasa, tidak dianggap melanggar peraturan. Setelah diberi pemahaman baru mereka mengetahui itu tidak benar,\" jelasnya. Selain itu Rosan menilai banyak peraturan di daerah yang harus diharmonisasi dengan peraturan di Pusat. Karena kadang terjadi overlapping yang bisa menimbulkan ketidakpastian usaha. Dan ketidakpastian itulah yang berpotensi menyebabkan korupsi berkembang.&nbsp;</span></span></p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span><strong>Author: F J&nbsp;</strong></span></span></p><p>&nbsp;</p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span><strong>Tautan Artikel Asli:</strong> </span></span><a href=\"https://www.emitennews.com/news/kadin-iicd-kaki-sinergikan-pencegahan-korupsi-di-kalangan-bisnis#\"><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>https://www.emitennews.com/news/kadin-iicd-kaki-sinergikan-pencegahan-korupsi-di-kalangan-bisnis#</span></span></a></p></body></html>\n', 'news', '2023-02-27 18:49:29', '2023-02-27 18:49:29', NULL),
(7, 'Kadin bersama IICD dan KAKI teken kerja sama koalisi anti korupsi', 'kadin-bersama-iicd-dan-kaki-teken-kerja-sama-koalisi-anti-korupsi', 'medias/cnGGSaLhHXcplgPxKpBeviaZnC5y9mEmKWaxzgsY.jpg', 'KONTAN.CO.ID - JAKARTA. Ketua Umum Kamar Dagang dan Industri (Kadin) Indonesia, Rosan P. Roeslani bersama Ketua Umum Indonesia Institute for Corporate Directorship (IICD) Sigit Pramono dan Ketua Koalisi Anti Korupsi Indonesia (KAKI) Erry Riyana Hardjapamekas menandatangani naskah kesepakatan untuk bekerjasama dan saling mendukung dalam program anti korupsi.', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>KONTAN.CO.ID - JAKARTA. Ketua Umum Kamar Dagang dan Industri (Kadin) Indonesia, Rosan P. Roeslani bersama Ketua Umum Indonesia Institute for Corporate Directorship (IICD) Sigit Pramono dan Ketua Koalisi Anti Korupsi Indonesia (KAKI) Erry Riyana Hardjapamekas menandatangani naskah kesepakatan untuk bekerjasama dan saling mendukung dalam program anti korupsi, di Menara Kadin Indonesia, pada Rabu (28/4). &acirc;&#128;&#156;Intinya kami mendukung program KAKI. Kami akan mengajak masing-masing anggota nebjadi bagian dari koalisi anti korupsi dan secara khusus memberikan masukan tentang strategi dan pengembangan koalisi anti korupsi Indonesia dengan memanfaatkan jejaring Kadin sebagai induk organisasi dunia usaha,&acirc;&#128;&#157; ujar Rosan. Menurut Rosan, Kadin memiliki peranan penting dalam upaya-upaya pencegahan korupsi di Indonesia melalui program Komunitas Pengusaha Berintegritas (KUPAS). Kadin telah mendukung dan menjadi mitra terpercaya IICD, dimulai dari inisiasi program KAKI hingga akhirnya saat ini bersama-sama membesarkan program ini. &acirc;&#128;&#156;Diharapkan dengan dukungan Kadin yang tidak pernah putus ini, koalisi perusahaan KAKI dapat semakin besar dan perusahaan-perusahaan di Indonesia semakin sadar akan pentingnya penerapan GCG dan anti-corruption compliance dalam sistem manajemen perusahaan,&acirc;&#128;&#157; ungkap Rosan. Seperti diketahui, &acirc;&#128;&#156;Global Corruption Barometer (GCG) Asia 2020&acirc;&#128;&#157; dari Tranparancy International menyampaikan bahwa Indonesia mendapat peringkat ketiga besar negara Asia dalam kasus korupsi, nepotisme dan pemerasan. Selanjutnya data KPK bulan Desember 2020 menggambarkan bahwa hampir 70% korupsi melibatkan pelaku usaha (swasta, BUMN dan BUMD), sehingga pengusaha termasuk profesi terbanyak yang tertangkap melakukan praktik korupsi. &acirc;&#128;&#156;Ini menjadi wake-up call bagi dunia usaha. Kita cukup prihatin, namun memang di lapangan pelaku usaha yang sering dihadapkan dalam posisi dilematis. Di satu sisi pengusaha diharapkan menjalankan bisnis yang bersih, transparan dan professional, tetapi di sisi lain pengusaha dihadapkan pada berbagai hambatan birokrasi dan mekanisme bisnis,&acirc;&#128;&#157; ucap dia.&nbsp;</span></span></p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Artikel Lengkap: https://amp.kontan.co.id/news/kadin-bersama-iicd-dan-kaki-teken-kerja-sama-koalisi-anti-korupsi&nbsp;</span></span></p><p>&nbsp;</p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Oleh: Vendy Yhulia Susanto&nbsp;</span></span></p><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Editor: Yudho Winarto</span></span></p></body></html>\n', 'news', '2023-02-27 18:51:06', '2023-02-27 18:51:06', NULL),
(8, 'Koalisi Anti Korupsi Indonesia Interview di Majalah Manajemen', 'koalisi-anti-korupsi-indonesia-interview-di-majalah-manajemen', 'medias/U1T9AoAQPr9MH4uHVA6GFAXDXrlU5pXRI4WzV24G.png', 'Ketua Advisory Committee KAKI melaksanakan interview memperkenalkan program KAKI sebagai wadah gerakan anti korupsi sektor swasta yang dimuat dalam majalah Manajemen. Artikel Lengkap dapat di lihat di: https://bit.ly/KAKIArticle', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Ketua Advisory Committee KAKI melaksanakan interview memperkenalkan program KAKI sebagai wadah gerakan anti korupsi sektor swasta yang dimuat dalam majalah Manajemen. Artikel Lengkap dapat di lihat di: https://bit.ly/KAKIArticle</span></span></p></body></html>\n', 'news', '2023-02-27 18:52:04', '2023-02-27 18:52:04', NULL),
(9, 'KAKI dorong kolaborasi nyata antara Institusi Publik dan Swasta untuk Meningkatkan Transparansi & Tata Kelola yang Baik selama Masa Pandemi', 'kaki-dorong-kolaborasi-nyata-antara-institusi-publik-dan-swasta-untuk-meningkatkan-transparansi-tata-kelola-yang-baik-selama-masa-pandemi', 'medias/R3vLwMWYjDNSsJZP7OCR0fy1EfvR40oRuIzC0qj2.jpg', 'KAKI bekerja sama dengan IIPG dan berpartner dengan media CNBC Indonesia menggelar acara webinar berjudul “Kolaborasi Institusi Publik-Swasta untuk Meningkatkan Transparansi & Tata Kelola yang Baik selama Masa Pandemi”', '<html><body><p class=\"p1\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Jakarta - Pada Hari Selasa, 30 November 2021 KAKI bekerja sama dengan IIPG berpartner dengan CNBC Indonesia menyelenggarakan acara webinar yang berjudul &acirc;&#128;&#156;Kolaborasi Institusi Publik-Swasta untuk Meningkatkan Transparansi &amp; Tata Kelola yang Baik selama Masa Pandemi.&acirc;&#128;&#157;</p><p class=\"p1\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Acara ini dibuka oleh Ketua Umum IICD dan IIPG, Bapak Sigit Pramono dan Ketua Dewan Penasihat KAKI, Bapak Erry Riyana Hardjapamekas. Webinar ini dihadiri oleh Bapak Tumpak Haposan Simanjuntak, Irjen Kemendagri RI sebagai perwakilan Menteri dalam Negeri, Bapak Tito Karnavian yang memberikan <em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>keynote speech </i></em>mengenai inovasi digital dan informasi pemerintahan daerah demi mendukung transparansi pada masa pandemi.</p><p class=\"p1\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Pembicara dalam acara webinar kali ini merupakan tokoh-tokoh yang ahli dibidangnya masing-masik baik dari bidang akademisi, swasta, maupun publik. Bapak Rudiantara, Menteri Kominfo RI 2014-2019 memaparkan menganai inovasi teknologi untuk dapat meningkatkan tata kelola pemerintahan yang lebih baik. Ibu Endang Hoyaranda, Komisaris PT Prodia Widyahusada memaparkan mengenai isu permasalahan alat kesehatan selama pandemi. Bapak Pahala Nainggolan, Deputi Pencegahan KPK RI menerangkan mengenai peran Komite Advokasi Daerah dalam memanfaatkan inovasi digital untuk mencegah korupsi. Bapak Andi Ilham Said, Ketua Task Force KAKI mempresentasikan 75 checklist KAKI yang sangat relevan dengan upaya peningkatan transparansi, komunikasi, dan pelayanan publik. Acara ini dimoderatori oleh Ibu Natalia Soebagjo, Anggota Dewan Transparansi Internasional dan dipandu oleh MC David Manalu.</p><p class=\"p1\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Webinar ini membahas mengenai pentingnya meningkatkan sistem tata kelola pemerintahan yang baik dan transparansi dalam masa pandemi. Diharapkan melalui webinar ini, kolaborasi nyata semakin meningkat diantara sektor publik dan privat dalam pencegahan tindak pidana korupsi.</p><p class=\"p1\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Acara ini juga didukung oleh IICD, CIPE, KADIN, AEI, KNKG, Indonesia Business Links, IICG, UN Global Compact Indonesia, APINDO, HIPMI Kota Bandung, serta GRCI.&nbsp;</p><p class=\"p2\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>&nbsp;</p><p class=\"p1\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Sekretariat KAKI</p></body></html>\n', 'news', '2023-02-27 18:53:10', '2023-02-27 18:53:10', NULL),
(10, 'KAKI Newsletter Volume 1 May 2022', 'kaki-newsletter-volume-1-may-2022', 'medias/NzoMTDXXHYhg6cIL2J6NSbOdTRSd25JoWERdb1D2.jpg', 'Ringkasan Kegiatan KAKI yang dimasukkan dalam kolom Kabar KAKI, antara lain: KAKI Launching, KAKI dorong Kolaborasi Publik-Swasta, Mengatasi Resiko Suap selama Pandemi, KAKI dalam IBEC 2021, Asosiasi-asosiasi bisnis bergabung bersama KAKI.', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Ringkasan Kegiatan KAKI yang dimasukkan dalam kolom Kabar KAKI, antara lain: KAKI Launching, KAKI dorong Kolaborasi Publik-Swasta, Mengatasi Resiko Suap selama Pandemi, KAKI dalam IBEC 2021, Asosiasi-asosiasi bisnis bergabung bersama KAKI.</span></span></p></body></html>\n', 'news', '2023-02-27 18:53:50', '2023-02-27 18:53:50', NULL),
(11, 'KAKI ditunjuk sebagai Advisory Committee Indonesia Anti Corruption Collective Action', 'kaki-ditunjuk-sebagai-advisory-committee-indonesia-anti-corruption-collective-action', 'medias/beffvSNTo2wlhJ4JQ8oGv8VM5XoqB31OkBKDr3RZ.png', 'Indonesia Global Compact Network (IGCN) meminta KAKI untuk menjadi salah satu dewan penasehat program Indonesia Anti Corruption Collective Action (ACCA).', '<html><body><p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Indonesia Global Compact Network (IGCN) meminta KAKI untuk menjadi salah satu dewan penasehat yang merepresentasi dunia bisnis dalam program mereka Indonesia Anti Corruption Collective Action (ACCA). Ketua Advisory Committee KAKI, Bapak Erry Riyana Hardjapamekas juga turut aktif berpartisipasi sebagai narasumber dalam kick off meeting ACCA yang bertajuk \"</span></span><em style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'><i>the role of leadership in fostering the implementation of anti-corruption coalition through collaborative actions\"</i></em><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>.</span></span></p></body></html>\n', 'news', '2023-02-27 18:54:54', '2023-02-27 18:54:54', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_01_31_175434_create_permission_tables', 1),
(11, '2022_02_02_164831_create_jobs_table', 1),
(12, '2022_02_14_040619_create_pending_new_emails_table', 1),
(13, '2022_02_24_155624_create_blogs_table', 1),
(14, '2023_02_09_015045_create_pages_table', 1),
(15, '2023_02_09_015446_create_sliders_table', 1),
(16, '2023_02_09_015539_create_events_table', 1),
(17, '2023_02_09_020034_create_media_table', 1),
(18, '2023_02_09_020243_create_resources_table', 1),
(19, '2023_02_09_020333_create_partners_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'CROWN Personal Access Client', 'CwayyzV9TmFxB4sPxFDjeQyYq01ZIgCducyzHlTF', NULL, 'http://localhost', 1, 0, 0, '2023-02-23 07:22:14', '2023-02-23 07:22:14'),
(2, NULL, 'CROWN Password Grant Client', 'MquX4obASyOy5qBAVyrQqaS3IVE1Y2EZx8aJRSx5', 'users', 'http://localhost', 0, 1, 0, '2023-02-23 07:22:15', '2023-02-23 07:22:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-02-23 07:22:15', '2023-02-23 07:22:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id`, `created_at`, `updated_at`, `title`, `slug`, `content`, `deleted_at`) VALUES
(1, '2023-02-23 07:49:53', '2023-02-23 08:08:07', 'about', 'about', '<section class=\"about-four\"><div class=\"container\"><div class=\"row\"><div class=\"col-xl-4\"><div class=\"about-four__left\"><div class=\"about-four__img-box wow slideInLeft animated\" style=\"animation-delay:100ms;animation-duration:2500ms;animation-name:slideInLeft;visibility:visible;\"><div class=\"raw-html-embed\">\r\n                                                                                                                                            <iframe width=\"auto\" height=\"315\" src=\"https://www.youtube.com/embed/2EjXtqHIt1E\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen=\"\"></iframe>\r\n                                                                                                                                        \r\n                                                                                                            \r\n                                                                                \r\n                                                    \r\n                        </div><div class=\"about-four__img\"><img src=\"assets/images/resources/about-four-img-1.jpg\" alt=\"\"></div></div></div></div><div class=\"col-xl-8\"><div class=\"about-four__right\"><div class=\"section-title text-left\"><div class=\"section-sub-title-box\"><p class=\"section-sub-title\">CAC Indonesia - Koalisi Anti Korupsi Indonesia</p></div><h2 class=\"section-title__title\">About CAC-INDONESIA | KAKI INDONESIA</h2></div><figure class=\"table\" style=\"width:100%;\"><table style=\"background-color:rgb(255, 255, 255);\"><tbody style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><tr style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:542.326px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>BACKGROUND OF KAKI INDONESIA</strong></i></em></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:13.2639px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;text-align:left;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>&nbsp;</strong></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:524.41px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>LATAR BELAKANG KAKI INDONESIA</strong></p></td></tr><tr style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:542.326px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><span class=\"text-small\"><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>Since 2018, IICD has been working with CIPE to support the private sector in forming collective activities against corruption based on a very successful model implemented by Thailand since 2010 under the name of CAC (Collective Action Initiative Against Corruption), which serves as a reference for implementing anti-corruption actions&nbsp; in Indonesia with the name of Koalisi Anti Korupsi Indonesia (KAKI).&nbsp; The KAKI program in Indonesia began to be prepared in October 2018. At that time IICD internally formed a CAC Task Force.</i></em></span></p><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><span class=\"text-small\"><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>IICD and CIPE recognized that the role of Indonesian private sector is very important in dealing with corruption effectively while creating solutions that support development priorities in Indonesia.&nbsp; With technical support from CIPE, the KAKI in Indonesia has been formed, from, by, and for the Indonesian private sector.&nbsp; IICD will play the role of locomotive, with support from several business associations such as&nbsp;</i></em><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>the Indonesian Chamber of Commerce (KADIN Indonesia), the Indonesian Issuers Association (AEI), Indonesia Business Links (IBL), the Indonesian Employers\' Association (APINDO), Indonesian Institute for Corporate Governance (IICG), Indonesia Global Compact Network (IGCN), National Committee on Governance (KNKG), Governance, Risk Management, and Compliance (GRC), and&nbsp; Indonesian Young Entrepreneurs Associations (HIPMI) Bandung City.</strong></span></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:13.2639px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;text-align:left;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>&nbsp;</strong></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:524.41px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><span class=\"text-small\">Sejak tahun 2018, IICD bekerjasama dengan CIPE untuk mendukung sektor privat dalam membentuk kegiatan kolektif melawan korupsi berdasarkan model yang sangat sukses dilaksanakan Thailand sejak tahun 2010 dengan nama CAC (Collective Action Initiative Against Corruption), yang kemudian dijadikan sebagai acuan untuk penerapan aksi anti-korupsi di Indonesia dengan nama Koalisi Anti Korupsi Indonesia (KAKI). Program KAKI di Indonesia mulai dipersiapkan sejak bulan Oktober tahun 2018. Saat itu secara internal IICD membentuk Task Force.</span></p><p><span class=\"text-small\">IICD dan CIPE menyadari bahwa peranan sektor swasta sangat penting dalam menangani korupsi secara efektif sekaligus menciptakan solusi yang mendukung prioritas pembangunan di Indonesia. Dengan dukungan teknis dari CIPE, KAKI di Indonesia telah dibentuk, dari, oleh, dan untuk sektor swasta Indonesia. IICD akan berperan sebagai Lokomotif, dengan dukungan dari beberapa asosiasi bisnis seperti <em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>Kamar Dagang Indonesia (Kadin), Asosiasi Emiten Indonesia (AEI), Indonesia Business Links (IBL), Asosiasi Pengusaha Indonesia (APINDO), Indonesian Institute for Corporate Governance (IICG), Indonesia Global Compact Network (IGCN), Komite Nasional Kebijakan Governansi (KNKG), Governance, Risk Management, and Compliance (GRC),dan Himpunan Pengusaha Muda Indonesia (HIPMI) Kota Bandung.</strong></i></em></span></p></td></tr><tr style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:542.326px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>&nbsp;</strong></i></em></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:13.2639px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;text-align:left;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>&nbsp;</strong></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:524.41px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>&nbsp;</strong></p></td></tr><tr style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:542.326px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>WHAT IS KAKI ?</strong></i></em></p><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>A platform for Indonesia&acirc;&#128;&#153;s private sector to collectively create, adopt, and spread effective anti-corruption and compliance policies, taking the initiative to curb corruption and promote a clean business ecosystem.</i></em></p><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'>&nbsp;</p><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>Objectives</strong></i></em></p><ul><li style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>Uplift the compliance standards of private-sector companies</i></em></li><li style=\'box-sizing:border-box;font-family:\"Century gothic\";\'>&nbsp;</li><li style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>Develop a critical mass of companies dedicated to clean and transparent business practices</i></em></li><li style=\'box-sizing:border-box;font-family:\"Century gothic\";\'>&nbsp;</li><li style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>With government, co-create change in public services to enhance efficiency, transparency, and accountability</i></em></li></ul><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>&nbsp;</strong></i></em></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:13.2639px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;text-align:left;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>&nbsp;</strong></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:524.41px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'>&nbsp;</p><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>APAKAH KAKI ?</strong></p><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'>Suatu platform bagi sektor swasta Indonesia untuk secara kolektif menciptakan, mengadopsi, dan menyebarkan anti-korupsi yang efektif dan kebijakan kepatuhan, mengambil inisiatif untuk mengurangi korupsi dan mempromosikan ekosistem bisnis yang bersih.</p><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'>&nbsp;<strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>Tujuan</strong></p><p style=\'box-sizing:border-box;font-family:\"Century gothic\";\'>Mengangkat standar kepatuhan perusahaan sektor swasta</p><ul><li style=\'box-sizing:border-box;font-family:\"Century gothic\";\'>Mengembangkan banyak perusahaan yang didedikasikan untuk praktik bisnis yang bersih dan transparan</li><li style=\'box-sizing:border-box;font-family:\"Century gothic\";\'>&nbsp;</li><li style=\'box-sizing:border-box;font-family:\"Century gothic\";\'>Dengan pemerintah, ikut menciptakan perubahan dalam layanan publik untuk meningkatkan efisiensi, transparansi, dan akuntabilitas</li></ul><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>&nbsp;</strong></p></td></tr></tbody></table></figure></div></div></div></div></section>\n', NULL),
(2, '2023-02-23 08:14:45', '2023-02-23 08:14:45', 'member', 'member', '<html><body><div class=\"container pt-3 mb-5 mt-5\"><h2 class=\"display-3 mt-5 pt-5 text-center\">Member KAKI Indonesia</h2><div class=\"container\"><div class=\"row\"><div class=\"col-sm-12\"><p>&nbsp;</p><figure class=\"table\" style=\"width:100%;\"><table style=\"border-collapse:collapse;\"><tbody><tr><td style=\"width:47.3128%;\"><p><em><i><strong>How to Join the KAKI Coalition ?</strong></i></em><br>&nbsp;</p><ul><li><em><i>Companies commit to be clean and free of corruption and support anti-corruption by signing a declaration of commitment,</i></em></li><li><em><i>A committee will be formed to approve the concerned companies,</i></em></li><li><em><i>The certification is valid for 3 years and be re-acessed with an easier proces</i></em></li></ul></td><td style=\"width:3.9764%;\">&nbsp;</td><td style=\"width:48.7108%;\"><p><strong>Bagaimana Bergabung dengan Koalisi KAKI ?</strong><br>&nbsp;</p><ul><li>Perusahaan berkomitmen untuk bebas dari korupsi dan mendukung anti korupsi dengan menandatangani deklarasi komitmen,</li><li>Dibentuk komite yg akan memeriksa perusahaan terkait,</li><li>Sertifikasi berlaku 3 tahun dan dapat diperbarui dengan proses yg lebih mudah</li></ul></td></tr><tr><td style=\"width:47.3128%;\"><strong>&nbsp;</strong></td><td style=\"width:3.9764%;\">&nbsp;</td><td style=\"width:48.7108%;\"><strong>&nbsp;</strong></td></tr><tr><td style=\"width:47.3128%;\"><strong>Certification Process:</strong></td><td style=\"width:3.9764%;\">&nbsp;</td><td style=\"width:48.7108%;\"><strong>Proses Sertifikasi:</strong></td></tr><tr><td style=\"width:47.3128%;\"><ul><li>The company declares its commitment to be free from corruption</li><li>Sign the declaration</li><li>Implement 75 checklist at the company</li><li>Following the certification process</li><li>Certified</li></ul></td><td style=\"width:3.9764%;\">&nbsp;</td><td style=\"width:48.7108%;\"><ul><li>Perusahaan menyatakan komitmennya untuk bebas dari korupsi</li><li>Menandatangani deklarasi</li><li>Menerapkan 75 checklist di perusahaan</li><li>Melalui proses sertifikasi</li><li>Tersertifikasi</li></ul></td></tr></tbody></table></figure></div></div></div></div></body></html>\n', NULL),
(3, '2023-02-23 09:06:55', '2023-02-25 11:04:03', 'contact', 'contact', '<section class=\"contact-page\"><div class=\"container\"><div class=\"row\"><div class=\"col-xl-12 col-lg-12\"><div class=\"contact-page__left\"><div class=\"section-title text-center\"><div class=\"section-sub-title-box\"><p class=\"section-sub-title\">Kontak Kami</p><div class=\"section-title-shape-1\"><img src=\"assets/images/shapes/section-title-shape-1.png\" alt=\"\"></div><div class=\"section-title-shape-2\"><img src=\"assets/images/shapes/section-title-shape-2.png\" alt=\"\"></div></div><h2 class=\"section-title__title text-center\">Jangan ragu untuk menghubungi KAKI</h2></div><div class=\"contact-page__call-email\"><div class=\"contact-page__call-email-content text-center\"><h4><a href=\"mailto:KAKI.secretariat@gmail.com\">KAKI.secretariat@gmail.com</a> Atau <a href=\"mailto:dina@iicd.or.id\">dina@iicd.or.id</a></h4></div></div><h3 class=\" pt-4 mt-5 text-center\"><span class=\"text-tiny\" style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Gedung Prof. M. Sadli (Gedung Magister Akuntansi)</span></span>&nbsp;<br><span class=\"text-tiny\" style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\"><span>Lt. 1 Jl. Salemba No.4, RT.4/RW.6, Kenari, Kec. Senen, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10430.</span></span></h3></div></div></div></div><section class=\"cta-one cta-three\"><div class=\"container\"><div class=\"cta-one__content\"><div class=\"cta-one__inner\"><div class=\"cta-one__left\"><h3 class=\"cta-one__title\">Kontak Kami</h3></div><div class=\"cta-one__right\"><div class=\"cta-one__call\"><div class=\"cta-one__call-icon\">&nbsp;</div><div class=\"cta-one__call-number\"><p><a href=\"mailto:KAKI.secretariat@gmail.com\">KAKI.secretariat@gmail.com</a></p><p>Hubungi Staf Kami</p></div></div><div class=\"cta-one__btn-box\"><a class=\"thm-btn cta-one__btn\" href=\"/\">Halaman Utama</a></div></div><div class=\"cta-one__img\"><img src=\"assets/images/resources/cta-one-img.png\" alt=\"\"></div></div></div></div></section><section class=\"google-map-two\"><div class=\"raw-html-embed\">\r\n            <iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15865.978068016235!2d106.8510948!3d-6.1982994!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xcd60a5debd8f84de!2sIndonesian%20Institute%20for%20Corporate%20Director!5e0!3m2!1sen!2sid!4v1597026486846!5m2!1sen!2sid\" class=\"google-map__two\" allowfullscreen=\"\"></iframe>\r\n        </div></section></section>\n', NULL),
(4, '2023-02-25 10:53:53', '2023-02-25 10:53:53', 'why KAKI ?', 'why', '<html><body><h2 class=\"display-3 mt-5 pt-5 text-center\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:4.5rem;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;line-height:1.2;margin-bottom:0.5rem;margin-top:3rem !important;orphans:2;padding-top:3rem !important;text-align:center !important;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\'>Why KAKI</h2><div class=\"container\" style=\'-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:\"Century gothic\";font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-left:auto;margin-right:auto;max-width:1140px;orphans:2;padding-left:15px;padding-right:15px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;width:1110px;word-spacing:0px;\'><div class=\"row\" style=\'box-sizing:border-box;display:flex;flex-wrap:wrap;font-family:\"Century gothic\";margin-left:-15px;margin-right:-15px;\'><div class=\"col-sm-12\" style=\'-webkit-box-flex:0;box-sizing:border-box;flex:0 0 100%;font-family:\"Century gothic\";max-width:100%;min-height:1px;padding-left:15px;padding-right:15px;position:relative;width:1110px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'>&nbsp;</p><figure class=\"table\" style=\"width:1080px;\"><table class=\"table table-responsive\" style=\'border-collapse:collapse;box-sizing:border-box;font-family:\"Century gothic\";\'><tbody style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><tr style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:488.854px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>WHY KAKI?</strong></i></em></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:10.0521px;\'>&nbsp;</td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:581.094px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><strong style=\'box-sizing:border-box;font-family:\"Century gothic\";font-weight:bolder;\'>KENAPA HARUS KAKI?</strong></p></td></tr><tr style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:488.854px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>KAKI provides a platform for the business sector to be part of the solution to the problem of corruption.&nbsp; Involving more business entities and helping them set up anti-corruption policies and mechanisms will directly reduce the risk of bribery as a whole.&nbsp; Given the continuing anti-corruption momentum and increasing participation of private companies of all types and sizes, KAKI hopes to reach critical mass and create peer pressure for the remaining players to also raise their compliance standards to meet the standards of KAKI members.</i></em></p><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'><em style=\'box-sizing:border-box;font-family:\"Century gothic\";\'><i>When a majority of the major players from each industry adopt clean business practices, it will significantly change the overall business landscape and corruption in all forms will eventually become unacceptable practice.&nbsp; With an extensive net business network, KAKI also intends to utilize the knowledge gathered from the private sector to help governments identify problem spots in the public service process that are vulnerable to corruption risks and help them develop potential solutions to reduce those risks.</i></em></p></td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:10.0521px;\'>&nbsp;</td><td style=\'box-sizing:border-box;font-family:\"Century gothic\";width:581.094px;\'><p style=\'box-sizing:border-box;font-family:\"Century gothic\";margin-bottom:1rem;margin-top:0px;\'>KAKI menyediakan platform bagi sektor bisnis untuk menjadi bagian dari solusi untuk masalah korupsi.&nbsp; Melibatkan lebih banyak entitas bisnis dan membantu mereka memasang kebijakan dan mekanisme anti-korupsi akan secara langsung mengurangi risiko penyuapan secara keseluruhan.&nbsp; Mengingat momentum anti-korupsi yang terus bergulir dan partisipasi perusahaan swasta yang semakin meningkat dari semua jenis dan ukuran, KAKI berharap untuk mencapai massa kritis dan menciptakan tekanan dari sesama perusahaan di sektor swasta yang belum mengimplementasikannya &nbsp;dengan tujuan meningkatkan standar kepatuhan mereka untuk memenuhi standar anggota KAKI.&nbsp;</p><p>Ketika mayoritas pemain utama dari masing-masing industri mengadopsi praktik bisnis bersih, hal itu akan secara signifikan mengubah lanskap bisnis keseluruhan dan korupsi dalam segala bentuk pada akhirnya akan menjadi praktik yang tidak dapat diterima.&nbsp; Dengan jaringan bisnis bersih yang luas, KAKI juga berniat untuk memanfaatkan pengetahuan yang dikumpulkan dari sektor swasta untuk membantu pemerintah mengidentifikasi titik problema dalam proses pelayanan publik yang rentan terhadap risiko korupsi dan membantu mereka mengembangkan solusi potensial untuk mengurangi risiko tersebut.</p></td></tr></tbody></table></figure></div></div></div></body></html>\n', NULL),
(5, '2023-02-25 10:58:22', '2023-02-25 10:58:22', 'How KAKI\'s Works ?', 'how-kaki-works', '<html><body><p>&nbsp;</p><figure class=\"table\" style=\"width:100%;\"><table style=\"border-collapse:collapse;\"><tbody><tr><td style=\"width:46.6604%;\"><em><i><strong>How Does the KAKI Work?</strong></i></em></td><td style=\"width:1.30475%;\">&nbsp;</td><td style=\"width:52.0347%;\"><strong>Bagaimana Cara Kerja KAKI?</strong></td></tr><tr><td style=\"width:46.6604%;\"><p><em><i>Working with Indonesian companies and business associations, referencing existing regulatory frameworks, KAKI develops an anti-corruption standard tailored to the needs of the Indonesian private sector.</i></em></p><ul><li><em><i>The Indonesian Institute for Corporate Directorship (IICD), an experienced corporate governance group, hosts KAKI&acirc;&#128;&#153;s secretariat platform to assist members.</i></em></li><li>&nbsp;</li><li><em><i>KAKI invites companies to join the coalition and enables them to adopt the standard through training sessions and technical support.</i></em></li><li><em><i>KAKI events publicly celebrate companies that champion clean and transparent business practices. With a growing group of companies, KAKI builds up a culture of integrity, across industries and along supply chains.</i></em></li></ul></td><td style=\"width:1.30475%;\">&nbsp;</td><td style=\"width:52.0347%;\"><ul style=\"list-style-type:disc;\"><li>Bekerja dengan perusahaan Indonesia dan asosiasi bisnis, merujuk kerangka peraturan yang ada, KAKI mengembangkan standar anti-korupsi yang disesuaikan dengan kebutuhan sektor swasta Indonesia.</li><li>&nbsp;</li><li>Indonesian Institute for Corporate Directorship (IICD), institusi tata kelola perusahaan (Good Corporate Governance) yang berpengalaman, menjadi sekretariat KAKI untuk membantu anggota koalisi.</li><li>&nbsp;</li><li>KAKI mengundang perusahaan untuk bergabung dengan koalisi dan memungkinkan mereka untuk mengadopsi standar melalui sesi pelatihan dan dukungan teknis.</li><li>Launching KAKI secara publik mengangkat perusahaan yang memperjuangkan praktik bisnis yang transparan. Dengan kelompok perusahaan yang berkembang, KAKI membangun budaya integritas antar industri.</li></ul></td></tr></tbody></table></figure></body></html>\n', NULL),
(6, '2023-02-25 10:59:29', '2023-02-25 10:59:29', 'benefit KAKI', 'benefit-kaki', '<html><body><p>&nbsp;</p><figure class=\"table\" style=\"width:100%;\"><table style=\"border-collapse:collapse;\"><tbody><tr><td style=\"width:46.3809%;\"><em><i><strong>KAKI benefits:</strong></i></em></td><td style=\"width:3.78993%;\">&nbsp;</td><td style=\"width:49.8291%;\"><strong>Benefit KAKI:</strong></td></tr><tr><td style=\"width:46.3809%;\"><ol><li><em><i>More effective and easier. Can be used as a reference for companies that need an efficient and effective anti-bribery system.</i></em></li><li><em><i>CIPE is recognized as part of the American Chamber of Commerce.</i></em></li><li><em><i>The indicators are clear and straightforward (75 Checklist). Simple and efficient than other system alternatives.</i></em></li><li><em><i>Is a combination of regulations ISO 37001, FCPA (Anti-corruption America), UK Bribery Act.</i></em></li><li><em><i>Can be a place for entrepreneurs to exchange information every time there are new government regulations regarding anti-corruption that affect the private sector</i></em></li></ol><p style=\"padding-left:40px;\"><em><i>By following the KAKI and using 75 Checklists, companies can confidently do business with listed companies in the US or UK, because the CAC standard is the standard of these two countries.</i></em></p></td><td style=\"width:3.78993%;\">&nbsp;</td><td style=\"width:49.8291%;\"><ol><li>Lebih sederhana. Dapat dijadikan sebagai acuan untuk perusahaan yang membutuhkan sistem anti suap efisien dan efektif.</li><li>Diakui CIPE yang merupakan bagian dari American Chamber of Commerce.</li><li>Indikatornya jelas dan lugas (75 Checklist). Simple dan efisien dari alternatif sistem lainnya.</li><li>Merupakan gabungan dari peraturan2 ISO 37001, FCPA (Anti korupsi Amerika), UK Bribery Act.</li><li>Bisa menjadi wadah bagi para pengusaha untuk bertukar info setiap kali ada peraturan oemerintah terbaru mengenai anti korupsi yang berdampak terhadap private sector</li></ol><p style=\"padding-left:40px;\">Dengan mengikuti KAKI dan menggunakan 75 Checklist perusahaan bisa dengan percaya diri berbisnis dengan perusahaan2 listed di Amerika atau Inggris, karena standar CAC merupakan standar dua negara ini.</p></td></tr></tbody></table></figure><p style=\"padding-left:40px;\">&nbsp;</p></body></html>\n', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `partners`
--

INSERT INTO `partners` (`id`, `title`, `thumbnail`, `position`, `created_at`, `updated_at`) VALUES
(2, 'Partner 1', 'partners/nhq7RpjRP5DexcBnUpQYevV42SqulnmQu1AvqvNt.png', 1, '2023-02-23 06:57:15', '2023-02-23 06:57:15'),
(3, 'Partner 2', 'partners/2ubvMgmGdxg332hBbX6Cvlswe0UA2kfFTBYfaOwU.jpg', 2, '2023-02-23 06:57:35', '2023-02-23 06:57:35'),
(4, 'Partner 3', 'partners/HeQnB7T8KFg6p6tKuXiE7oXSjiy1JGV9wKkvsmYC.jpg', 3, '2023-02-23 06:58:02', '2023-02-23 06:58:02'),
(5, 'Partner 4', 'partners/jJxOATOOwy7pQg9Of3lNAQdxBLwbmipuuNfTqacE.jpg', 4, '2023-02-23 06:58:27', '2023-02-23 06:58:27'),
(6, 'Partner 5', 'partners/WTHUSjouWCmzsZYRutX9WidZ7tqm2BPFCvZNHgdW.png', 5, '2023-02-23 06:58:51', '2023-02-23 06:58:51'),
(7, 'Partner 6', 'partners/fJL525SVI08pvyy8oHRZJYK9LHT7rgsxCL45Zq1U.jpg', 6, '2023-02-23 06:59:15', '2023-02-23 06:59:15'),
(8, 'Partner 7', 'partners/hfWrhWdfFFGBZGmmlZiSO5pD5LOjwEiZh5MAvLpQ.jpg', 7, '2023-02-23 06:59:55', '2023-02-23 06:59:55'),
(9, 'Partner 8', 'partners/acgEjhDPGS6zLqAw8YubYgQMJCHit6rJDnHtQxQY.jpg', 8, '2023-02-23 07:00:17', '2023-02-23 07:00:17'),
(10, 'Partner 9', 'partners/tHrRzH1pnEfETDfeeKTDOapODugUVav00cF0MD53.jpg', 9, '2023-02-23 07:00:37', '2023-02-23 07:00:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pending_new_emails`
--

CREATE TABLE `pending_new_emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `new_email` varchar(255) NOT NULL,
  `token` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin access', 'web', '2023-02-12 08:55:10', '2023-02-12 08:55:10'),
(2, 'systems control', 'web', '2023-02-12 08:55:11', '2023-02-12 08:55:11'),
(3, 'contents control', 'web', '2023-02-12 08:55:11', '2023-02-12 08:55:11'),
(4, 'permissions create', 'web', '2023-02-12 08:55:11', '2023-02-12 08:55:11'),
(5, 'permissions read', 'web', '2023-02-12 08:55:11', '2023-02-12 08:55:11'),
(6, 'permissions update', 'web', '2023-02-12 08:55:11', '2023-02-12 08:55:11'),
(7, 'permissions delete', 'web', '2023-02-12 08:55:11', '2023-02-12 08:55:11'),
(8, 'roles create', 'web', '2023-02-12 08:55:12', '2023-02-12 08:55:12'),
(9, 'roles read', 'web', '2023-02-12 08:55:12', '2023-02-12 08:55:12'),
(10, 'roles update', 'web', '2023-02-12 08:55:12', '2023-02-12 08:55:12'),
(11, 'roles delete', 'web', '2023-02-12 08:55:12', '2023-02-12 08:55:12'),
(12, 'users create', 'web', '2023-02-12 08:55:12', '2023-02-12 08:55:12'),
(13, 'users read', 'web', '2023-02-12 08:55:12', '2023-02-12 08:55:12'),
(14, 'users update', 'web', '2023-02-12 08:55:13', '2023-02-12 08:55:13'),
(15, 'users store', 'web', '2023-02-12 08:55:13', '2023-02-12 08:55:13'),
(16, 'blogs create', 'web', '2023-02-12 08:55:13', '2023-02-12 08:55:13'),
(17, 'blogs read', 'web', '2023-02-12 08:55:13', '2023-02-12 08:55:13'),
(18, 'blogs update', 'web', '2023-02-12 08:55:13', '2023-02-12 08:55:13'),
(19, 'blogs delete', 'web', '2023-02-12 08:55:14', '2023-02-12 08:55:14'),
(20, 'certificates create', 'web', '2023-02-12 08:55:14', '2023-02-12 08:55:14'),
(21, 'certificates read', 'web', '2023-02-12 08:55:14', '2023-02-12 08:55:14'),
(22, 'certificates update', 'web', '2023-02-12 08:55:14', '2023-02-12 08:55:14'),
(23, 'certificates delete', 'web', '2023-02-12 08:55:14', '2023-02-12 08:55:14'),
(24, 'standards create', 'web', '2023-02-12 08:55:14', '2023-02-12 08:55:14'),
(25, 'standards read', 'web', '2023-02-12 08:55:14', '2023-02-12 08:55:14'),
(26, 'standards update', 'web', '2023-02-12 08:55:15', '2023-02-12 08:55:15'),
(27, 'standards delete', 'web', '2023-02-12 08:55:15', '2023-02-12 08:55:15'),
(28, 'services create', 'web', '2023-02-12 08:55:15', '2023-02-12 08:55:15'),
(29, 'services read', 'web', '2023-02-12 08:55:15', '2023-02-12 08:55:15'),
(30, 'services update', 'web', '2023-02-12 08:55:15', '2023-02-12 08:55:15'),
(31, 'services delete', 'web', '2023-02-12 08:55:15', '2023-02-12 08:55:15'),
(32, 'clients create', 'web', '2023-02-12 08:55:15', '2023-02-12 08:55:15'),
(33, 'clients read', 'web', '2023-02-12 08:55:15', '2023-02-12 08:55:15'),
(34, 'clients update', 'web', '2023-02-12 08:55:15', '2023-02-12 08:55:15'),
(35, 'clients delete', 'web', '2023-02-12 08:55:16', '2023-02-12 08:55:16'),
(36, 'feedback create', 'web', '2023-02-12 08:55:16', '2023-02-12 08:55:16'),
(37, 'feedback read', 'web', '2023-02-12 08:55:16', '2023-02-12 08:55:16'),
(38, 'feedback update', 'web', '2023-02-12 08:55:16', '2023-02-12 08:55:16'),
(39, 'feedback delete', 'web', '2023-02-12 08:55:16', '2023-02-12 08:55:16'),
(40, 'about read', 'web', '2023-02-12 08:55:16', '2023-02-12 08:55:16'),
(41, 'about update', 'web', '2023-02-12 08:55:16', '2023-02-12 08:55:16'),
(42, 'application form access', 'web', '2023-02-12 08:55:16', '2023-02-12 08:55:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resources`
--

CREATE TABLE `resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'web', '2023-02-12 08:55:17', '2023-02-12 08:55:17'),
(2, 'admin', 'web', '2023-02-12 08:55:17', '2023-02-12 08:55:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `thumbnail`, `position`, `created_at`, `updated_at`) VALUES
(2, 'Slider 1', 'sliders/fpVqF58GjUI6tohN6tdAZvmKJCff03z8lzDrshAz.jpg', '1', '2023-02-25 10:46:07', '2023-02-25 10:46:07'),
(3, 'slider 2', 'sliders/FxudZJokySBNN7XHqg24zXLANwO2J5SPU8wQowTl.png', '2', '2023-02-25 10:47:15', '2023-02-25 10:47:15'),
(4, 'slider 3', 'sliders/3Sy6uVjqEjH16oAs9phT0cItvRDZ2rHW06j3RmPt.jpg', '3', '2023-02-25 10:49:28', '2023-02-25 10:49:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', NULL, 'super.admin@admin.com', '2023-02-12 08:55:23', '$2y$10$CHluB86P7Bzzvh6w3NgTqeaqQ8.5XeZzs2kAUFESAdvvNR.sD9wQy', 'E3lhhQPQbH1u9mhY72dv7ZXLergekao6mXGBpMYSKEklguHPhrRotkNJ8vMz', '2023-02-12 08:55:23', '2023-02-12 08:55:23'),
(2, 'Admin', NULL, 'admin@admin.com', '2023-02-12 08:55:24', '$2y$10$pFGUnHui/Xvbkgz24mbct.4WEGPVRcDCJqcy3Ff.EyeIvBT.9Dx6.', NULL, '2023-02-12 08:55:24', '2023-02-12 08:55:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pending_new_emails`
--
ALTER TABLE `pending_new_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pending_new_emails`
--
ALTER TABLE `pending_new_emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resources`
--
ALTER TABLE `resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
