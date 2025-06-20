-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2025 at 03:50 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siami`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_mutu_internals`
--

CREATE TABLE `audit_mutu_internals` (
  `id` bigint UNSIGNED NOT NULL,
  `id_unit` bigint UNSIGNED DEFAULT NULL,
  `id_user_auditee` bigint UNSIGNED DEFAULT NULL,
  `id_user_auditor_ketua` bigint UNSIGNED DEFAULT NULL,
  `id_user_auditor_anggota1` bigint UNSIGNED DEFAULT NULL,
  `id_user_auditor_anggota2` bigint UNSIGNED DEFAULT NULL,
  `id_user_manajemen` bigint UNSIGNED DEFAULT NULL,
  `id_user_admin` bigint UNSIGNED DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `id_TA` bigint UNSIGNED DEFAULT NULL,
  `status_audit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'belum selesai',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_mutu_internals`
--

INSERT INTO `audit_mutu_internals` (`id`, `id_unit`, `id_user_auditee`, `id_user_auditor_ketua`, `id_user_auditor_anggota1`, `id_user_auditor_anggota2`, `id_user_manajemen`, `id_user_admin`, `tanggal`, `id_TA`, `status_audit`, `created_at`, `updated_at`) VALUES
(1, 2, 17, 39, 40, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 00:37:46', '2024-12-26 08:17:19'),
(2, 3, 8, 27, 26, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 00:42:10', '2025-01-13 06:39:33'),
(3, 4, 9, 26, 44, NULL, 18, NULL, '2025-01-13 00:00:00', 1, 'belum selesai', '2024-12-24 00:42:30', '2025-01-13 06:39:46'),
(4, 5, 10, 41, 42, NULL, 18, NULL, '2024-12-31 00:00:00', 1, 'belum selesai', '2024-12-24 00:42:55', '2024-12-31 05:17:40'),
(5, 6, 11, 36, 37, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 00:43:16', '2024-12-26 08:21:36'),
(6, 7, 12, 38, 36, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 00:43:38', '2024-12-26 08:21:45'),
(7, 9, 13, 25, 43, NULL, 18, NULL, '2025-01-15 00:00:00', 1, 'belum selesai', '2024-12-24 00:44:04', '2025-01-15 15:06:52'),
(8, 10, 14, 28, 29, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 00:44:26', '2024-12-26 08:17:10'),
(9, 11, 15, 30, 47, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 00:44:48', '2025-01-13 06:42:18'),
(10, 15, 16, 32, 33, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 00:45:11', '2024-12-26 08:22:12'),
(11, 18, 22, 42, 45, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 02:42:57', '2024-12-26 08:22:23'),
(12, 17, 23, 27, 46, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 02:43:17', '2025-01-06 00:01:39'),
(13, 19, 24, 34, 46, NULL, 18, NULL, '2024-12-30 00:00:00', 1, 'belum selesai', '2024-12-24 03:07:16', '2025-01-05 23:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indikators`
--

CREATE TABLE `indikators` (
  `id` bigint UNSIGNED NOT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indikator` text COLLATE utf8mb4_unicode_ci,
  `id_pernyataan` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indikators`
--

INSERT INTO `indikators` (`id`, `no`, `indikator`, `id_pernyataan`, `created_at`, `updated_at`) VALUES
(13, '1.1', 'Tersedia dokumen berisi: \n1) rumusan program/kegiatan berkelanjutan secara bertahap akan dicapai pada kurun waktu tertentu;\n2) indikator capaian yang ditargetkan per tahunnya;\n3) mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan', 7, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(14, '1.2', 'Ada bukti yang handal sebesar >80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 7, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(15, '2.1', 'Tersedia struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab.', 8, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(16, '2.2', 'Tersedia bukti pelaksanaan dijalankan dengan konsisten.', 8, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(17, '2.3', 'Ada bukti unit kerja memiliki karakteristik kepemimpinan yang kuat di kepemimpinan operasional dan kepemimpinan organisasi.\n\nCatatan:\nKepemimpinan operasional : kemampuan menjabarkan visi, misi dan tujuan strategis dalam renstra dan RKAT\nKepemimpinan  organisasional : pemahaman tata kerja unit dalam organisasi dan mengimplementasikannya (WT, tata kerja organisasi, mekanisme/prosedur kerja)', 8, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(18, '2.4', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 8, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(19, '3.1', 'Tersedia dokumen prosedur yang lengkap terkait pelayanan terhadap civitas akademika.', 9, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(20, '3.2', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 9, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(21, '3.3', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur.', 9, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(22, '3.4', 'Tersedia bukti evaluasi layanan secara berkala.', 9, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(23, '4.1', 'Tersedia sistem informasi untuk layanan akademik, yang mudah diakses oleh seluruh unit kerja dan lengkap.', 10, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(24, '4.2', 'Tersedia sistem informasi untuk layanan keuangan, yang mudah diakses oleh seluruh unit kerja dan lengkap.', 10, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(25, '4.3', 'Tersedia sistem informasi untuk layanan SDM yang mudah diakses oleh seluruh unit kerja dan lengkap.', 10, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(26, '4.4', 'Tersedia sistem informasi untuk layanan Sarpras (asset) yang mudah diakses oleh seluruh unit kerja dan lengkap.', 10, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(27, '4.5', 'Tersedia sistem informasi untuk layanan akademik, keuangan, SDM, dan Sarpras (asset) telah terintegrasi dan digunakan untuk pengambilan keputusan.', 10, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(28, '4.6', 'Tersedia bukti evaluasi sistem informasi untuk layanan akademik, keuangan, SDM, dan Sarpras (asset) yang dilakukan secara berkala setiap tahun.', 10, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(29, '4.7', 'Tersedia bukti hasil evaluasi ditindak lanjuti untuk penyempurnaan sistem informasi.', 10, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(30, '4.8', 'Terdokumentasi Blueprint pengembangan, pengelolaan, dan pemanfaatan sistem informasi, yang mencakup:  \n(1)        prasarana dan sarana yang mencukupi\n(2)        pengembangan jaringan sistem informasi\n(3)        sistem aliran data dan otorisasi akses data,  sistem disaster recovery.', 10, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(31, '4.9', 'Tersedia bukti monitoring dan evaluasi terhadap:\n1)	pelaksanaan program layanan dan \n2)	tingkat kepuasan pelayanan yang diukur dengan instrumen yang sahih, monev dilakukan secara berkala, untuk perbaikan yang berkelanjutan, dan untuk menjamin terwujudnya visi, terlaksananya misi dan tercapainya tujuan strategis', 10, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(32, '5.1', 'Tersedia sistem informasi untuk pengelolaan penelitian dan pengabdian yang mudah diakses oleh civitas akademika. ', 11, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(33, '5.2', 'Tersedia pengelolaan sistem informasi perpustakaan yang mudah diakses oleh civitas akademika. ', 11, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(34, '5.3', 'Tersedia bukti evaluasi pengelolaan sistem informasi perpustakaan, penelitian, dan pengabdian yang dilakukan secara berkala setiap tahun.', 11, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(35, '5.4', 'Tersedia bukti hasil evaluasi ditindak lanjuti untuk penyempurnaan sistem informasi perpustakaan (e-journal, e-book, e-repository, dll), penelitian, dan pengabdian kepada masyarakat (PkM).', 11, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(36, '6.1', 'Terdapat sistem informasi pembelajaran (e-learning) yang digunakan oleh seluruh dosen dan mahasiswa serta dapat digunakan sebagai sistem monitoring pembelajaran oleh stakeholder;', 12, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(37, '6.2', 'Terdapat bukti sistem informasi pembelajaran (e-learning) yang digunakan, dapat mendukung Sistem Pemjaminan Mutu Internal (SPMI), diantaranya meliputi:\na) terdapat akses bagi pengelola SPMI\nb) dapat ditarik data rekap kehadiran setiap dosen dan mahasiswa per mata kuliah\nc) dapat ditarik data rekap Berita Acara Perkuliahan per dosen per mata kuliah\nd) dapat ditarik data rekap nilai mahasiswa yang memuat Tugas, UTS, UAS dan IPK per mata kuliah', 12, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(38, '6.3', 'Tersedia bukti Sistem informasi pembelajaran dievaluasi dan hasilnya ditindaklanjuti untuk peningkatan mutu pembelajaran.', 12, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(39, '7.1', 'Tersajikan profil institusi yang mencakup data informasi tentang jurusan, unit, prodi, serta kegiatan yang meningkatkan reputasi PNJ', 13, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(40, '7.2', 'Tersajikan data statistik akreditasi, dosen, tendik, mahasiswa, serta kepuasan layanan;', 13, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(41, '7.3', 'Tersedia sistem informasi alumni yang diantarnya memuat hasil tracer study alumni;', 13, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(42, '7.4', 'Tersedia bukti evaluasi layanan sistem informasi melalui survei dengan menggunakan instrumen yang sahih dan handal dan hasil evaluasi ditindaklanjuti.', 13, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(43, '7.5', 'Tersedia fitur dua bahasa pada laman web PNJ di semua informasi yang tersedia.', 13, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(44, '1.1', 'Tersedia dokumen berisi: \n1) rumusan program/kegiatan berkelanjutan secara bertahap akan dicapai pada kurun waktu tertentu; \n2) indikator capaian yang ditargetkan per tahunnya;\n3) mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan', 14, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(45, '1.2', 'Ada bukti yang handal sebesar >80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 14, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(46, '2.1', 'Struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab, serta ada bukti dilaksanankan dengan konsisten.', 15, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(47, '2.2', 'Ada bukti unit kerja memiliki karakteristik kepemimpinan yang kuat di kepemimpinan operasional dan kepemimpinan organisasi.\n\nCatatan:\nKepemimpinan operasional : kemampuan menjabarkan visi, misi dan tujuan strategis dalam renstra dan RKAT\nKepemimpinan  organisasional : pemahaman tata kerja unit dalam organisasi dan mengimplementasikannya (WT, tata kerja organisasi, mekanisme/prosedur kerja)', 15, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(48, '2.3', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 15, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(49, '2.4', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 15, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(50, '3.1', 'Tersedia dokumen prosedur yang lengkap terkait pelayanan terhadap civitas akademika.', 16, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(51, '3.2', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 16, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(52, '3.3', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur', 16, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(53, '3.4', 'Tersedia bukti evaluasi layanan secara berkala', 16, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(54, '4.1', 'Tersedia bukti sahih skema sertifikasi profesi yang sudah disusun dan dikembangkan sesuai dengan kebutuhan kompetensi masing-masiing prodi.', 17, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(55, '4.2', 'Jumlah skema sertifikasi profesi yang telah disahkan dan digunakan yang memiliki relevansi dengan kompetensi program studi.\n\nCatatan:\nTuliskan total jumlah skema yang ada hingga tahun berjalan dan jelaskan relevansi dengan prodi apa saja.', 17, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(56, '4.3', 'Tersedia dokumen terkait monitoring dan evaluasi pelaksanaan program peningkatan mutu pembelajaran mengacu pada standar SN Dikti dan Standar Internasional.  ', 17, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(57, '5.1', 'Tersedia bukti sahih pedoman pelaksanaan uji kompetensi dan sertifikasi yang mutakhir.', 18, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(58, '5.2', 'Tersedia bukti pelaksanaan uji kompetensi dan sertifikasi yang paling sedikit memuat:\n1) Daftar total mahasiswa yang telah mengikuti uji kompetensi pada tahun berjalan.\n2) Jumlah dan daftar mahasiswa yang lulus uji kompetensi dan memiliki sertifikat kompetensi profesi.', 18, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(59, '5.3', 'Tersedia dokumen sahih terkait monitoring dan evaluasi pelaksanaan uji kompetensi dan sertifikasi yang hasilnya ditindaklanjuti dan dijadikan pengambilan keputusan.', 18, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(60, '6.1', 'Tersedia bukti sahih pedoman pelaksanaan pembinaan dan pengembangan dosen menjadi asesor kompetensi.', 19, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(61, '6.2', 'Tersedia bukti pelaksanaan pembinaan dan pengembangan dosen menjadi asesor kompetensi, yang paling sedikit memuat:\n1) Daftar total dosen yang telah mengikuti uji kompetensi menjadi asesor kompetensi pada tahun berjalan.\n2) Jumlah dan daftar dosen yang lulus uji kompetensi dan memiliki sertifikat asesor kompetensi.', 19, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(62, '6.3', 'Tersedia dokumen sahih terkait monitoring dan evaluasi pelaksanaan pembinaan dan pengembangan yang hasilnya ditindaklanjuti dan dijadikan pengambilan keputusan.', 19, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(63, '7.1', 'Tersedia daftar TUK lengkap dengan status kondisi kesiapan pakai untuk pelaksanaan uji  kompetensi.\n\nCatatn:\nJelaskan jumlah dan daftar rinci TUK yang sudah tersedia serta status kondisinya;', 20, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(64, '7.2', 'Tersedia bukti sahih TUK digunakan untuk pelaksanaan uji kompetensi.', 20, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(65, '7.3', 'Tersedia bukti TUK telah disosialisasikan dan mudah diakses oleh stakeholder.', 20, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(66, '8.1', 'Terdapat bukti dokumen pengukuran kepuasan pengguna di unit kerja yang dilakukan secara berkala dengan memuat:\n1) instrumen yang sahih, andal, dan mudah digunakan,\n2) dianalisis dengan metode yang tepat,\n3) dilaksanakan secara berkala,\n4) terdokumentasi dengan baik dan hasilnya disosialisasikan, \n5) hasil analisis bermanfaat untuk pengambilan keputusan.', 21, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(67, '1.1', 'Tersedia dokumen berisi: \n1) rumusan program/kegiatan berkelanjutan secara bertahap akan dicapai pada kurun waktu tertentu;\n2) indikator capaian yang ditargetkan per tahunnya;\n3) mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan', 22, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(68, '1.2', 'Ada bukti yang handal sebesar >80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 22, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(69, '2.1', 'Tersedia struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab.', 23, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(70, '2.2', 'Tersedia bukti pelaksanaan dijalankan dengan konsisten.', 23, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(71, '2.3', 'Ada bukti unit kerja memiliki karakteristik kepemimpinan yang kuat di kepemimpinan operasional dan kepemimpinan organisasi.\n\nCatatan:\nKepemimpinan operasional : kemampuan menjabarkan visi, misi dan tujuan strategis dalam renstra dan RKAT\nKepemimpinan  organisasional : pemahaman tata kerja unit dalam organisasi dan mengimplementasikannya (WT, tata kerja organisasi, mekanisme/prosedur kerja)', 23, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(72, '2.4', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 23, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(73, '3.1', 'Tersedia dokumen prosedur yang lengkap terkait pelayanan terhadap civitas akademika.', 24, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(74, '3.2', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 24, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(75, '3.3', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur.', 24, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(76, '3.4', 'Tersedia bukti evaluasi layanan secara berkala.', 24, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(77, '4.1', 'Tersedia dokumen pengelolaan prasarana dan sarana yang berisi kebijakan, peraturan, dan pedoman/panduan untuk semua aspek berikut.\n(1)  Pengembangan dan pencatatan \n(2)  Penetapan penggunaan \n(3)  Keamanan dan keselamatan penggunaan \n(4)  Pemeliharaan/ perbaikan/kebersihan \nyang diimplementasi-kan\n\ncatatan: lakukan observasi lapangan semua aspek untuk bukti implementasi', 25, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(78, '4.2', 'Tersedia dokumen rencana pengembangan prasarana dan sarana sangat baik yang dibreakdown dari Renstra PNJ dan didukung oleh dana yang memadai.', 25, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(79, '4.3', 'Tersedia bukti hasil evaluasi ditindak lanjuti untuk penyempurnaan pelayanan', 25, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(80, '4.4', 'Bangunan atau gedung untuk proses pembelajaran memiliki kualitas minimal kelas A atau setara, keselamatan, kesehatan, kenyamanan, dan keamanan, serta dilengkapi dengan instalasi listrik dengan daya memadai, instalasi air bersih dan instalasi air kotor. \n\nCatatan:\nObservasi kelengkapan khususnya K3 tiap lantai pada gedung tersebut (APAR, Pintu Darurat, Jalur Evakuasi, dan Signsystem K3 lainnya)', 25, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(81, '4.4', 'Tersedia bukti monitoring dan evaluasi terhadap:\n1)	pelaksanaan program layanan dan \n2)	tingkat kepuasan pelayanan yang diukur dengan instrumen yang sahih, monev dilakukan secara berkala, untuk perbaikan yang berkelanjutan, dan untuk menjamin terwujudnya visi, terlaksananya misi dan tercapainya tujuan strategis', 25, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(82, '5.1', 'Tersedia unit Perawatan dan SDM pemelihara dan perawatan bangunan gedung yang memadai atau menggunakan jasa pemeliharaan dan perawatan gedung yang bersertifikat. ', 26, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(83, '5.2', 'Memiliki dokumen tata cara pemeliharaan gedung dan terdapat bukti dilaksanakan secara konsisten ', 26, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(84, '5.3', 'Tersedia dokumen sertifikasi atau pencatatan lain terhadap fungsi yang diperbarui secara berkala seluruh bangunan dan gedung', 26, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(85, '1.1', 'Tersedia dokumen berisi: \n1) rumusan program/kegiatan berkelanjutan secara bertahap akan dicapai pada kurun waktu tertentu; \n2) indikator capaian yang ditargetkan per tahunnya;\n3) mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan', 27, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(86, '1.2', 'Ada bukti yang handal sebesar > 80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 27, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(87, '2.1', 'Struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab, serta ada bukti dilaksanankan dengan konsisten.', 28, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(88, '2.2', 'Ada bukti  unit kerja memiliki karakteristik kepemimpinan yang kuat di kepemimpinan operasional dan kepemimpinan organisasi.\n\nCatatan:\nKepemimpinan operasional : kemampuan menjabarkan visi, misi dan tujuan strategis dalam renstra dan RKAT Kepemimpinan organisasional : pemahaman tata kerja unit dalam organisasi dan mengimplementasikannya (WT, tata kerja organisasi, mekanisme/prosedur kerja)', 28, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(89, '2.3', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 28, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(90, '2.4', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 28, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(91, '3.1', 'Tersedia dokumen prosedur yang lengkap terkait pelayanan terhadap civitas akademika, diantaranya memuat prosedur:\n1) service delivery (penyampaian pelayanan)\n2) manufacturing (pengelolaan pelayanan)', 29, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(92, '3.2', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 29, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(93, '3.3', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur', 29, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(94, '3.4', 'Tersedia bukti evaluasi prosedur layanan secara berkala', 29, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(95, '4.1', 'Tersedia pedoman pelaksanaan tracer study yang sahih dan disosialisasikan.', 30, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(96, '4.2', 'Tersedia bukti instrumen tracer study yang:\n1) sahih, handal, dan mudah digunakan.\n2) dianalisis dengan metode yang tepat\n3) disosialisasikan kepada seluruh pemangku kepentingan\n4) hasilnya ditindaklanjuti dan digunakan sebagai pengambilan keputusan', 30, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(97, '4.3', 'Tersedia raw data responses kuesioner tracer study dan hasil olah data tracer study', 30, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(98, '4.4', 'Ketersediaan dokumen laporan tracer study ', 30, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(99, '4.5', 'Bukti data tracer study diupload ke sistem tracer study dikti ', 30, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(100, '4.6', 'Tersedia bukti hasil tracer dan disosialisasikan ', 30, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(101, '5.1', 'Rasio alumni dalam lima tahun terakhir yang memberikan respons terhadap studi pelacakan. \n\nRasio ≥ 35%\n\nRasio = (NA / N) x 100%\nNA = Banyaknya alumni tiga tahun terakhir yang memberikan respon\nN = Banyaknya alumni dalam tiga tahun terakhir', 31, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(102, '5.2', 'Persentase kelulusan tepat waktu untuk setiap program studi (PTWi) minimal 50% dan skor 4.\n\nCatatan:\n\nPersentase untuk program pendidikan ke-i dihitung dengan rumus sebagai berikut:\n\nPTWi = (fi / di) x 100%\n\nfi = Jumlah mahasiswa yang lulus tepat waktu pada program pendidikan ke-i.\ndi = Jumlah mahasiswa yang diterima pada angkatan tersebut pada program pendidikan ke-i.\n\nSkor akhir dihitung berdasarkan perhitungan rata-rata terbobot terhadap jumlah program studi pada setiap program pendidikan. \nSkor akhir = S(Skori x NPi) / SNPi\nNPi = banyaknya program studi pada program pendidikan ke-i , i = 1, 2, ..., 7', 31, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(103, '5.3', 'Persentase keberhasilan studi untuk seitap program minimal 85% dan skor 4\n\nPersentase untuk program pendidikan ke-i dihitung dengan rumus sebagai berikut:\n\nPPSi = (ci / ai) x 100%\n\nci = Jumlah mahasiswa yang lulus sampai dengan batas masa studi pada program pendidikan ke-i. ai = Jumlah mahasiswa yang diterima pada angkatan tersebut pada program pendidikan ke-i.\n\nSkor akhir dihitung berdasarkan rata-rata terbobot terhadap jumlah program studi pada setiap program pendidikan. \nSkor akhir = S(Skori x NPi) / SNPi\nNPi = Jumlah program studi pada program ke-i , i = 1, 2, ..., 7\n', 31, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(104, '5.4', 'Rata-rata masa tunggu (RMT) lulusan untuk memperoleh pekerjaan yang pertama (RTM)  ≤ 3 bulan dan skor 4.\n\nNL=NL4 +NL3 +NL2\n\nNJ=NJ4 +NJ3 +NJ2\n\nPJ = (NJ / NL) x 100%\n\nWT = rata-rata waktu tunggu lulusan = (WT4 + WT3 + WT2) / 3\n\nCatatan:\nNL = total jumlah lulusan 3 tahun dari TS-2, TS-3, TS-4\nNL4 = jumlah lulusan TS-4\nNL3 = jumlah lulusan TS-3\nNL2 = jumlah lulusan TS-2\n\nNJ = total jumlah lulusan yang terjaring (mengisi kuesioner)\nNJ4 = jumlah lulusan TS-4 yang terjaring \nNJ3 = jumlah lulusan TS-3 yang terjaring\nNJ2 = jumlah lulusan TS-2 yang terjaring\n\nKetentuan persentase responden lulusan:\n- untuk perguruan tinggi dengan jumlah lulusan program utama dalam 3 tahun paling sedikit 5000 orang, maka Prmin = 10%. - untuk perguruan tinggi dengan jumlah lulusan program utama dalam 3 tahun kurang dari 5000 orang,\nmaka Prmin = 20% - (10% / 5000) x NL.\n\nJika persentase responden memenuhi ketentuan diatas, maka Skor akhir = Skor.\nJika persentase responden tidak memenuhi ketentuan diatas, maka berlaku penyesuaian sebagai berikut: Skor akhir = (PJ / Prmin) x Skor.', 31, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(105, '5.5', 'Kesesuaian bidang kerja lulusan dari program utama (D3 dan D4) di perguruan tinggi terhadap kompetensi bidang studi minimal 80% dan skor 4.\n\nNL=NL4 +NL3 +NL2 ,\n\nNJ=NJ4 +NJ3 +NJ2\n\nPJ = (NJ / NL) x 100%\n\nPBS = Rata-rata persentase kesesuaian bidang kerja lulusan = (KB4 + KB3 + KB2) / 3\n\nNL = total jumlah lulusan 3 tahun dari TS-2, TS-3, TS-4\nNL4 = jumlah lulusan TS-4\nNL3 = jumlah lulusan TS-3\nNL2 = jumlah lulusan TS-2\n\nNJ = total jumlah lulusan yang terjaring (mengisi kuesioner)\nNJ4 = jumlah lulusan TS-4 yang terjaring \nNJ3 = jumlah lulusan TS-3 yang terjaring\nNJ2 = jumlah lulusan TS-2 yang terjaring\n\nKetentuan persentase responden lulusan:\n- untuk perguruan tinggi dengan jumlah lulusan program utama dalam 3 tahun paling sedikit 5000 orang, maka Prmin = 10%. - untuk perguruan tinggi dengan jumlah lulusan program utama dalam 3 tahun kurang dari 5000 orang,\nmaka Prmin = 20% - (10% / 5000) x NL.\n\nJika persentase responden memenuhi ketentuan diatas, maka Skor akhir = Skor.\nJika persentase responden tidak memenuhi ketentuan diatas, maka berlaku penyesuaian sebagai berikut: Skor akhir = (PJ / Prmin) x Skor.', 31, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(106, '5.6', 'Tingkat kepuasan pengguna lulusan yang dinilai terhadap aspek \n1) etika, \n2) keahlian pada bidang ilmu, \n3) kemampuan berbahasa asing, \n4) penggunaan teknologi informasi, \n5) kemampuan berkomunikasi, kerjasama tim, dan \n6) pengembangan diri\ndihitung dengan rumus untuk tiap-tiap aspek\n\nTingkat kepuasan aspek ke-i dihitung dengan rumus sebagai berikut:\n\nTKi =(4xai)+(3xbi)+(2xci)+di \n\ni=1,2,...,7 (untuk 7 aspek)\n\nai = persentase “sangat baik”.\nbi = persentase “baik”.\nci = persentase “cukup”. di = persentase “kurang”.\n\nNL=NL1 +NL2 +NL3 ,NJ=NJ1 +NJ2 +NJ3\nPJ = (NJ / NL) x 100%\nPBS = Rata-rata persentase kesesuaian bidang kerja lulusan = (KB1 + KB2 + KB3) / 3\n\nJumlah tanggapan pengguna lulusan yang memberikan jawaban paling sedikit:\n- 10% untuk perguruan tinggi dengan jumlah lulusan tiap tahun paling sedikit 5000 orang. - 20% untuk perguruan tinggi dengan jumlah lulusan tiap tahun kurang dari 5000 orang.\nJika jumlah tanggapan pengguna lulusan yang memberikan jawaban memenuhi ketentuan diatas, maka Skor akhir = Skor.\nJika jumlah tanggapan pengguna lulusan yang memberikan jawaban tidak memenuhi ketentuan diatas, maka berlaku perhitungan Skor akhir sebagai berikut:\n- untuk perguruan tinggi dengan jumlah lulusan tiap tahun paling sedikit 5000 orang, maka Skor akhir = (PJ / 10%) x Skor.\n- untuk perguruan tinggi dengan jumlah lulusan tiap tahun kurang dari 5000 orang, maka Skor akhir = (PJ / 20%) x Skor.\n', 31, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(107, '5.7', 'Tingkat dan ukuran tempat kerja lulusan tingkat \n1) internasional (RI) minimal  5%\n2) nasional (RN) minimal  20%\n3) lokal/wilayah atau berwirausaha (RL) minimal 90%\n\ndihitung dengan rumus:\n\nRI =(NI /NA)x100%, RN =(NN /NA)x100%, RL =(NL /NA)x100% \n\nNI = Jumlah lulusan yang bekerja di badan usaha tingkat internasional/multi nasional.\nNN = Jumlah lulusan yang bekerja di badan usaha tingkat nasional atau berwirausaha yang berizin.\nNL = Jumlah lulusan yang bekerja di badan usaha tingkat wilayah/lokal atau berwirausaha tidak berizin.\nNA = jumlah lulusan yang telah bekerja\n\nCatatan: RI, RN, RL dihitung berdasarkan jumlah lulusan yang terjaring dan bekerja, dengan rumus hitung sbb:\n\nNL = NL4 +NL3 +NL2\nNJ = NJ4 +NJ3 +NJ2 \nPJ = (NJ / NL) x 100%\n\nNL = jumlah lulusan TS-4, TS-3, TS-2;\nNJ = jumlah lulusan TS-4, TS-3, TS-2 yang terjaring tracer;\nPJ = persentase responden yang terjaring;\n\nKetentuan persentase responden lulusan:\n- untuk perguruan tinggi dengan jumlah lulusan program utama dalam 3 tahun paling sedikit 5000 orang, maka Prmin = 10%. - untuk perguruan tinggi dengan jumlah lulusan program utama dalam 3 tahun kurang dari 5000 orang,\nmaka Prmin = 20% - (10% / 5000) x NL.\nJika persentase responden memenuhi ketentuan diatas, maka Skor akhir = Skor.\nJika persentase responden tidak memenuhi ketentuan diatas, maka berlaku penyesuaian sebagai berikut: Skor akhir = (PJ / Prmin) x Skor.\n', 31, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(108, '5.8', 'Ada bukti yang handal dan terdokumentasi: partisipasi alumni dalam mendukung pengembangan  perguruan tinggi dalam bentuk: \n(1) Sumbangan dana\n(2) Sumbangan fasilitas\n(3) Masukan untuk perbaikan proses pembelajaran\n(4) Pengembangan jejaring', 31, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(109, '6.1', 'Jumlah lulusan PNJ direkrut oleh mitra kerjasama rata-rata minimal 3 orang per tahun per kerjasama.', 32, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(110, '6.2', 'Jumlah mahasiswa praktek kerja industry (OJT) minimal 5 orang per tahun per kerjasama.', 32, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(111, '7.1', 'Ada bukti yang handal; aksesibilitas dan layanan unit pembinaan dan pengembangan terhadap 5 (lima) bidang: \n(1) bimbingan dan konseling\n(2) minat dan bakat\n(3) pembinaan soft skills \n(4) beasiswa\n(5) kesehatan\ndilaksanakan secara terencana dan berkelanjutan, dengan mutu yang sangat baik sehingga dapat untuk membina dan mengembangkan penalaran, minat, bakat, seni dan kesejahteraan.', 33, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(112, '7.2', 'Ada bukti ketersediaan dokumen formal  kebijakan dan program terjadual yang dilaksanakan tentang pemberian layanan \nbimbingan karir dan informasi kerja bagi mahasiswa serta lulusan, yang mencakup:\n(1) penyebaran informasi kerja\n(2) penyelenggaraan bursa kerja secara berkala\n(3) perencanaan karir\n(4) pelatihan melamar kerja\n(5) layanan penempatan kerja', 33, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(113, '8.1', 'Tersedia bukti pengukuran kepuasan pemangku kepentingan atas layanan publik yang memuat:\n1) instrumen yang sahih dan andal serta mudah diakses,\n2) dianalisis metode yang tepat dan terukur,\n3) hasilnya disosialisasikan\n4) dilakukan secara berkala dan terdokumentasi dengan baik.', 34, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(114, '8.2', 'Tersedia bukti hasil pengukuran kepuasan pemangku kepentingan atas layanan publik yang ditindaklanjuti.', 34, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(115, '8.3', 'Tersedia bukti laporan pengukuran kepuasan pemangku kepentingan atas layanan publik dan telah  diserahkan kepada pimpinan.', 34, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(116, '1.1', 'Tersedia dokumen berisi: \n1) rumusan program/kegiatan berkelanjutan secara bertahap akan dicapai pada kurun waktu tertentu; \n2) indikator capaian yang ditargetkan per tahunnya;\n3) mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan', 35, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(117, '1.2', 'Ada bukti yang handal sebesar >80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 35, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(118, '2.1', 'Struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab, serta ada bukti dilaksanankan dengan konsisten.', 36, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(119, '2.2', 'Ada bukti unit kerja memiliki karakteristik kepemimpinan yang kuat di kepemimpinan operasional dan kepemimpinan organisasi.\n\nCatatan:\nKepemimpinan operasional: kemampuan menjabarkan visi, misi dan tujuan strategis dalam renstra dan RKAT\nKepemimpinan organisasional: pemahaman tata kerja unit dalam organisasi dan mengimplementasikannya (WT, tata kerja organisasi, mekanisme/prosedur kerja)', 36, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(120, '2.3', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 36, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(121, '2.4', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 36, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(122, '2.5', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 36, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(123, '3.1', 'Tersedia dokumen prosedur yang lengkap terkait pelayanan terhadap civitas akademika.', 37, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(124, '3.2', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur', 37, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(125, '3.3', 'Tersedia bukti evaluasi layanan secara berkala', 37, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(126, '4.1', 'Pustakawan dan kualifikasinya (A) ≥ 4\n\nPerhitungan: A = (4 X1 + 3 X2 + 2 X3)/4\n\nX1 = jumlah pustakawan yang berpendidikan S2/S3/Special Librarian.\nX2 = jumlah pustakawan yang berpendidikan D4 atau S1.\nX3 = jumlah pustaka-wan yang berpendidik-an D1, D2, atau D3.', 38, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(127, '4.2', 'Prosentase tenaga pustakawan berpendidikan minimal S1 ≥ 95%', 38, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(128, '4.3', 'Kecukupan koleksi perpustakaan, aksesibilitas termasuk ketersediaan dan kemudahan akses e-library sangat memadai. Untuk setiap bahan pustaka berikut.\nA. Buku teks\nB. Jurnal internasional\nC. Jurnal nasional terakreditasi\nD. Prosiding', 38, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(129, '4.4', 'Tersedia bukti monitoring dan evaluasi terhadap:\n1) pelaksanaan program layanan dan \n2) tingkat kepuasan pelayanan yang diukur dengan instrumen yang sahih, \nmonev dilakukan secara berkala, untuk perbaikan yang berkelanjutan, dan untuk menjamin terwujudnya visi, terlaksananya misi dan tercapainya tujuan strategis.', 38, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(130, '5.1', 'Tersedia dokumen kebijakan perpustakaan yang sahih secara tertulis minimal 5 kebijakan', 39, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(131, '5.2', 'Tersedia SK pendirian perpustakaan ', 39, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(132, '5.3', 'Tersedia kebijakan pengembangan koleksi tertulis yang ditinjau minimal setiap 3 tahun sekali. ', 39, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(133, '5.4', 'Terdapat bukti sahih pelaksanaan kebijakan ', 39, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(134, '6.1', 'Tersedia bukti hasil survei kebutuhan koleksi yang dilakukan secara rutin', 40, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(135, '6.2', 'Ketersediaan jumlah alat seleksi bahan perpustakaan minimal 7 jenis', 40, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(136, '7.1', 'Jumlah buku tercetak (diluar skripsi, tesis, disertasi, dan laporan penelitian) minimal 15.000 judul buku. ', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(137, '7.2', 'Persentase koleksi inti (koleksi yang menunjang kurikulum program studi) minimal 50% dari seluruh koleksi ', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(138, '7.3', 'Jumlah judul buku referensi yang dimiliki (kamus, ensiklopedia, bibliografi, katalog, indeks, direktori, handbook/manual, statistik, atlas, globe, dll) minimal 200 judul buku. ', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(139, '7.4', 'Jumlah surat kabar yang dilanggan baik lokal ataupun nasional minimal 6 judul ', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(140, '7.5', 'Jumlah majalah yang dilanggan minimal 6 judul ', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(141, '7.6', 'Jumlah jurnal ilmiah yang dilanggan pada masing-masing program studi minimal 4 judul ', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(142, '7.7', 'Jumlah jurnal elektronik yang dilanggan pada masing-masing program studi minimal 4 judul ', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(143, '7.8', 'Jumlah koleksi khusus dari hasil penelitian, skripsi, tesis, dan disertasi, dll minimal 4.000 judul', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(144, '7.9', 'Persentase peningkatan jumlah koleksi buku tercetak minimal 4% setiap tahun', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(145, '7.10', 'Jumlah koleksi buku elektronik (e-books) minimal 2.000 judul ', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(146, '7.11', 'Jumlah koleksi audio visual yang dimiliki seperti CD, VCD, DVD, Kaset, dll minimal 300 judul', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(147, '7.12', 'Jumlah brosur, leaflet, pamflet, poster minimal 150 judul', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(148, '7.13', 'Jumlah database yang dilanggan minimal 3 database ', 41, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(149, '8.1', 'Tersedia pengolahan buku/monograf yang mencakupi inventarisasi, klasifikasi, pengatalogan, labeling, secara otomasi dan memiliki cadangan data tercetak ', 42, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(150, '8.2', 'Tersedia standar pengolahan bahan perpustakaan yang mengikuti ketentuan baku internasional secara konsisten ', 42, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(151, '8.3', 'Tersedia sistem otomasi pengolahan menggunakan aplikasi otomasi dengan LAN terkoneksi internet', 42, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(152, '9.1', 'Tersedia kelengkapan buku minimal:\na. kartu buku \nb. kantong buku\nc. slip tanggal kembali\nd. label buku\ne. stampel \nf. barcode/chip/RFID', 43, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(153, '10.1', 'Tersedia bukti perawatan dengan metode pencacahan yang dilakukan minimal 2 tahun sekali', 44, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(154, '10.2', 'Tersedia bukti perawatan dengan metode penyiangan yang dilakukan minimal 2 tahun sekali', 44, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(155, '10.3', 'Tersedia bukti pelestarian dengan mengendalikan kondisi ruangan yang meliputi: \na. menjaga temperatur\nb. cahaya\nc. kelembapan\nd. sirkulasi udara\ne. kebersihan ', 44, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(156, '10.4', 'Tersedia bukti pelaksanaan pembasmian serangga perusak bahan perpustakaan (fumigasi) yang dilakukan minimal 1 tahun sekali', 44, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(157, '10.5', 'Jumlah perbaikan bahan perpustakaan minimal 500 eksemplar setiap tahun. ', 44, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(158, '11.1', 'Luas gedung/ruang perpustakaan minimal 1000 m²', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(159, '11.2', 'Luas area koleksi minimal 600 m²', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(160, '11.3', 'Luas area pemustaka minimal 400 m²', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(161, '11.4', 'Luas area untuk staf minimal 150 m²', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(162, '11.5', 'Luas area lain (tempat loker, toilet, lift, dll) minimal 75 m²', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(163, '11.6', 'Tersedia ruang/area di perpustakaan meliputi:\na. ruang koleksi\nb. ruang baca\nc. sirkulasi\nd. ruang kreja\ne. ruang multimedia\nf. ruang diskusi, dan\ng. ruang baca khusus', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(164, '11.7', 'Tersedia bukti kondisi gedung dan ruangan secara keseluruhan sangat bersih dan terkelola dengan baik ', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(165, '11.8', 'Tersedia bukti sumber pencahayaan yang terang secara alami dan elektrik untuk ruang baca, ruang koleksi, dan ruang kerja. ', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(166, '11.9', 'Tersedia bukti kondisi sirkulasi udara untuk semua ruangan bekerja dengan baik. ', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(167, '11.10', 'Letak atau lokasi perpustakaan berada di pusat kegiatan pembelajaran dan administrasi Perguruan Tinggi', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(168, '11.11', 'Jumlah rak buku minimal 75 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(169, '11.12', 'Jumlah rak jurnal minimal 5 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(170, '11.13', 'Jumlah rak surat kabar minimal 2 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(171, '11.14', 'Jumlah rak multimedia minimal 3 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(172, '11.15', 'Jumlah rak buku referensi minimal 5 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(173, '11.16', 'Jumlah rak display buku baru minimal 3 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(174, '11.17', 'Jumlah rak audio visual minimal 2 buah dengan kondisi yang layak', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(175, '11.18', 'Tersedia sarana penyimpanan katalog yang meliputi:\na. komputer\nb. lemari katalog\nc. rak katalog buku', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(176, '11.19', 'Jumlah papan pengumuman minimal 4 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(177, '11.20', 'Jumlah meja baca minimal 40 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(178, '11.21', 'Jumlah meja sirkulasi secara manual dan otomatis minimal 1 buah dengan desain khusus', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(179, '11.22', 'Jumlah meja kerja petugas minimal 10 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(180, '11.23', 'Jumlah kursi baca minimal 100 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(181, '11.24', 'Jumlah televisi minimal 4 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(182, '11.25', 'Jumlah scanner minimal 5 buah ', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(183, '11.26', 'Jumlah perangkat komputer untuk kegiatan pengolahan dan administrasi minimal 10 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(184, '11.27', 'Jumlah perangkat komputer untuk pemustaka minimal 20 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(185, '11.28', 'Jumlah komputer yang terhubung dengan internet minimal 25 unit', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(186, '11.29', 'Tersedia bukti memiliki aplikasi otomasi perpustakaan yang terkoneksi dengan internet', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(187, '11.30', 'Kapasitas bandwidth (lebar pita) yang tersedia untuk keperluan perpustakaan minimal 500 MB', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(188, '11.31', 'Terdapat CCTV minimal 2 buat di setiap ruangan', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(189, '11.32', 'Terdapat pintu detektor minimal 1 buah', 45, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(190, '12.1', 'Tersedia jenis pelayanan perpustakaan yang terdiri dari:\na. layanan baca di tempat\nb. sirkulasi\nc. referensi\nd. penelusuran \ne. literasi informasi\nf. silang layanan, dan \ng. penyediaan dokumen', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(191, '12.2', 'Tersedia bukti hasil kegiatan peningkatan pelayanan perpustakaan melalui survei kebutuhan layanan pemustaka dan kepuasan pemustaka', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(192, '12.3', 'Tersedia bukti hasil kegiatan peningkatan pelayanan perpustakaan yang telah diverifikasi layanan', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(193, '12.4', 'Tersedia bukti pelibatan mahasiswa dalam layanan dan layanan ekstensi (misalnya mahasiswa non PNJ dapat mengunjungi perpustakaan PNJ)', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(194, '12.5', 'Tersedia bukti memiliki sistem peminjaman/pengembalian bahan perpustakaan secara otomasi', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(195, '12.6', 'Tersedia bukti sistem penelusuran informasi ke koleksi melalui OPAC dan katalog manual ', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(196, '12.7', 'Tersedia bukti penelusuran informasi ke sumber daya informasi secara offline dan online', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(197, '12.8', 'Tersedia bukti sistem otomasi pelayanan yang bergabung dengan jejaring perpustakaan online', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(198, '12.9', 'Tersedia bukti website perpustakaan yang terdiri dari:\na. profil perpustakaan\nb. OPAC\nc. informasi layanan perpustakaan\nd. kontak perpustakaan\ne. link ke database online/repositori\nf. media sosial', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(199, '12.10', 'persentase jumlah mahasiswa yang menjadi anggota minimal 90% dari total jumlah mahasiswa di PNJ', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(200, '12.11', 'persentase jumlah dosen dan tendik yang menjadi anggota minimal 90% dari total jumlah dosen dan tendik di PNJ', 46, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(201, '13.1', 'Tersedia bukti jenis media promosi yang digunakan minimal 7 jenis per tahun', 47, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(202, '13.2', 'Jumlah kegiatan promosi perpustakaan minimal 9 kali per tahun', 47, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(203, '13.3', 'Tersedia bukti jenis literasi informasi minimal 4 jenis per tahun ', 47, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(204, '13.4', 'Jumlah kegiatan literasi informasi minimal 8 kali per tahun', 47, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(205, '13.5', 'Tersedia bukti perpustakaan berperan dalam mengurangi praktik plagiarisme minimal 4 cara terdiri dari:\na. menyediakan aplikasi online pengontrol plagiarisme\nb. memberi topik tentang plagiarisme dalam kegiatan literasi\nc. mengontrol pemustaka dalam memfotocopy literatur di perpustakaan \nd. melakukan himbauan tertulis anti plagiarisme di perpustakaan', 47, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(206, '13.6', 'Rata-rata jumlah pengunjung perpustakaan minimal 8.000 orang per bulan per tahun', 47, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(207, '13.7', 'Rata-rata jumlah pengunjung perpustakaan melalui online minimal 3.000 orang per bulan per tahun', 47, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(208, '13.8', 'Rata-rata jumlah buku yang dipinjam minimal 3.000 per bulan per tahun ', 47, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(209, '14.1', 'Tersedia bukti kepala perpustakaan memiliki sertifikasi progesional sebagai pustakawan', 48, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(210, '14.2', 'Tersedia bukti kepala perpustakaan memiliki jenjang pendidikan S2 perpustakaan/non-perpustakaan atau lebih tinggi ditambah diklat kepustakawanan', 48, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(211, '14.3', 'Tersedia bukti peningkatan kompetensi berkelanjutan (PKB) kepala perpustakaan dalam pelatihan, bimtek, seminar, lokakarya, dll dalam bidang perpustakaan minimal 10 kali per 3 tahun ', 48, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(212, '14.4', 'Jumlah pustakawan profesional (memiliki latar belakang dan atau sertifikat kompetensi perupustakaan) minimal 6 orang', 48, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(213, '14.5', 'Jumlah tenaga teknis minimal 4 orang', 48, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(214, '14.6', 'Jumlah tenaga perpustakaan dengan latar belakang pendidikan minimal D2 perpustakaan/non-perpustakaan serta memiliki sertifikasi perpustakaan minimal 6 orang', 48, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(215, '14.7', 'Rata-rata peningkatan kompetensi berkelanjutan (PKB) minimal 4 kali per orang tenaga (pelatihan, bimtek, seminar, lokakarya, dll) perpustakaan dalam 3 tahun', 48, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(216, '14.8', 'Jumlah tenaga yang memiliki sertifikat kompetensi minimal 10%', 48, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(217, '14.9', 'Jumlah tenaga perpustakaan sebagai anggota profesi minimal 5 orang ', 48, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(218, '15.1', 'Tersedia bukti program kerja perpustakaan baik jangka pendek dan menengah', 49, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(219, '15.2', 'Tersedia bukti laporan kegiatan tahunan atau triwulan ', 49, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(220, '16.1', 'Rata-rata jumlah dana partisipasi masyarakat/alumni/perusahaan minimal 50 juta.', 50, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(221, '17.1', 'Tersedia bukti Jumlah kerja sama perpustakaan dengan internal lingkungan perguruan tinggi minimal 8 yang dapat terdiri dari:\na. kegiatan bedah buku\nb. sosialisasi koleksi pustaka \nc. promosi bersama untuk meningkatkan pengunjung/pelanggan\nd. acara workshop merawat buku\ne. pameran koleksi pustaka baru ', 51, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(222, '17.2', 'Tersedia bukti Jumlah kerja sama perpustakaan dengan ekstrenal dengan lembaga/komunitas di luar perguruan tinggi minimal 8 yang dapat terdiri dari:\na. kegiatan bedah buku\nb. sosialisasi koleksi pustaka \nc. promosi bersama untuk meningkatkan pengunjung/pelanggan\nd. acara workshop merawat buku\ne. pameran koleksi pustaka baru ', 51, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(223, '18.1', 'Tersedia bukti rapat dengan pimpinan yang melibatkan Direktur, para Wakil Direktur, dan bagian terkait minimal 2 kali dalam setahun', 52, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(224, '18.2', 'Jumlah karya inovatif/kreatif yang diterapkan dalam pengelolaan perpustakaan (pengembangan koleksi, pengolahan, layanan, perawatan, pelibatan mahasiswa/dosen, aplikasi TI dll.) minimal 5 karya ', 52, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(225, '18.3', 'Jumlah jenis keunikan (koleksi berkebutuhan khusus, koleksi khusus, model layanan, lokasi perpustakaan, desain tata ruang, kegiatan akademik , dll.) minimal 4 macam', 52, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(226, '18.4', 'Jumlah prestasi perpustakaan dan pustakawan (juara, pengakuan kinerja, apresiasi, keterlibatan dalam profesi lokal dan nasional dll.) minimal 5 per 3 tahun ', 52, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(227, '18.5', 'Jumlah program yang melibatkan fakultas/ jurusan/ program studi dan sivitas akademika dalam pengembangan perpustakaan minimal 4 program per tahun', 52, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(228, '18.6', 'Tersedia bukti pelaksanaan survei dampak pelayanan perpustakaan terhadap perkembangan prestasi akademis (karya tulis ilmiah, penelitian, dll) minimal 4 kali per 3 tahun', 52, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(229, '1.1', 'Tersedia dokumen berisi: \n1) rumusan program/kegiatan berkelanjutan secara bertahap akan dicapai pada kurun waktu tertentu; \n2) indikator capaian yang ditargetkan per tahunnya;\n3) mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan', 53, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(230, '1.2', 'Ada bukti yang handal sebesar > 80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 53, '2024-12-24 00:14:35', '2024-12-24 00:14:35');
INSERT INTO `indikators` (`id`, `no`, `indikator`, `id_pernyataan`, `created_at`, `updated_at`) VALUES
(231, '2.1', 'Struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab, serta ada bukti dilaksanankan dengan konsisten.', 54, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(232, '2.2', 'Ada bukti unit kerja memiliki karakteristik kepemimpinan yang kuat di kepemimpinan operasional dan kepemimpinan organisasi.\n\nCatatan:\nKepemimpinan operasional : kemampuan menjabarkan visi, misi dan tujuan strategis dalam renstra dan RKAT\nKepemimpinan  organisasional : pemahaman tata kerja unit dalam organisasi dan mengimplementasikannya (WT, tata kerja organisasi, mekanisme/prosedur kerja)', 54, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(233, '2.3', 'Tersedia bukti pelaksanaan dijalankan dengan konsisten.', 54, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(234, '2.4', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 54, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(235, '3.1', 'Tersedia dokumen prosedur yang lengkap terkait pelayanan terhadap civitas akademika, diantaranya memuat prosedur:\n1) service delivery (penyampaian pelayanan)\n2) manufacturing (pengelolaan pelayanan)', 55, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(236, '3.2', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 55, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(237, '3.3', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur', 55, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(238, '3.4', 'Tersedia bukti evaluasi prosedur layanan secara berkala', 55, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(239, '4.1', 'Tersedia dokumentasi untuk pelaksanaan produksi PU, yang mudah diakses oleh seluruh unit kerja dan lengkap.', 56, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(240, '4.2', 'Tersedia bukti hasil evaluasi ditindak lanjuti untuk penyempurnaan produk yang dihasilkan setiap tahun.', 56, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(241, '4.3', 'Terdokumentasi Blueprint pengembangan, pengelolaan, dan pemanfaatan produksi unggulan, yang mencakup:  \n(1)        prasarana dan sarana yang mencukupi\n(2)        pengembangan produksi\n', 56, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(242, '4.4', 'Tersedia bukti monitoring dan evaluasi terhadap:\n1)	pelaksanaan program layanan dan \n2)	tingkat kepuasan pengguna yang diukur dengan instrumen yang sahih, monev dilakukan secara berkala, untuk perbaikan yang berkelanjutan, dan untuk menjamin terwujudnya visi, terlaksananya misi dan tercapainya tujuan strategis', 56, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(243, '4.5', 'Tersedia bukti pelaksanaan pengembangan bisnis melalui kegiatan pendidikan, penelitian, pengabdian masyarakat dan lainnya yang ketercapaiannya terukur dalam satuan waktu dan atau pendapatan.', 56, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(244, '4.6', 'Terdapat bukti sahih pencatatan pendapatan dari masing-masing program pengembangan bisnis yang akuntabel, kredibel, transparan dan dilaporkan secara berkala ke pemangku kepentingan. ', 56, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(245, '4.7', 'Terdapat bukti sahih monitoring dan evaluasi program pengembangan bisnis dilakukan secara berkala yang hasilnya ditindaklanjuti bermanfaat untuk pengambilan keputusan.', 56, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(246, '5.1', 'Terdapat bukti sahih program pengembangan dan pengelolaan:\n1) kursus dan pelatihan\n2) uji kompetensi\n3) sertifikasi profesi\n4) layanan jasa\n5) layanan produksi\n6) lainnya', 57, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(247, '5.2', 'Jumlah output/luaran dari masing-masing program berikut serta bukti sahih pelaksanaannya.\n1) kursus dan pelatihan\n2) uji kompetensi\n3) sertifikasi profesi\n4) layanan jasa\n5) layanan produksi\n6) lainnya', 57, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(248, '6.1', 'Terdapat bukti sahih daftar fasilitas, sarana dan prasarana yang dapat dimanfaatkan dan diberdayakan untuk income generator;', 58, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(249, '6.2', 'Terdapat bukti sahih pemanfaatan dan pemberdayaan fasilitas, sarana dan prasarana untuk kegiatan pengembangan bisnis.', 58, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(250, '7.1', 'Tersedia bukti pengukuran kepuasan pemangku kepentingan atas layanan publik yang memuat:\n1) instrumen yang sahih dan andal serta mudah diakses,\n2) dianalisis metode yang tepat dan terukur,\n3) hasilnya disosialisasikan\n4) dilakukan secara berkala dan terdokumentasi dengan baik.', 59, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(251, '7.2', 'Tersedia bukti hasil pengukuran kepuasan pemangku kepentingan atas layanan publik yang ditindaklanjuti.', 59, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(252, '7.3', 'Tersedia bukti laporan pengukuran kepuasan pemangku kepentingan atas layanan publik dan telah  diserahkan kepada pimpinan.', 59, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(253, '8.1', 'Terdapat bukti sahih pengawasan mutu produk unggulan sesuai dengan:\n1) SOP\n2) QA/ISO\n3) lainnya', 60, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(254, '8.2', 'Terdapat bukti sahih pemasaran produk unggulan', 60, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(255, '8.3', 'Jumlah output/luaran dari masing-masing program berikut serta bukti sahih pelaksanaannya.\n1) pengawasan mutu Produk unggulan\n2) pemasaran produk unggulan', 60, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(256, '1.1', 'Tersedia dokumen berisi: \n1) rumusan program/kegiatan berkelanjutan secara bertahap akan dicapai pada kurun waktu tertentu; \n2) indikator capaian yang ditargetkan per tahunnya;\n3) mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan', 61, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(257, '1.2', 'Ada bukti yang handal sebesar > 80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 61, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(258, '2.1', 'Struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab, serta ada bukti dilaksanankan dengan konsisten.', 62, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(259, '2.2', 'Ada bukti  unit kerja memiliki karakteristik kepemimpinan yang kuat di kepemimpinan operasional dan kepemimpinan organisasi.\n\nCatatan:\nKepemimpinan operasional : kemampuan menjabarkan visi, misi dan tujuan strategis dalam renstra dan RKAT Kepemimpinan organisasional : pemahaman tata kerja unit dalam organisasi dan mengimplementasikannya (WT, tata kerja organisasi, mekanisme/prosedur kerja)', 62, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(260, '2.3', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 62, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(261, '2.4', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 62, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(262, '3.1', 'Tersedia dokumen prosedur yang lengkap terkait pelayanan terhadap civitas akademika, diantaranya memuat prosedur:\n1) service delivery (penyampaian pelayanan)\n2) manufacturing (pengelolaan pelayanan)', 63, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(263, '3.2', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 63, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(264, '3.3', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur', 63, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(265, '3.4', 'Tersedia bukti evaluasi prosedur layanan secara berkala', 63, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(266, '4.1', 'Tersedia prosedur pelayanan protokoler bagi pimpinan dan tamu.', 64, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(267, '4.2', 'Tersedia data penerimaan tamu.', 64, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(268, '4.3', 'Tersedia bukti evaluasi layanan keprotokolan yang hasilnya ditindaklanjuti dan dimanfaatkan untuk pengambilan keputusan', 64, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(269, '5.1', 'Terdapat saluran/wadah pengaduan publik yang mudah diakses minimal dalam bentuk:\n1) hotline call, dan\n2) link pada web, dan \n3) saluran media sosial, dan\n4) saluran lain yang relevan.', 65, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(270, '5.2', 'Tersedia bukti saluran pengaduan disosialisasikan', 65, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(271, '5.3', 'Tersedia bukti keterlaksanaan layanan pengaduan yang dievaluasi secara berkala dan hasilnya ditindaklanjuti bermanfaat untuk pengambilan keputusan serta terdokumentasi dengan baik.', 65, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(272, '6.1', 'Terdapat informasi pada web PNJ yang disajikan dalam dua bahasa, paling sedikit memuat:\n1) Profil PNJ lengkap dengan rincian jumlah jurusan dan program studi,\n2) Data akreditasi setiap prodi,\n3) Data jumlah dosen, mahasiswa, dan tenaga kependidikan,\n4) Fasilitas layanan pembelajaran\n5) Fasilitas layanan kemahasiswaan\n6) Fasilitas layanan publik\n7) dan informasi lainnya yang relevan dengan profil institusi.', 66, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(273, '6.2', 'Terdapat bukti kemutakhiran seluruh data informasi pada web PNJ.', 66, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(274, '7.1', 'Tersedia daftar sarana prasarana yang dimiliki kehumasan untuk mendukung pelayanan publik dalam kondisi baik dan dapat digunakan.', 67, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(275, '7.2', 'Tersedia bukti sarana prasarana dievaluasi dan hasilnya ditindaklanjuti.', 67, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(276, '8.1', 'Tersedia bukti pengukuran kepuasan pemangku kepentingan atas layanan publik yang memuat:\n1) instrumen yang sahih dan andal serta mudah diakses,\n2) dianalisis metode yang tepat dan terukur,\n3) hasilnya disosialisasikan\n4) dilakukan secara berkala dan terdokumentasi dengan baik.', 68, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(277, '8.2', 'Tersedia bukti hasil pengukuran kepuasan pemangku kepentingan atas layanan publik yang ditindaklanjuti.', 68, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(278, '8.3', 'Tersedia bukti laporan pengukuran kepuasan pemangku kepentingan atas layanan publik dan telah  diserahkan kepada pimpinan.', 68, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(279, '1.1', 'Tersedia dokumen berisi: \n1) rumusan program/kegiatan berkelanjutan secara bertahap akan dicapai pada kurun waktu tertentu; \n2) indikator capaian yang ditargetkan per tahunnya;\n3) mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan', 69, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(280, '1.2', 'Ada bukti yang handal sebesar >80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 69, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(281, '2.1', 'Struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab, serta ada bukti dilaksanankan dengan konsisten.', 70, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(282, '2.2', 'Ada bukti unit kerja memiliki karakteristik kepemimpinan yang kuat di kepemimpinan operasional dan kepemimpinan organisasi.\n\nCatatan:\nKepemimpinan operasional : kemampuan menjabarkan visi, misi dan tujuan strategis dalam renstra dan RKAT\nKepemimpinan  organisasional : pemahaman tata kerja unit dalam organisasi dan mengimplementasikannya (WT, tata kerja organisasi, mekanisme/prosedur kerja)', 70, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(283, '2.3', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 70, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(284, '3.1', 'Tersedia dokumen prosedur yang lengkap terkait pelayanan terhadap civitas akademika.', 71, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(285, '3.2', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 71, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(286, '3.3', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur', 71, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(287, '3.4', 'Tersedia bukti evaluasi layanan secara berkala', 71, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(288, '4.1', 'Tersedia dokumen formil (pedoman, panduan, prosedur, dll) pengelolaan informasi publik.', 72, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(289, '5.1', 'Tersedia bukti rencana promosi program dan kegiatan institusi yang target ketercapaiannya dapat diukur dalam kurun waktu tertentu.', 73, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(290, '5.2', 'Tersedia bukti implementasi promosi program dan kegiatan insitutsi ke tingkat internasional.', 73, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(291, '5.2', 'Tersedia bukti evaluasi implementasi promosi yang hasilnya ditindaklanjuti dan digunakan dalam pengambilan keputusan untuk pengembangan dan keberlanjutan program.', 73, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(292, '6.1', 'Tersedia dokumen formil pedoman pengelolaan tridharma perguruan tinggi luar negeri yang target ketercapaiannya dapat terukur dalam kurun waktu tertentu.', 74, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(293, '6.2', 'Tersedia bukti efektifitas pelaksanaan pengelolaan kerjasama luar negeri yang melibatkan dosen dan mahasiswa.', 74, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(294, '6.3', 'Tersedia bukti efektifitas pelaksanaan pertukaran program dual/join/double degree ', 74, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(295, '6.4', 'Tersedia bukti pelaksanaan kelas kerjasama internasional.', 74, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(296, '6.5', 'Persentase jumlah mahasiswa Asing yang belajar di PNJ dalam 3 tahun terakhir minimal 0,5% dari seluruh jumlah mahasiswa aktif PNJ.', 74, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(297, '7.1', 'Tersedia pedoman yang sahih tentnag pengelolaan website berbahasa Inggris.', 75, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(298, '7.2', 'Seluruh informasi yang ada di web PNJ sudah dapat dual bahasa (tersedia Bahasa Inggris) maksimal di tahun 2023.', 75, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(299, '8.1', 'Tersedia laporan akhir tahun yang telah dianalisis dan disahkan oleh yang berwenang sertai diserahkan ke pimpinan.', 76, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(300, '1.1', 'Tersedia dokumen berisi: \n1) rumusan program/kegiatan berkelanjutan secara bertahap akan dicapai pada kurun waktu tertentu; \n2) indikator capaian yang ditargetkan per tahunnya;\n3) mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan', 77, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(301, '1.2', 'Ada bukti pedoman pengelolaan sarana prasarana yang sahih.', 77, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(302, '1.3', 'Ada bukti yang sahih dan andal tentang implementasi kebijakan dan pedoman pengelolaan sarana prasarana.', 77, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(303, '2.1', 'Ada Struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab, serta ada bukti dilaksanankan dengan konsisten.', 78, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(304, '2.2', 'Ada bukti  unit kerja memiliki karakteristik kepemimpinan yang kuat di kepemimpinan operasional dan kepemimpinan organisasi.\n\nCatatan:\nKepemimpinan operasional : kemampuan menjabarkan visi, misi dan tujuan strategis dalam renstra dan RKAT\nKepemimpinan  organisasional : pemahaman tata kerja unit dalam organisasi dan mengimplementasikannya (WT/wewenang dan tugas, tata kerja organisasi, mekanisme/prosedur kerja)', 78, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(305, '2.3', 'Ada bukti yang handal sistem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi.', 78, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(306, '3.1', 'Tersedia dokumen prosedur (SOP) yang lengkap terkait pelayanan terhadap civitas akademika.', 79, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(307, '3.1', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 79, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(308, '3.2', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur', 79, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(309, '3.3', 'Tersedia bukti evaluasi layanan secara berkala', 79, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(310, '4.1', 'Tersedia dokumen pengelolaan prasarana dan sarana yang berisi kebijakan, peraturan, dan pedoman/panduan untuk semua aspek berikut.\n(1)  Pengembangan dan pencatatan \n(2)  Penetapan penggunaan \n(3)  Keamanan dan keselamatan penggunaan \n(4)  Pemeliharaan/ perbaikan/kebersihan \nyang diimplementasi-kan\n\ncatatan: lakukan observasi lapangan semua aspek untuk bukti implementasi', 80, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(311, '4.2', 'Prasarana dan sarana sangat lengkap, dibuktikan dengan tersedianya fasilitas kegiatan akademik dan non-akademik yang sangat memadai.\n\nKetersediaan:\n(1)	 Prasarana akademik (kegiatan tridarma PT)\n(2)	 Prasarana non-akademik (fasilitas pengembangan minat, bakat, dan kesejahteraan)', 80, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(312, '4.3', 'Ada bukti ketersediaan dokumen rencana pengembangan prasarana dan sarana sangat baik yang dibreakdown dari Renstra PNJ dan didukung oleh dana yang memadai.', 80, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(313, '5.2', 'Bangunan atau gedung untuk proses pembelajaran memiliki kualitas minimal kelas A atau setara, keselamatan, kesehatan, kenyamanan, dan keamanan, serta dilengkapi dengan instalasi listrik dengan daya memadai, instalasi air bersih dan instalasi air kotor. \n\nCatatan:\nObservasi kelengkapan khususnya K3 tiap lantai pada gedung tersebut (APAR, Pintu Darurat, Jalur Evakuasi, dan Signsystem K3 lainnya)', 81, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(314, '5.3', 'Kekuatan fisik bangunan dan gedung dicirikan oleh: \na)	 Struktur bangunan kuat dan kokoh \nb)	 Stabil dalam memikul beban/kombinasi beban \nc) 	 Memenuhi persyaratan kelayanan (serviceability) dengan mempertimbangkan fungsi gedung, lokasi & keawetan ', 81, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(315, '5.4', 'Kecukupan dan ketersediaan prasarana pembelajaran: \na)	 Ruang kelas: 1,5 - 2 m2 / mahasiswa \nb)	 Ruang kantor: 2-3 m2/dosen atau karyawan \nc)	 Ruang rapat: 2 m2/peserta rapat \nd)	 Ruang Serba Guna  \ne)	 Klinik  sesuai standar Puskesmas (ada dokter dan perawat)  \nf)	 Ruang perpustakaan: 1.6 m2/orang \ng)	 Ruang komputer: 2 m2/orang \nh)	 Masjid: sesuai jumlah maksimal  jama’ah dan kegiatan keagamaan rutin (kegiatan sholat jum’at di masjid PNJ merupakan kegiatan dengan pemakaian terbesar) \ni)	 PKM (Pusat Kegiatan Mahasiswa): sesuai dengan rata-rata jumlah kunjungan mahasiswa dan karyawan/hari  \nj)	 Asrama : sesuai dengan daya tampung yang direncanakan dan dikelola sesuai dengan ketentuan yang berlaku. \nk)	 Ruang kegiatan kemahasiswaan: memenuhi rencana dan sesuai dengan kegiatan kelembagaan kemahasiswaan yang ada di PNJ\nl)	 jenis kegiatan mahasiswa (teater, seni tari, ruang senat mahasiswa, carier development centre, dan lain-lain) \nm)	 Gedung olahraga: memenuhi kriteria gedung (indoor) untuk pemakaian jenis cabang olaharaga tertentu  \nn)	 Gudang: sesuai dengan rencana daya tampung per periode (umur penyimpanan)\no) Area Parkir \np)	 Bengkel Kendaraan: sesuai jenis dan jumlah kendaraan institusi serta kebutuhan ruang peralatan bengkel \nKantin : memenuhi ruang untuk penempatan dapur dan pelayananan dengan kapasitas yang sesuai dengan perencanaan', 81, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(316, '5.5', 'Terlaksana Efektif pemakaian Bangunan dan Gedung yang dicirikan oleh : \na)	Mempunyai pedoman pemakaian sarana \nb)	Memiliki target pemakaian \nc)	Memiliki data pemakaian dan dinilai efektif dalam pemakaiannya \nd) Dibuat rekomendasi perbaikan ', 81, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(317, '5.6', 'Ada bukti safety induction (baik berupa video atau gambar lainnya) telah diimplementasikan', 81, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(318, '6.1', 'Tersedia unit Perawatan dan SDM pemelihara dan perawatan bangunan gedung yang memadai atau menggunakan jasa pemeliharaan dan perawatan gedung yang bersertifikat. ', 82, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(319, '6.2', 'Memiliki dokumen tata cara pemeliharaan gedung dan terdapat bukti dilaksanakan secara konsisten ', 82, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(320, '6.3', 'Tersedia dokumen sertifikasi atau pencatatan lain terhadap fungsi yang diperbarui secara berkala seluruh bangunan dan gedung', 82, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(321, '7.1', 'Ketersediaan air bersih yang dicirikan oleh: \na) Sistem penyediaan air bersih, reservoir, perpipaan, dan perlengkapannya, memenuhi persyaratan teknis \nb) Jumlah air yang tersedia memenuhi kebutuhan pemakai \nc) Kualitas air memenuhi persyaratan air bersih \nd) Aliran air mengalir secara menerus \ne) Tidak ada keluhan dari pemakai ', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(322, '7.2', 'Ketersediaan Sanitasi yang dicirikan oleh:    \na) WC/ toilet memenuhi jumlah dan persyaratan teknis \nb) Aliran air bersih dalam jumlah cukup dengan kebutuhan \nc) WC/toilet dalam keadaan bersih dan berfungsi \nd) Tidak ada keluhan dari pemakai ', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(323, '7.3', 'Ketersediaan Drainase yang dicirikan oleh: \na) Saluran drainase dan bangunan air lainnya memenuhi persyaratan teknis \nb) Saluran drainase mampu mengatasi aliran air puncak (tidak terjadi genangan air atau banjir) \nc) Saluran drainase yang bersih/terpelihara ', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(324, '7.4', 'Ketersediaan Pengolahan Sampah yang dicirikan oleh:   \na) Memiliki Pedoman perencanaan pengelolaan sampah terpadu secara lengkap \nb) Memiliki peralatan/perlengkapan pengelolaan sampah mulai dari pewadahan (sekaligus pemilahan), pengumpulan, TPS dan TPA dengan kualitas baik. \nc) Pengolahan sampah dilaksanakan dengan prinsip 3R. \nPemeliharaan dilakukan secara rutin ', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(325, '7.5', 'Ketersediaan Listrik yang dicirikan oleh: \na) Instalasi jaringan dan perlengkapan listrik memenuhi persyaratan teknis \nb) Gardu listrik dan peralatan listrik dengan kondisi baik (laporan pemeriksaan secara berkala) \nc) Proses pembelajaran tidak terganggu oleh kurangnya daya listrik \nd) Pemakaian sesuai kebutuhan (dokumen laporan penggunaan listrik) ', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(326, '7.6', 'Ketersediaan Jaringan Telekomunikasi dan Internet yang dicirikan oleh:    \na) Tersedia sambungan dan instalasi telepon dengan kondisi baik (laporan pemeriksaan secara berkala) \nb) Tersedia jaringan informasi Internet dan komunikasi lainnya (Misal BTS) \nc) Tidak terganggunya proses komunikasi dan informasi karena minimnya jumlah saluran telepon/internet dan lainnya \nd) Pemakaian sesuai kebutuhan (dokumen laporan penggunaan telepon/internet, dan lainnya). ', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(327, '7.7', 'Ketersediaan kendaraan transportasi yang dicirikan oleh: \na) Jumlah BUS memenuhi daya angkut mahasiswa, karyawan, dan lain-lain (dilakukan pendataan) yang diselaraskan dengan jadwal angkutan yang efisien dan efektif serta dimonitor secara periodik. \nb) Kualitas bus baik (fisik baik, terawat dan ada dokumen pemakaian dan perawatan) dan sarana jalan kampus yang baik.', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(328, '7.8', 'Ketersediaan prasarana parkir yang dicirikan oleh: \nMemenuhi daya tampung kendaraan mobil dan motor sivitas akademika (berdasarkan pendataan), namun tidak mengurangi lahan hijau ', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(329, '7.9', 'Tata letak dan pengaturan yang tepat serta  keamanan kendaraan di tempat parkir', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(330, '7.10', 'Ketersediaan Taman yang dicirikan oleh: \na) Penataan taman yang menunjang suasana belajar yang nyaman dan asri \nb) Pemilihan tanamanan yang tepat untuk lingkungan, keindahan dan kemudahan perawatan/pemeliharaan secara berkala yang terencana. ', 83, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(331, '8.1', 'Pengurusan legalitas kepemilikan lahan kampus.', 84, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(332, '8.2', 'Pengembangan lahan kampus diluar kampus utama.', 84, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(333, '9.1', 'Ada bukti master plan green campus dan evaluasi keterlaksanaannya.', 85, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(334, '9.2', 'Ada bukti pengembangan landscape dan lingkungan kampus yang hijau dan asri.', 85, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(335, '9.3', 'Ada bukti pengembangan prasarana pendidikan yang memadai.', 85, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(336, '9.4', 'Ada bukti pengembangan instalasi jaringan, utilitas, dan ruang publik yang handal.', 85, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(337, '9.5', 'Ada bukti pengembangan aksesibilitas lingkungan kampus yang mudah dan aman.', 85, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(338, '10.1', 'Perencanaan dan pembangunan gedung perkuliahan, laboratorium, bengkel yang smart dan terpadu.', 86, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(339, '10.2', 'Perencanaan dan pembangunan gedung perkantoran dan lainnya yang smart dan terpadu.', 86, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(340, '10.3', 'Perencanaan dan pembangunan sarana dan prasarana kegiatan mahasiswa terpadu yang smart.', 86, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(341, '11.1', 'Ada bukti perencanaan pengembangan sapras disabilitas yang terukur.', 87, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(342, '11.2', 'Tersedia sapras untuk disabilitas/ABK yang dapat terdiri dari:\na. Tanda (sign system) pada sekitar gedung\nb. Jalur kursi roda dan atau Ramp\nc. Pintu yang aksesibel\nd. Penataan ruang yang aksesibel\ne. Ruang layanan ABK untuk penenangan, pengembangan komunikasi dan interaksi sosial.', 87, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(343, '11.3', 'Tersedia pedoman/prosedur penggunaan sapras disabilitas/ABK', 87, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(344, '12.1', 'Kecukupan sarana dan prasarana terlihat dari ketersediaan, kemutakhiran, dan relevansi yang mendukung pembelajaran, penelitian, dan PkM, sekaligus untuk kegiatan pengembangan dan pelayanan termasuk teaching factory (factory for teaching) atau teaching industry \n(attachment ke industri).', 88, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(345, '12.2', 'Ketersediaan Sistem TIK (Teknologi Informasi dan Komunikasi) terintegrasi untuk mengumpulkan data yang akurat, dapat dipertanggung jawabkan dan terjaga kerahasiaannya (misal: Sistem Informasi Manajemen Perguruan Tinggi/ SIMPT).', 88, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(346, '12.3', 'Ketersediaan Sistem TIK (Teknologi Informasi dan Komunikasi) untuk mengelola dan menyebarkan ilmu pengetahuan (misal: Sistem Informasi Pendidikan/Pembelajaran, Sistem Informasi Penelitian dan PkM, Sistem Informasi Perpustakaan, dll)', 88, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(347, '1.1', 'Tersedia penetapan pedoman/standar kearsipan dinamis untuk kegiatan penciptaan, pemberkasan, penggunaan dan pemeliharaan, serta penyusutan arsip. Pedoman/standar kearsipan yang diperlukan adalah tata naskah dinas, klasifikasi arsip, jadwal retensi arsip (JRA), sistem klasifikasi keamanan dan akses arsip, dan program arsip vital', 89, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(348, '1.2', 'Tersedia penetapan pedoman/standar kearsipan statis untuk kegiatan akuisisi, pengolahan, preservasi, akses dan layanan arsip statis. Pedoman/standar kearsipan yang diperlukan adalah pedoman akuisisi, standar deskripsi, pedoman pengolahan, pedoman preservasi, pedoman akses dan layanan arsip statis.', 89, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(349, '2.1', 'Tersedia bukti penciptaan arsip yang meliputi:\na. pembuatan arsip\nb. penerimaan arsip\nc. Registrasi arsip\nd. pendistribusian arsip', 90, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(350, '2.2', 'Tersedia bukti penggunaan dan pemeliharaan arsip yang meliputi:\na. pemberkasan arsip aktif\nb. penataan arsip inaktif\nc. pemeliharaan arsip\nd. alih media arsip\ne. penggunaan arsip', 90, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(351, '2.3', 'Tersedia bukti penyusutan arsip yang meliputi:\na. Pemindahan arsip inaktif\nb. pemusnahan arsip\nc. penyerahan arsip statis', 90, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(352, '3.1', 'Tersedia bukti identifikasi arsip yang meliputi:\na. analisis organisasi\nb. pendataan  \nc. pengolahan hasil pendataan ', 91, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(353, '3.2', 'Tersedia bukti perlindungan dan keamanan arsip yang meliputi:\na. membuat duplikasi dan dispersal\nb. memiliki peralatan khusus \nc. penyimpanan arsip vital yang aman ', 91, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(354, '3.3', 'Tersedia bukti penyelamatan dan pemulihan yang meliputi:\na. penyelamatan dari bencana besar\nb. pemulihan \nc. penyimpanan kembali\nd. evaluasi', 91, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(355, '4.1', 'Tersedia bukti pengelolaan arsip aktif berdasarkan klasifikasi \narsip perguruan tinggi yang meliputi pemeriksaan kelengkapan arsip (inspection), pemberian indeks (indexing), pemberian kode arsip (coding), tunjuk silang (cross reference), penyortiran (sorting), pelabelan (labeling), dan penyimpanan (filling).', 92, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(356, '5.1', 'Ada bukti dilaksanakannya pelaporan arsip terjaga paling lama 1 (satu) tahun sejak terjadinya kegiatan', 93, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(357, '5.2', 'Ada bukti Pelaporan disampaikan dalam bentuk daftar arsip terjaga  yang sekurang-kurangnya memuat: nama pencipta, nomor,  kode klasifikasi, uraian isi informasi, tahun, media, jumlah, tingkat keaslian, dan kondisi arsip', 93, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(358, '5.3', 'Ada bukti pembaruan data laporan arsip terjaga di ANRI dilakukan oleh \nunit kearsipan bersama dengan unit pengolah yang terkait di \nANRI', 93, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(359, '6.1', 'Ada bukti penyampaian arsip terjaga kepada ANRI dalam bentuk  salinan autentik dari naskah asli arsip terjaga, paling lama  satu tahun setelah dilakukan pelaporan kepada ANRI.', 94, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(360, '6.2', 'Ada bukti dokumentasi penyerahan salinan autentik dari naskah asli \narsip terjaga kepada ANRI', 94, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(361, '7.1', 'Tersedia bukti pengelolaan arsip statis di lingkungna perguruan tinggi yang terdiri dari\n1. Akuisisi arsip statis\n2. Pengelolaan Arsip Statis\n3. Preservasi Arsip Statis\n4. Akses dan layanan arsip statis', 95, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(362, '8.1', 'Ada bukti sahih susunan penyelenggara kearsipan PNJ yang memuat tugas, fungsi, dan wewenang; ', 96, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(363, '8.2', 'Ada bukti penyelenggaraan dan evaluasi penyelenggara kearsipan telah melaksanakan pekerjaan sesuai tugas, fungsi, dan kewenangannya.', 96, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(364, '8.3', 'Ada bukti unit kearsipan melaksanakan pengelolaan arsip \ninaktif yang memiliki retensi di bawah 10 (sepuluh) tahun dari unit \npengolah/unit kerja, dan pembinaan kearsipan di lingkungannya', 96, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(365, '8.4', 'Ada bukti unit kearsipan melaksanakan pengelolaan arsip inaktif yang memiliki retensi sekurang-kurangnya 10 (sepuluh) tahun yang berasal dari satuan kerja di lingkungan perguruan tinggi.', 96, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(366, '9.1', 'Jumlah arsiparis profesional yang memiliki sertifikat keahlian profesi dan \npengalaman bekerja di bidang kearsipan untuk melaksanakan \npengelolaan arsip dinamis pada unit pengolah, unit kearsipan, dan LKPT minimal 5', 97, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(367, '9.2', 'Ada bukti staf administrasi memiliki sertifikat keahlian teknis, termasuk pemrosesan kata (word) dan manajemen basis data.', 97, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(368, '9.3', 'Tersedia prasarana kearsipan untuk mendukung pengelolaan arsip dinamis dan arsip statis:\na. Ruangan untuk menyimpan arsip aktif (central file) pada unit \npengolah/satuan kerja di lingkungan perguruan tinggi;\nb. Gedung untuk mengelola arsip inaktif yang memiliki retensi di \nbawah 10 (sepuluh) tahun (records center);\nc. Gedung untuk mengelola arsip inaktif yang memiliki retensi \nsekurang-kurangnya 10 (sepuluh) tahun (records center);\nd. Gedung/ruangan untuk mengelola arsip statis (depot) pada LKPT;\ne. Ruangan, gedung, dan depot arsip harus dirancang secara \nkhusus tahan-api dan dilengkapi dengan pendeteksi panas/api \nserta sistem pemadaman, termasuk detektor asap dan panas dan alat pemadam kebakaran; \nf. Ruangan, gedung, dan depot dipelihara dengan baik, stabilitas temperatur dan kelembapan udara diatur sesuai dengan jenis dan media rekam arsip;\ng. Gedung/ruangan untuk mengelola arsip inaktif (pusat \narsip/records center) dan gedung/ruangan untuk mengelola arsip statis (depot) harus memiliki akses ruangan yang memadai untuk membawa muatan dan elevator sesuai kebutuhan, serta didukung dengan sistem jaringan informasi dan komunikasi.', 97, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(369, '9.4', 'Tersedia sarana kearsipan untuk mendukung pengelolaan arsip \ndinamis dan arsip statis, antara lain:\na. Filing kabinet, rak, dan lemari arsip (tidak bergerak, bergerak)\nb. Komputer, pemroses words, printer, mesin fotokopi, dan peralatan elektronik lain sesuai kebutuhan;\nc. Folder, boks, atau tempat lainnya yang sesuai untuk memelihara arsip dinamis dan preservasi jangka panjang arsip statis;\nd. Alat tulis kantor yang standard;\ne. Mesin untuk mengolah arsip audio visual (video, audio, film, \nmicrofilm) player;\nf. Mesin untuk mengevaluasi dan memelihara arsip audio visual \n(video, audio, film, microfilm);\n', 97, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(370, '9.5', 'Tersedia sistem informasi kearsipan yang mudah diakses dan cepat dalam menemukenali dokumen;', 97, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(371, '9.6', 'Ada bukti evaluasi terkait sumber daya yang memadai yang dilakukan secara rutin dan hasilnya dilaporkan kepada pimpinan serta ditindaklanjuti.', 97, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(372, '10.1', 'Tersedia pendanaan dalam rangka penyelenggaraan kearsipan yang diselenggarakan oleh perguruan tinggi, dialokasikan dalam anggaran pendapatan dan belanja negara (APBN), bantuan luar negeri, dan partisipasi masyarakat/alumni', 98, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(373, '10.2', 'Tersedia pendanaan kearsipan meliputi pendanaan untuk perumusan dan penetapan kebijakan, pembinaan kearsipan, pengelolaan arsip, pengembangan sumber daya manusia, penyediaan prasarana dan sarana, pelindungan dan penyelamatan arsip akibat bencana (pencegahan, penyelamatan, dan pemulihan), serta sosialisasi.\n', 98, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(374, '1.1', 'Jumlah dosen dan tendik yang terlibat dalam kerja sama >25%', 99, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(375, '1.2', 'Rasio SDM unit pengelola kemitraan dengan jumlah dokumen kerjasama aktif ≤ 1:20', 99, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(376, '2.1', 'Memadai dan mutakhir', 100, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(377, '3.1', 'anggaran kemitraan tahunan dibagi total anggaran PTV = (> 6%)', 101, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(378, '4.1', 'Sangat visioner dan memiliki visi yang jelas dan terukur', 102, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(379, '4.2', 'Sangat tinggi', 102, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(380, '4.3', 'Terdapat target kinerja kemitraan yang jelas dalam perjanjian kinerja pimpinan dan pimpinan unit', 102, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(381, '4.4', 'Pimpinan melakukan kegiatan pemantauan dan pengawasan secara periodik (3 bulan sekali)\n', 102, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(382, '5.1', 'Kemitraan tercantum pada seluruh komponen renstra', 103, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(383, '5.2', 'Lebih dari 90% kerja sama memiliki MoU/MoA/PKS', 103, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(384, '5.3', 'Terdapat Rencana kerja tahunan kemitraan yang lengkap mencakup program, anggaran, dan target kinerja (KPI/OKR)\n', 103, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(385, '5.4', 'Ada unit kemitraan yang berada di level setara Wadir khusus Kerjasama', 103, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(386, '6.1', 'Terdapat kebijakan dan aturan yang jelas terkait kemitraan di PTPPV', 104, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(387, '6.2', 'Memiliki pedoman/SOP kemitraan yang lengkap mulai perencanaan hingga monitoring evaluasi', 104, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(388, '7.1', 'Sangat banyak\n', 105, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(389, '7.2', '>10% mitra memiliki cakupan global atau internasional', 105, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(390, '7.3', '100% Prodi memiliki kerja sama', 105, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(391, '7.4', 'Setiap prodi di PTPPPV memiliki minimal 10 kerja sama aktif', 105, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(392, '7.5', '>70%', 105, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(393, '8.1', '>100% jumlah PKS/MoA/IA sesuai dengan target rencana kerjasama', 106, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(394, '8.2', 'Sudah ada aktivitas pembinaan hubungan kemitraan yang direncanakan secara bersama dengan mitra', 106, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(395, '8.3', '100% pelaksanaan kemitraan sesuai PKS', 106, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(396, '8.4', 'Terdapat target dan pengukuran kinerja secara berkala dari setiap kerjasama', 106, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(397, '9.1', 'Jumlah dokumen kerjasama aktif dalam setahun > 100', 107, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(398, '9.2', 'Persentase dokumen kerja sama dibanding total dokumen kerja sama >80%', 107, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(399, '10.1', '>100% target pada rencana kerja di dalam dokumen kerjasama tercapai', 108, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(400, '10.2', 'Persentase jumlah mata kuliah inti selaras industri dibandingkan total mata kuliah inti >80%', 108, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(401, '10.3', 'Persentase jumlah mata kuliah berbasis PBL\ndibandingkan total mata kuliah inti >15%', 108, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(402, '10.4', 'Memiliki > 2 TEFA', 108, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(403, '10.5', 'Jumlah dosen praktisi dibanding total seluruh dosen >30%', 108, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(404, '10.6', 'Terdapat > 2 kelas industri per tahun', 108, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(405, '10.7', 'Persentase jumlah mahasiswa magang hasil dari kerja sama dibanding total seluruh mahasiwa >50%', 108, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(406, '10.8', 'Terdapat lebih dari 2 dosen magang di industri per tahun', 108, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(407, '11.1', 'Persentase jumlah lulusan tersertifikasi hasil dari kerja sama dibanding total seluruh\nmahasiswa >10%', 109, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(408, '11.2', 'Persentase jumlah dosen tersertifikasi hasil dari kerja sama dibanding total seluruh mahasiswa >10%', 109, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(409, '11.3', 'Jumlah peserta pelatihan yang diselenggarakan bersama DUDI\n>50 orang per tahun', 109, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(410, '11.4', 'Terdapat >10 hasil riset terapan yang diselenggarakan bersama DUDI dalam 1 tahun', 109, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(411, '11.5', 'Persentase jumlah lulusan yang terserap DUDI berdasarkan kerja sama yang dilakukan dibanding total lulusan >30%', 109, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(412, '11.6', 'Jumlah mahasiswa yang mendapat beasiswa dari DUDI > 30 per tahun', 109, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(413, '11.7', 'Total valuasi dari CSR DUDI >500\njuta per tahun', 109, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(414, '12.1', 'Persentase jumlah perpanjangan/addendum MoU/PKS dibandingkan MoU/PKS yang akan/telah kadaluwarsa\n>30%', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(415, '12.2', 'Valuasi Rupiah pembiayaan industri untuk Mata kuliah berbasis Project based learning (PjBL)', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(416, '12.3', 'Valuasi rupiah nilai omset\nTEFA', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(417, '12.4', 'Valuasi dosen/tenaga ahli dari DUDI (honor pengajar per sesi sesuai standar SBM (jumlah sesi/jam pelajaran x Rp 900 ribu)', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(418, '12.5', 'Valuasi rupiah pembiayaan\nDUDI untuk kelas industri (UKT per tahun)', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(419, '12.6', 'Valuasi honor magang dari\nDUDI, atau menggunakan\nMSIB Rp 4 juta/mahasiswa/bulan', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(420, '12.7', 'Valuasi honor dosen\nmagang atau sesuai SBU (Rp 6 juta/bulan.dosen)', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(421, '12.8', 'Valuasi jumlah lulusan yang memperoleh sertifikasi atau (Rp 500 ribu per mahasiswa)', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(422, '12.9', 'Valuasi dosen yang memperoleh sertifikasi kompetensi hasil kemitraan, (atau jumlah dosen x Rp 6 juta)', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(423, '12.10', 'Valuasi jumlah peserta pelatihan kerjasama dengan DUDI (atau menggunakan biaya pelatihan perorang berdasarkan LPDP Rp 6 juta per orang)', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(424, '12.11', 'Valuasi riset terapan yang dilakukan bersama DUDI (rupiah pembiayan riset)', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(425, '12.12', 'Valuasi jumlah beasiswa dari DUDI', 110, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(426, '13.1', 'Mencakup global (internasional)', 111, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(427, '14.1', 'Mencakup global (internasional)', 112, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(428, '14.2', 'Tinggi', 112, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(429, '14.3', 'Mencakup wilayah nasional', 112, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(430, '1.1', 'Jumlah dosen dan tendik yang terlibat dalam kerja sama >25%', 113, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(431, '1.2', 'Rasio SDM unit pengelola kemitraan dengan jumlah dokumen kerjasama aktif ≤ 1:20', 113, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(432, '2.1', 'Memadai dan mutakhir', 114, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(433, '3.1', 'anggaran kemitraan tahunan dibagi total anggaran PTV = (> 6%)', 115, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(434, '4.1', 'Sangat visioner dan memiliki visi yang jelas dan terukur', 116, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(435, '4.2', 'Sangat tinggi', 116, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(436, '4.3', 'Terdapat target kinerja kemitraan yang jelas dalam perjanjian kinerja pimpinan dan pimpinan unit', 116, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(437, '4.4', 'Pimpinan melakukan kegiatan pemantauan dan pengawasan secara periodik (3 bulan sekali)\n', 116, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(438, '5.1', 'Kemitraan tercantum pada seluruh komponen renstra', 117, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(439, '5.2', 'Lebih dari 90% kerja sama memiliki MoU/MoA/PKS', 117, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(440, '5.3', 'Terdapat Rencana kerja tahunan kemitraan yang lengkap mencakup program, anggaran, dan target kinerja (KPI/OKR)\n', 117, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(441, '5.4', 'Ada unit kemitraan yang berada di level setara Wadir khusus Kerjasama', 117, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(442, '6.1', 'Terdapat kebijakan dan aturan yang jelas terkait kemitraan di PTPPV', 118, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(443, '6.2', 'Memiliki pedoman/SOP kemitraan yang lengkap mulai perencanaan hingga monitoring evaluasi', 118, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(444, '7.1', 'Sangat banyak\n', 119, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(445, '7.2', '>10% mitra memiliki cakupan global atau internasional', 119, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(446, '7.3', '100% Prodi memiliki kerja sama', 119, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(447, '7.4', 'Setiap prodi di PTPPPV memiliki minimal 10 kerja sama aktif', 119, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(448, '7.5', '>70%', 119, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(449, '8.1', '>100% jumlah PKS/MoA/IA sesuai dengan target rencana kerjasama', 120, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(450, '8.2', 'Sudah ada aktivitas pembinaan hubungan kemitraan yang direncanakan secara bersama dengan mitra', 120, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(451, '8.3', '100% pelaksanaan kemitraan sesuai PKS', 120, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(452, '8.4', 'Terdapat target dan pengukuran kinerja secara berkala dari setiap kerjasama', 120, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(453, '9.1', 'Jumlah dokumen kerjasama aktif dalam setahun > 100', 121, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(454, '9.2', 'Persentase dokumen kerja sama dibanding total dokumen kerja sama >80%', 121, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(455, '10.1', '>100% target pada rencana kerja di dalam dokumen kerjasama tercapai', 122, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(456, '10.2', 'Persentase jumlah mata kuliah inti selaras industri dibandingkan total mata kuliah inti >80%', 122, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(457, '10.3', 'Persentase jumlah mata kuliah berbasis PBL\ndibandingkan total mata kuliah inti >15%', 122, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(458, '10.4', 'Memiliki > 2 TEFA', 122, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(459, '10.5', 'Jumlah dosen praktisi dibanding total seluruh dosen >30%', 122, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(460, '10.6', 'Terdapat > 2 kelas industri per tahun', 122, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(461, '10.7', 'Persentase jumlah mahasiswa magang hasil dari kerja sama dibanding total seluruh mahasiwa >50%', 122, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(462, '10.8', 'Terdapat lebih dari 2 dosen magang di industri per tahun', 122, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(463, '11.1', 'Persentase jumlah lulusan tersertifikasi hasil dari kerja sama dibanding total seluruh\nmahasiswa >10%', 123, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(464, '11.2', 'Persentase jumlah dosen tersertifikasi hasil dari kerja sama dibanding total seluruh mahasiswa >10%', 123, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(465, '11.3', 'Jumlah peserta pelatihan yang diselenggarakan bersama DUDI\n>50 orang per tahun', 123, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(466, '11.4', 'Terdapat >10 hasil riset terapan yang diselenggarakan bersama DUDI dalam 1 tahun', 123, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(467, '11.5', 'Persentase jumlah lulusan yang terserap DUDI berdasarkan kerja sama yang dilakukan dibanding total lulusan >30%', 123, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(468, '11.6', 'Jumlah mahasiswa yang mendapat beasiswa dari DUDI > 30 per tahun', 123, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(469, '11.7', 'Total valuasi dari CSR DUDI >500\njuta per tahun', 123, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(470, '12.1', 'Persentase jumlah perpanjangan/addendum MoU/PKS dibandingkan MoU/PKS yang akan/telah kadaluwarsa\n>30%', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(471, '12.2', 'Valuasi Rupiah pembiayaan industri untuk Mata kuliah berbasis Project based learning (PjBL)', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(472, '12.3', 'Valuasi rupiah nilai omset\nTEFA', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(473, '12.4', 'Valuasi dosen/tenaga ahli dari DUDI (honor pengajar per sesi sesuai standar SBM (jumlah sesi/jam pelajaran x Rp 900 ribu)', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(474, '12.5', 'Valuasi rupiah pembiayaan\nDUDI untuk kelas industri (UKT per tahun)', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(475, '12.6', 'Valuasi honor magang dari\nDUDI, atau menggunakan\nMSIB Rp 4 juta/mahasiswa/bulan', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(476, '12.7', 'Valuasi honor dosen\nmagang atau sesuai SBU (Rp 6 juta/bulan.dosen)', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00');
INSERT INTO `indikators` (`id`, `no`, `indikator`, `id_pernyataan`, `created_at`, `updated_at`) VALUES
(477, '12.8', 'Valuasi jumlah lulusan yang memperoleh sertifikasi atau (Rp 500 ribu per mahasiswa)', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(478, '12.9', 'Valuasi dosen yang memperoleh sertifikasi kompetensi hasil kemitraan, (atau jumlah dosen x Rp 6 juta)', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(479, '12.10', 'Valuasi jumlah peserta pelatihan kerjasama dengan DUDI (atau menggunakan biaya pelatihan perorang berdasarkan LPDP Rp 6 juta per orang)', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(480, '12.11', 'Valuasi riset terapan yang dilakukan bersama DUDI (rupiah pembiayan riset)', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(481, '12.12', 'Valuasi jumlah beasiswa dari DUDI', 124, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(482, '13.1', 'Mencakup global (internasional)', 125, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(483, '14.1', 'Mencakup global (internasional)', 126, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(484, '14.2', 'Tinggi', 126, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(485, '14.3', 'Mencakup wilayah nasional', 126, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(486, '1.1', 'Tersedia dokumen rumusan program/kegiatan berkelanjutan secara bertahap yang memuat indikator capaian yang ditargetkan akan dicapai pada kurun waktu tertentu;', 127, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(487, '1.2', 'Tersedia dokumen mekanisme kontrol ketercapaian/realisasi dan tindakan perbaikan untuk menjamin tahap-tahap pelaksanaan untuk merealisasikan program/kegiatan.', 127, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(488, '1.3', 'Ada bukti hasil evaluasi program/kegiatan sudah dilakukan secara berkala.', 127, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(489, '1.4', 'Ada bukti yang handal sebesar > 80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 127, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(490, '2.1', 'Ada bukti dokumen formal sistem pengelolaan manajemen SDM  yang mencakup:\n(1)	 perencanaan, \n(2)	 rekrutmen, seleksi, dan pemberhentian pegawai\n(3)	 orientasi dan penempatan pegawai, \n(4)	 pengembangan karir, \n(5)	 remunerasi, penghargaan, dan sanksi.', 128, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(491, '2.2', 'Ada bukti yang sahih dan handal tentang sistem pengelolaan SDM pada butir 2.1 telah dilaksanakan secara transparan, akuntabel berbasis pada meritokrasi serta konsisten setiap tahunnya.', 128, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(492, '3.1', 'Ada bukti struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab, serta ada bukti dilaksanankan dengan konsisten.', 129, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(493, '3.2', 'Ada bukti tugas, fungsi, wewenang, dan tanggung jawab telah dilaksanakan dengan konsisten.', 129, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(494, '4.1', 'Ada bukti dokumen perencanaan pengadaan pegawai paling sedikit memuat:\n1. Jumlah kebutuhan pegawai per tahun;\n2. Jadwal pengadaan pegawai yang sesuai dengan kebutuhan berdasarkan analisis jabatan;\n3. Prasarana dan sarana pengadaan pegawai.', 130, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(495, '4.2', 'Ada bukti pelaksanaan pengumuman lowongan jabatan secara terbuka kepada masyarakat yang memuat nama jabatan, jumlah lowongan jabatan, unit penempatan, kualifikasi, jadwal seleksi dan persyaratan.', 130, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(496, '4.3', 'Ada dokumen rencana pengembangan dosen dan tenaga kependidikan dengan proyeksi yang jelas dan terencana minimal untuk 5 tahun, dan dijadikan rujukan pengembangan SDM.', 130, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(497, '4.4', 'Ada bukti bahwa unit/bagian telah melaksanakan empat  upaya berikut sehingga dapat meningkatkan kualifikasi dan kompetensi pegawai;\n(1) kesempatan belajar studi lanjut/ pelatihan\n(2) pemberian fasilitas termasuk dana\n(3) jenjang karir yang jelas\n(4) studi banding\n', 130, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(498, '5.1', 'Tersedia dokumen prosedur yang lengkap terkait pelayanan terhadap civitas akademika.', 131, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(499, '5.2', 'Tersedia bukti sosialisasi prosedur layanan terhadap civitas akademika.', 131, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(500, '5.3', 'Tersedia bukti pelaksanaan layanan sesuai dengan prosedur', 131, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(501, '5.4', 'Tersedia bukti evaluasi layanan secara berkala', 131, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(502, '6.1', 'Rasio jumlah dosen tetap yang memenuhi persyaratan dosen (sudah serdos) terhadap jumlah program studi minimal 10:1\n\n', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(503, '6.2', 'Rasio jumlah dosen tetap terhadap jumlah mahasiswa maksimal 1:24', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(504, '6.3', 'Persentase dosen tidak tetap terhadap jumlah seluruh dosen maksimal 10%\n', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(505, '6.4', 'Persentase jumlah dosen yang memiliki sertifikat profesi dosen (serdos) terhadap jumlah seluruh dosen tetap minimal 85%', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(506, '6.5', 'Persentase jumlah dosen yang memiliki sertifikat kompetensi dan atau keahlian industri terhadap jumlah seluruh dosen tetap minimal 50%', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(507, '6.6', 'Persentase jumlah dosen yang memiliki jabatan fungsional minimal Lektor Kepala terhadap jumlah seluruh dosen tetap minimal 25%', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(508, '6.7', 'Persentase jumlah dosen yang berpendidikan S3 terhadap seluruh dosen tetap minimal 50%', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(509, '6.8', 'Rasio jumlah Pustakawan terhadap kualifikasinya (A) ≥ 4\n\nPerhitungan: A = (4X1 + 3X2 + 2X3)/4\n\nX1 = jumlah pustakawan yang berpendidikan S2/S3/Special Librarian.\nX2 = jumlah pustakawan yang berpendidikan D4 atau S1.\nX3 = jumlah pustakawan yang berpendidik-an D1, D2, atau D3.', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(510, '6.9', 'Laboran, teknisi, analis, operator, dan programer =\nJumlah cukup dan sangat baik kegiatannya.\n\nCatatan:\nAgar dibandingkan dengan kegiatan yang seharusnya dilakukan dalam perguruan tinggi yang bersangkutan.', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(511, '6.10', 'Tenaga administrasi = Jumlah cukup dan sangat baik kegiatannya.\n\n(Catatan: Agar dibandingkan dengan kegiatan yang seharusnya dilakukan dalam perguruan tinggi yang bersangkutan. Pertimbangkan aspek sistem IT yang dimiliki)', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(512, '6.11', 'Persentasi tendik yang berkualifikasi sarjana terhadap seluruh tenaga kependidikan minimal 50%', 132, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(513, '7.1', 'Tersedia Instrumen untuk mengukur kepuasan dosen, pustakawan, laboran, teknisi, dan tenaga administrasi, terhadap sistem pengelolaan sumber daya manusia, yang memiliki:\n(1) validitas,\n(2) reliabilitas, dan \n(3) mudah digunakan', 133, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(514, '7.2', 'Hasil survei kepuasan dosen, pustakawan, laboran, teknisi, dan tenaga administrasi terhadap sistem pengelolaan sumber-daya manusia yang:\n(1) jelas,\n(2) komprehensif, \n(3) mudah diakses oleh pemangku kepentingan, dan\n(4) sebesar > 80% menyatakan puas atas pelaksanaan sistem pengelolaan sumber daya manusia', 133, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(515, '7.3', 'Ada bukti pemanfaatan hasil survei dalam perbaikan yang berkelanjutan untuk mutu pengelolaan sumber daya manusia.', 133, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(516, '8.1', 'Terdapat bukti pengembangan dan pelaksanaan database pegawai yang terintegrasi.', 134, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(517, '8.2', 'Terdapat bukti pengembangan dan pelaksanaan sistem administrasi bidang kepegawaian berbasis ICT.', 134, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(518, '8.3', 'Terdapat bukti pengembangan dan pelaksanaan sistem reward and punishment berbasis kinerja.', 134, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(519, '9.1', 'Perencanaan dibuat sesuai Instruksi Menteri dengan tahapan berikut; Pengajuan Pegawai, Pembuatan HCDP, Usul Formasi CPNS sesuai hasil Analisa Beban Kerja dan Analisis Jabatan sebagai perhitungan keseimbangan antara ketersediaan dan kebutuhan pegawai.', 135, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(520, '9.2', 'Bagian/Jurusan/Unit mengajukan kebutuhan sesuai kualifikasi dan kompetensi SDM dengan mengsi Formulir Pengajuan Kebutuhan Pegawai', 135, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(521, '9.3', 'Usul Formasi (lowongan) 	Pegawai ke Kemenristekdikti dilaksanakan oleh Direktur sesuai dengan Pengajuan masing-masing Bagian/ Jurusan/Unit', 135, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(522, '9.4', 'Usulan formasi terlihat di Peta Jabatan sesuai Struktur Organisasi dan mengacu pada Analisis Jabatan, Analisa Beban Kerja Pegawai menyatu dalam Bezettingi (formasi)', 135, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(523, '10.1', 'Jabatan CPNS yang diusulkan sesuai klasifikasi formasi, jumlah jabatan yang lowong, dan proses perencanaan dilaksanakan dengan SOP', 136, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(524, '10.2', 'Realisasi usulan CPNS sesuai formasi (Bezetting) pelaksanaannya setiap penyelenggaraan rekrutmen dengan Instruksi Kemenristekdikti.', 136, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(525, '10.3', 'Usulan telah direvisi untuk penambahan formasi, diverifikasi Biro Kepegawaian dan disetujui oleh Menteri', 136, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(526, '15.1', 'Tersedia sistem pendaftaran secara online di web () Kemenristekdikti dan memuat petunjuk pelamaran CPNS', 137, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(527, '15.2', 'Sistem pendaftaran dikelola oleh Panselnas dengan dukungan Panitia Pelaksana di tingkat Institusi/Lembaga. ', 137, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(528, '15.3', 'Panitia Pelaksana dari Institusi/Lembaga yang ditunjuk oleh Panselnas', 137, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(529, '16.1', 'Tersedia dokumen lengkap Pelatihan Kompetensi Dasar, Daftar PNS sebagai peserta pelatihan, Sertifikat AA, Pekerti, dan Layanan Prima', 138, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(530, '16.2', 'Persentase tenaga kependidikan yang memiliki sertifikat layanan prima minimal 85%', 138, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(531, '16.3', 'Seluruh dosen telah mengikuti dan memiliki sertifikat PEKERTI-AA', 138, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(532, '17.1', 'Tersedia dokumen lengkap Usulan Kenaikan Pangkat, Sertifikat Pendidik Perhitungan Angka Kredit bagi Dosen/\nPLP/ Tenaga Fungsional tertentu', 139, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(533, '17.2', 'PNS yang disusulkan naik pangkat telah mengabdikan diri selama ≥ 2 tahun sejak TMT CPNS dan telah memiliki Sertifikat Pendidik', 139, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(534, '18.2', 'Tersedia dokumen lengkap Usulan Kenaikan Pangkat, Perhitungan Angka Kredit Form isian Kenaikan Pangkat, dan SOP', 140, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(535, '18.3', 'PNS menerima Surat Pemberitahuan Kenaikan Pangkat minimal 1 bulan sebelum Rapat Angka Kredit', 140, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(536, '18.4', 'Perhitungan angka kredit kenaikan pangkat dilakukan oleh PNS yang bersangutan secara online melalui Simpeg dan atau sistem informasi lain yang tersedia.', 140, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(537, '19.1', 'Tersedia dokumen lengkap Pedoman/SOP Kenaikan Pangkat, Perhitungan Angka Kredit, ususlan Kenaikan Pangkat Dosen/Tenaga Kependidikan', 141, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(538, '19.2', 'Angka kredit kenaikan pangkat Dosen Asisten Ahli ≤ 100 dan≤ 150, Lektor ≤ 200, ≤ 250 dan ≤ 300, Lektor Kepala ≤ 350, ≤ 400 dan ≤ 550', 141, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(539, '19.3', 'SK Kenaikan Pangkat Asisten hingga Lektor diterbitkan oleh Direktur≤ 1 minggu setelah kenaikan pangkat diputuskan dalam rapat Senat', 141, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(540, '19.4', 'Khusus Lektor Kepala Usulan kenaikan pangkat dikirim ke Kemenristekdikti untuk persetujuan dan penerbitan SK Kenaikan pangkatnya oleh Menteri', 141, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(541, '20.1', 'Tersedia dokumen pelaksanan pembinaan SDM; Daftar pelatihan/workshop, Surat Undangan, Data Pemateri/Penyelenggara, Daftar Hadir Pelaksanannya', 142, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(542, '20.2', 'Setiap Tenaga Kependidikan ≤ 2 tahun sekali mengikuti pelatihan/workshop untuk pengembangan keterampilan/kompetensi sesuai', 142, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(543, '20.3', 'Pelatihan/workshop yang diselenggarakan oleh PNJ wajib diikuti oleh Tenaga Kependidikan, atau sesuai undangan untuk penyelenggaraan Kementrian ristekdikti/Lembaga', 142, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(544, '21.1', 'Tersedia dokumen lengkap untuk Usulan Tugas/Ijin Belajar, Pedoman/SOP, Usulan, Data/Daftar Penerima Beasiswa atau Surat Pemberian Dana Bantuan Pendidikan, Surat Penyataan, Formulir Isian', 143, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(545, '21.2', 'Surat Tugas/Ijin Belajar berlaku ≤ 3 tahun untuk studi lanjut D4/S1/S2 bagi Tenaga Kependidikan, 5 tahun untuk studi lanjut S3 bagi Dosen dan dapat diperpanjang masa berlaku Tugas/Ijin jika diperlukan seusai kebijakan pimpinan.', 143, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(546, '21.3', 'Dana bantuan pendidikan untuk studi lanjut dapat diberikan degnan nominal dana bantuan ditetapkan melalui SK Direktur dan sesuai dengan jenjang pendidikan yang dilaksanakan PNS', 143, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(547, '22.1', 'Tersedia dokumen lengkap pemilihan Dosen atau Tenaga Kependidikan Berprestasi, Berkas Persyaratan, Usulan, Berkas Seleksi/ Pemilihan, dan Pemenang Kompetisi', 144, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(548, '22.2', 'Dosen/Tenaga Kependidikan dengan kriteria tertentu diusulkan oleh Bagian/Jurusan/Unit untuk mengikuti pemilihan tingkat Institusi', 144, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(549, '22.3', 'Penilaian 	Dosen/Tenaga Kependidikan Berprestasi melalui seleksi dan penilaian Panitia yang ditunjuk Pimpinan', 144, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(550, '23.1', 'Tersedia dokumen lengkap sesuai Pedoman/ SOP untuk Perhitungan Tunjamgan Kinerja Tenaga Kependidikan', 145, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(551, '23.2', 'Nominal Tunjangan kinerja diberikan tanpa pemotongan jika presentase kehadirannya minimal 95%', 145, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(552, '23.3', 'Tenaga Kependidikan diberi kesempatan kompensasi dengan menambah jam kerja, untuk keterlambatan kehadiran melebihi 15 menit dari pukul 08 00', 145, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(553, '24.1', 'Tersedia dokumen lengkap SOP pemberian sanksi atas pelanggaran larangan dan kewajiban, Surat Dugaan Pelanggaran, Undangan Rapat, Daftar Hadir Surat Pemberitahuan, Lembaga/Tim Kode Etik', 146, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(554, '24.2', 'Ada bukti SOP pada butir 24.1 telah dilaksanakan dengan tepat dan ditindaklanjuti.', 146, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(555, '25.1', 'Tersedia dokumen lengkap; Pedoman/SOP Cuti Pegawai, Form Isian Pengajuan Cuti, Surat Pemberitahuan, dan Surat Cuti', 147, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(556, '25.2', 'Ada bukti keterlaksanaan butir 25.1 telah berjalan sesuai prosedur dan ada bukti tindak lanjut.', 147, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(557, '26.1', 'Tersedia dokumen formil dan bukti lengkap; Pedoman/SOP Mutasi Pegawai, Form Isian Mutasi, Surat Pemberitahuan, dan Surat Mutasi', 148, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(558, '27.1', 'Tersedia Sistem Layanan Purnabakti PNS yang memuat aksebilitas; Form Usulan Usulan Pensiun dan Pedoman Masa\nPurnabakti, dan program persiapan masa pensiun, serta SOP Pensiun', 149, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(559, '27.2', 'Seluruh pegawai terdata di laman http//:simpeg.pnj.ac.id, termasuk memuat informasi pegawai yang akan pensiun.', 149, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(560, '27.3', 'Layanan Purnabakti Pegawai di PNJ dikelola oleh Pengolah Data Kepegawaian', 149, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(561, '28.1', 'Terdapat bukti dokumen perencanaan kegiatan persiapan mental pegawai menjelang pensiun yang memuat kegiatan sosialisasi dan pelatihan.', 150, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(562, '28.2', 'Terdapat bukti sahih kegiatan persiapan mental pegawai menjelang pensiun serta dievaluasi.', 150, '2024-12-24 03:05:29', '2024-12-24 03:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `instrumen_audits`
--

CREATE TABLE `instrumen_audits` (
  `id` bigint UNSIGNED NOT NULL,
  `deskripsi_temuan` text COLLATE utf8mb4_unicode_ci,
  `bukti` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akar_penyebab` text COLLATE utf8mb4_unicode_ci,
  `akibat` text COLLATE utf8mb4_unicode_ci,
  `temuan_audit` text COLLATE utf8mb4_unicode_ci,
  `rekomendasi_auditor` text COLLATE utf8mb4_unicode_ci,
  `penanggung_jawab` text COLLATE utf8mb4_unicode_ci,
  `rencana_perbaikan` text COLLATE utf8mb4_unicode_ci,
  `tanggapan_auditee` text COLLATE utf8mb4_unicode_ci,
  `jadwal_penyelesaian` date DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status_tercapai` bigint UNSIGNED DEFAULT NULL,
  `id_status_temuan` bigint UNSIGNED DEFAULT NULL,
  `id_status_akhir` bigint UNSIGNED DEFAULT NULL,
  `id_AMI` bigint UNSIGNED DEFAULT NULL,
  `id_indikator` bigint UNSIGNED DEFAULT NULL,
  `status_audit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'belum selesai',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instrumen_audits`
--

INSERT INTO `instrumen_audits` (`id`, `deskripsi_temuan`, `bukti`, `akar_penyebab`, `akibat`, `temuan_audit`, `rekomendasi_auditor`, `penanggung_jawab`, `rencana_perbaikan`, `tanggapan_auditee`, `jadwal_penyelesaian`, `link`, `id_status_tercapai`, `id_status_temuan`, `id_status_akhir`, `id_AMI`, `id_indikator`, `status_audit`, `created_at`, `updated_at`) VALUES
(1, 'Telah tersedia:   Program/Traget Ke-1 tentang capaian Tracer mengikuti IKU-1 Direktur. 2. Program Ke-2 tentang jumlah mahasiswa mengikuti PMW sesuai Renstra PNJ 2020--2024', 'https://s.pnj.ac.id/7fuvDG', 'Telah tersedia', 'Program berjalan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 85, 'belum selesai', '2024-12-26 21:46:45', '2025-01-01 19:47:51'),
(2, 'telah tersedia', 'https://s.pnj.ac.id/tKWEF9', 'telah tersedia', 'telah tersedia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 87, 'belum selesai', '2024-12-26 21:58:08', '2024-12-26 21:58:08'),
(3, 'Tersedia', 'https://s.pnj.ac.id/AQ8x6B', 'Tersedia', 'telah tersedia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 86, 'belum selesai', '2024-12-26 22:01:03', '2024-12-26 22:01:03'),
(4, 'Telah dilaksanakan; Pimpina menegaskan tupoksi unit dan pembagian tugas pada Tim UPA karir', 'https://s.pnj.ac.id/SLYysS', 'telah terlaksana dengan baik', 'Berjalan dengan efektif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 88, 'belum selesai', '2024-12-26 22:09:10', '2024-12-26 22:09:10'),
(5, 'istem pengelolaan fungsional dan operasional unit kerja mencakup fungsi pengelolaan (planning, organizing, actuating, dan controlling) yang dilaksanakan secara efektif untuk mewujudkan visi dan melaksanakan misi serta pencapaian tujuan institusi dilakanakan melalui koordinasi pada Grup WA UPA Karir setiap saat', 'https://s.pnj.ac.id/gHkXaF', 'Telah berjalan', 'Telah berjalan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 89, 'belum selesai', '2024-12-26 22:15:43', '2024-12-26 22:15:43'),
(6, 'Telah dilaksanakan dengan mengacu pada pembagian tugas dan komunikasi setiap saat, khususnya di Gurp WA', 'https://drive.google.com/drive/u/1/folders/14uI_e0oPLHpPnH5Yy7kwT4lSFIUzdBqr', 'Telah dilaksanakan', 'Telah dilaksanakan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 90, 'belum selesai', '2024-12-26 22:20:54', '2024-12-26 22:20:54'),
(7, 'Tersedia rencana IT berbentuk Roadmap dan Blueprint', 'https://drive.google.com/file/d/1Dinde3-VQ8Ac_wFdWYXut2e5V4uaCvAC/view?usp=drive_link', 'tidak ada', 'tidak ada', 'Terdapat blueprint IT PNJ yang disusun tahun 2021 lengkap dengan roadmap. Capaian/ realisasi dibuktikan dengan adanya laporan capaian kegiatan dan anggaran setiap tahun yang merujuk pada blueprint dan renstra PNJ.', 'Perlu dibuatkan dokumentasi perbaikan capaian setiap tahun yang lebih baik dari tahun sebelumnya. Sehingga jelas tahapan pengawasan dan perbaikannya.', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 2, 2, NULL, 6, 13, 'belum selesai', '2024-12-27 05:20:40', '2025-01-02 09:10:45'),
(8, 'Melalui SOTK Kemendikbud Nomor 60 Tahun 2022', 'https://drive.google.com/file/d/10uqeV1ZGv7C2BAT0MYj_3KtNNbU3LZTv/view?usp=sharing', 'Tidak ada', 'Tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 15, 'belum selesai', '2024-12-27 05:28:59', '2024-12-27 05:28:59'),
(9, 'UPATIK Memiliki berbagai macam layanan yang digunakan civitas akademika dan memiliki standar operasional prosedur dalam menjalankan layanannya', 'https://drive.google.com/drive/folders/1I9dqNphDl1kIV7hiHMiSlGEdW1RWmoFN?usp=sharing', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 19, 'belum selesai', '2024-12-27 05:39:31', '2024-12-27 05:39:31'),
(10, 'UPATIK Melaksanakan sosialisasi layanan dan prosedur lewat surat edaran dan web yang sering diakses civitas akademika', 'https://elearning.pnj.ac.id/', 'Tidak ada', 'Tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 20, 'belum selesai', '2024-12-27 05:41:20', '2024-12-27 05:41:20'),
(11, 'UPATIK memiliki website ticketing untuk kontrol layanan yang diberikan kepada civitas akademika agar sesuai prosedur', 'https://layanan.pnj.ac.id', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 21, 'belum selesai', '2024-12-27 05:42:49', '2024-12-27 05:43:42'),
(12, 'UPATIK menyediakan sistem informasi akademik (SI-ACADEMIA) untuk layanan akademik', 'https://academia.pnj.ac.id/', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 23, 'belum selesai', '2024-12-27 05:46:22', '2024-12-27 05:46:22'),
(13, 'UPATIK menyediakan kluster sistem informasi keuangan (Spirit Financia) yang berupa 3 sistem informasi yaitu, sianggar (perencanaan anggaran), siakun (akuntansi), sikeu (keuangan)', 'https://sikeu-financia.pnj.ac.id', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 24, 'belum selesai', '2024-12-27 05:50:35', '2024-12-27 05:50:35'),
(14, 'UPATIK menyediakan sistem informasi kepegawaian (Spirit Personalia)', 'https://personalia.pnj.ac.id/', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 25, 'belum selesai', '2024-12-27 06:00:08', '2024-12-27 06:00:08'),
(15, 'Saat ini pengelolaan asset sarpras menggunakan modul BMN yang merupakan bagian dari SI SAKTI milik Kementerian Keuangan. Namun modul tersebut hanya bisa diakses oleh staff bag. keuangan, dan staff bag. perlengkapan / asset', 'https://drive.google.com/file/d/1QuG0ETAwkYbWbQx7S6FbfGx0D4HQhxJ-/view?usp=sharing', 'Tidak ada', 'Tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 26, 'belum selesai', '2024-12-27 06:05:30', '2024-12-27 06:05:30'),
(16, 'Sistem Informasi Akademik, SDM sudah terintegrasi, namun SI Keuangan belum. Tersedia SI Dashboard untuk melihat data aggregat dari kedua aplikasi tersebut.', 'https://eis.pnj.ac.id/', 'Data dari SI Keuangan yang belum lengkap', 'Data keuangan tidak dapat terlihat dengan lengkap di SI Dashboard, dan hanya bisa dilihat di SI Keuangan sendiri.', 'Sistem Keuangan sudah ada hanya belum dimanfaatkan karena sudah ada sistem tetapi tidak membuka hak akses (sistem BLU dan sistem Kemendikbud)', 'Dari pusat harus ada kebijakan terkait sinkronisasi data pada sistem keuangan', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 27, 'belum selesai', '2024-12-27 06:08:48', '2025-01-02 02:47:02'),
(17, 'UPATIK memiliki blueprint pengembangan sistem informasi, data flow, dan otorisasi akses data, namun belum mencakup sistem disaster recovery', 'https://drive.google.com/file/d/1Dinde3-VQ8Ac_wFdWYXut2e5V4uaCvAC/view', 'Belum ada kebijakan BCP IT dan Disaster Recovery Plan', 'Keberlanjutan proses bisnis yang dilakukan dengan sistem IT yang terancam jika terjadi gangguan.', 'Blueprint sudah tersedia dengan lengkap dan blueprint akan diperbaharui pada tahun 2025.', 'Kebijakan untuk DRP dan BCP IT dirumuskan pada blueprint dan diajukan ke pimpinan. DRP dapat diprioritaskan untuk sistem/aplikasi penting bagi proses bisnis PNJ.', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 30, 'belum selesai', '2024-12-27 06:59:55', '2025-01-02 03:09:56'),
(18, 'Tersedia Sistem Informasi Penelitian (SIMLITMAS)', 'https://simlitmas.pnj.ac.id/', 'tidak ada', 'tidak ada', 'Tersedia sistem informasi penelitian dan pengabdian yang dikelola oleh P3M dan UPATIK. Pengelolaan utamanya dilakukan oleh P3M untuk mengembangkan sehingga UPATIK sulit untuk melakukan evaluasi, UPATIK sebagai pengelola infrastruktur.', 'Perlu dibuat kebijakan dan aturan pengisian form evaluasi layanan aplikasi/sistem. UPATIK dapat menghimbau untuk mengevaluasi aplikasi-aplikasi yang digunakan oleh sivitas akademik PNJ.', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 2, 2, NULL, 6, 32, 'belum selesai', '2024-12-27 07:00:55', '2025-01-02 03:22:44'),
(19, 'Tersedia sistem informasi katalog perpustakaan (OPAC)', 'https://opac.pnj.ac.id', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 33, 'belum selesai', '2024-12-27 07:04:10', '2024-12-27 07:04:10'),
(20, 'Tersedia sistem informasi LMS (e-Learning PNJ) yang dapat diakses oleh seluruh civitas akademika', 'https://elearning.pnj.ac.id/', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 36, 'belum selesai', '2024-12-27 07:24:02', '2024-12-27 07:24:02'),
(21, 'Tersedia LMS yang mendukung fitur grading. Namun presensi, berita acara perkuliahan, rekap nilai sudah tersedia di Sistem Akademik PNJ (Spirit Academia)', 'https://drive.google.com/file/d/1r-FGKELGvfC8J3fB7b3igzR2LPSeJu9L/view?usp=sharing', 'Tidak Ada', 'Tidak Ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 37, 'belum selesai', '2024-12-27 07:47:01', '2024-12-27 07:47:01'),
(22, 'Tersedia web portal PNJ yang mencakup profil institusi, jurusan dan program studi dan kegiatan kegiatan yang dilakukan di lingkungan institusi', 'https://pnj.ac.id/', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 39, 'belum selesai', '2024-12-27 07:48:20', '2024-12-27 07:48:20'),
(23, 'Tersedia sistem informasi untuk data statistik yang mengumpulkan data agregat akademik', 'https://eis.pnj.ac.id', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 40, 'belum selesai', '2024-12-27 07:50:49', '2024-12-27 07:50:49'),
(24, 'Tersedia sistem informasi tracer study alumni', 'https://tracerstudy.pnj.ac.id', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 41, 'belum selesai', '2024-12-27 07:51:53', '2024-12-27 07:51:53'),
(25, 'Telah tersedia dokumen tersebut', 'https://drive.google.com/file/d/14-OvRqVqnv1Gdj0nX_982p0JxxPhpDJj/view?usp=drive_link', 'Telah dirumuskan', 'Telah ada program/kegiatan berkelanjutan', 'ada', '-', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/file/d/14-OvRqVqnv1Gdj0nX_982p0JxxPhpDJj/view?usp=drive_link', 2, 2, NULL, 3, 44, 'belum selesai', '2024-12-27 09:46:09', '2025-01-13 05:34:07'),
(26, 'Terdapat bukti handal pelaksanaan program/kegiatan terealisasi lebih dari 80%', 'https://drive.google.com/drive/folders/1XjHqEy_zMpZVfuiKEPWRCT6A8ifmnMlo?usp=drive_link', 'Pengurus LSP berkomitmen melaksanakan program/kegiatan, hanya kegiatan sertifikasi kompetensi mahasiswa yang tidak dilaksanakan oleh LSP PNJ karena terlambat mengajukan listensi LSP ke BNSP', 'LSP PNJ tidak dapat melaksanakan sertifikasi kompetensi untuk mahasiswa sehingga menggunakan LSP P3 yg berakibat mahalnya biaya sertifikasi', 'Bukti yang diberikan tidak spesifik', 'Memasukan bukti-bukti pada satu folder gdrive', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1XjHqEy_zMpZVfuiKEPWRCT6A8ifmnMlo', 2, 2, NULL, 3, 45, 'belum selesai', '2024-12-27 09:51:48', '2025-01-13 05:38:08'),
(27, 'Ada, antara lain prosedur pelayanan konsultasi karir', 'https://s.pnj.ac.id/zPMgZ3', 'untuk memudahkan pengguna layanan', 'Dengan ada prosedur, pelayanan berjalan lancar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 91, 'belum selesai', '2024-12-27 10:02:18', '2024-12-27 10:02:18'),
(28, 'Tersedia', 'https://s.pnj.ac.id/3Npzcn', 'Untuk meMudahkan pengguna', 'Dengan ada prosedur, pelayanan berjalan lancar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 92, 'belum selesai', '2024-12-27 10:03:49', '2025-01-02 03:51:33'),
(29, 'Tersedia layanan Konsultasi Karir=Prosedur dan Pelaporannya', 'https://s.pnj.ac.id/z3mRQr', 'telah tersedia', 'Layanan berjalan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 93, 'belum selesai', '2024-12-27 10:10:49', '2025-01-02 03:56:17'),
(30, 'Tersedia', 'https://s.pnj.ac.id/yWerQD', 'Diperlukan evaluasi', 'Pelaksanaan layanan lebih bak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 94, 'belum selesai', '2024-12-27 10:12:32', '2025-01-01 20:07:49'),
(31, 'Telah dilakukan dengan baik; capaian untuk lulusan 2023, 95% telah mengisinya', 'https://s.pnj.ac.id/S2yvA2', 'Pelacakan dilakukan secara terus menerus', 'Pelayakan dapat dilakukan dengan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 101, 'belum selesai', '2024-12-27 10:18:05', '2024-12-27 10:18:05'),
(32, 'Usul formasi disampaikan ke Biro SDM Kementerian', 'https://bit.ly/DDAMI_Kepegawaian24', 'penyampaian usul disampaikan dalam waktu yang terbatas', 'beberapa usulan khususnya untuk formasi tendik tidak disetujui', 'Sudah sesuai.', 'Bisa upload  buktinya', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 523, 'belum selesai', '2024-12-27 11:20:01', '2025-01-06 06:24:58'),
(33, 'pelaksanaan mengikuti jadwal yang telah ditetapkan, PNJ membuat pengumuman terkait formasi ASN PNJ', 'https://bit.ly/DDAMI_Kepegawaian24', '-', '-', 'Sudah sesuai', 'Bisa upload  buktinya', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 524, 'belum selesai', '2024-12-27 11:23:25', '2025-01-06 06:24:06'),
(34, 'Usul formasi disampaikan ke Biro SDM Kementerian', 'https://bit.ly/DDAMI_Kepegawaian24', 'penyampaian usul disampaikan dalam waktu yang terbatas', 'beberapa usulan khususnya untuk formasi tendik tidak disetujui', 'Sudah sesuai.', 'Bisa upload  buktinya', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 525, 'belum selesai', '2024-12-27 11:23:56', '2025-01-06 06:24:28'),
(35, 'Proses rekruitmen CPNS dilakukan secara terpusat oleh Panselnas Kemendikbudristek', 'https://casn.kemendikbud.go.id', 'Untuk mengurangi KKN dalam perekrutan CPNS', 'perekrutan ChPNS bebas dari KKN, transparan, dan terpusat', 'Sudah sesuai.', 'Bisa upload  buktinya', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 526, 'belum selesai', '2024-12-27 12:54:17', '2025-01-06 06:25:38'),
(36, 'Proses rekruitmen CPNS dilakukan secara terpusat oleh Panselnas Kemendikbudristek', 'https://casn.kemendikbud.go.id', 'Untuk mengurangi KKN dalam perekrutan CPNS', 'perekrutan ChPNS bebas dari KKN, transparan, dan terpusat', 'Sudah sesuai.', 'Linknya disesuaikan dengan surat dari institusi', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 527, 'belum selesai', '2024-12-27 12:54:44', '2025-01-06 06:28:54'),
(37, 'Proses rekruitmen CPNS dilakukan secara terpusat oleh Panselnas Kemendikbudristek', 'https://casn.kemendikbud.go.id', 'Untuk mengurangi KKN dalam perekrutan CPNS', 'perekrutan ChPNS bebas dari KKN, transparan, dan terpusat', 'Sudah sesuai. Namun perlu melampirkan SK Panitia', 'Melampirkan SK, surat undangan sebagai bukti pelaksanaan.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 528, 'belum selesai', '2024-12-27 12:55:28', '2025-01-06 06:33:35'),
(38, 'Untuk pelatihan AA dan pekerti bagi dosen di kelola oleh PPMPP, sedangkan pelatihan tendik berupa pelatihan pelayanan prima dikelola oleh Bidang Keuangan dan Umum', 'https://bit.ly/DDAMI_Kepegawaian24', 'peningkatan kompetensi dosen dan tendik', 'peningkatan layanan pada pengguna layanan', 'Data yang dimiliki bag. Kepegawaian hanya Tendik saja. Pelaksanaan Pelatihan Prima belum lengkap buktinya.', 'PPMP akan memberikan data pelatihan AA-Pekerti/ kecuali sertifikasi untuk Tendik.  Dapat segera melengkapi buktinya', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, 13, 529, 'belum selesai', '2024-12-27 12:58:57', '2025-01-06 06:45:25'),
(39, 'Untuk pelatihan AA dan pekerti bagi dosen di kelola oleh PPMPP, sedangkan pelatihan tendik berupa pelatihan pelayanan prima dikelola oleh Bidang Keuangan dan Umum', 'https://bit.ly/DDAMI_Kepegawaian24', 'peningkatan kompetensi dosen dan tendik', 'peningkatan layanan pada pengguna layanan', 'belum dihitung', 'Dihitung kembali jumlah tendik dan presentase yang memiliki sertifikat pelayanan prima apakah sudah mencapai 85%', 'KA Sumber Daya Manusia (SDM)', NULL, NULL, NULL, NULL, 2, 1, NULL, 13, 530, 'belum selesai', '2024-12-27 12:59:29', '2025-01-06 06:51:50'),
(40, 'Untuk pelatihan AA dan pekerti bagi dosen di kelola oleh PPMPP, sedangkan pelatihan tendik berupa pelatihan pelayanan prima dikelola oleh Bidang Keuangan dan Umum', 'https://bit.ly/DDAMI_Kepegawaian24', 'peningkatan kompetensi dosen dan tendik', 'peningkatan layanan pada pengguna layanan', 'Data belum lengkap', 'Diperlukan penyesuaian standar, mengingat dosen baru belum memiliki sertifikat AA_Pekerti', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, 13, 531, 'belum selesai', '2024-12-27 13:00:18', '2025-01-06 06:55:57'),
(41, 'Dosen yang akan mengusulkan kenaikan pangkat telah memenuhi angka kredit sesuai ketentuan yang berlaku', 'https://bit.ly/DDAMI_Kepegawaian24', 'masih terdapat dosen yang belum memiliki jabatan fungsional (masih berstatus tenaga pengajar)', 'kenaikan pangkat dosen menjadi terhambat', 'Bag. Kepegawaian tidak memiliki akses, hanya membantu dalam pembuatan AK dari SKP', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 532, 'belum selesai', '2024-12-27 13:03:41', '2025-01-06 06:59:30'),
(42, 'Dosen yang akan mengusulkan kenaikan pangkat telah memenuhi angka kredit sesuai ketentuan yang berlaku', 'https://bit.ly/DDAMI_Kepegawaian24', 'masih terdapat dosen yang belum memiliki jabatan fungsional (masih berstatus tenaga pengajar)', 'kenaikan pangkat dosen menjadi terhambat', 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 533, 'belum selesai', '2024-12-27 13:04:50', '2025-01-06 07:02:24'),
(43, 'Proses kenaikan pangkat untuk dosen saat ini mengikuti jadwal yang telah ditetapkan oleh Kementerian maupun BKN', 'https://bit.ly/DDAMI_Kepegawaian24', 'Kenaikan pangkat dosen terhambat', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 534, 'belum selesai', '2024-12-27 13:08:07', '2025-01-06 07:02:49'),
(44, 'Proses kenaikan pangkat untuk dosen saat ini mengikuti jadwal yang telah ditetapkan oleh Kementerian maupun BKN', 'https://bit.ly/DDAMI_Kepegawaian24', 'Kenaikan pangkat dosen terhambat', NULL, 'Kenaikan pangkat dosen terhambat.', 'Perlu ditingkatkan konsistensi dari dosen ybs .', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 535, 'belum selesai', '2024-12-27 13:09:01', '2025-01-06 07:08:33'),
(45, 'Proses kenaikan pangkat untuk dosen saat ini mengikuti jadwal yang telah ditetapkan oleh Kementerian maupun BKN', 'https://bit.ly/DDAMI_Kepegawaian24', 'Kenaikan pangkat dosen terhambat', NULL, 'Telah sesuai dengan kementerian dimana sudah by sistem (SISTER)', 'Perlu konsistensi', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 536, 'belum selesai', '2024-12-27 13:09:35', '2025-01-06 07:09:36'),
(46, 'Proses kenaikan pangkat untuk dosen saat ini mengikuti jadwal yang telah ditetapkan oleh Kementerian maupun BKN', 'https://bit.ly/DDAMI_Kepegawaian24', 'Kenaikan pangkat dosen terhambat', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 537, 'belum selesai', '2024-12-27 13:11:07', '2025-01-06 07:10:07'),
(47, 'Proses kenaikan pangkat untuk dosen saat ini mengikuti jadwal yang telah ditetapkan oleh Kementerian maupun BKN', 'https://bit.ly/DDAMI_Kepegawaian24', 'Kenaikan pangkat dosen terhambat', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 538, 'belum selesai', '2024-12-27 13:11:37', '2025-01-06 07:10:24'),
(48, 'Proses kenaikan pangkat untuk dosen saat ini mengikuti jadwal yang telah ditetapkan oleh Kementerian maupun BKN', 'https://bit.ly/DDAMI_Kepegawaian24', 'Kenaikan pangkat dosen terhambat', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 539, 'belum selesai', '2024-12-27 13:12:28', '2025-01-06 07:10:38'),
(49, 'Proses kenaikan pangkat untuk dosen saat ini mengikuti jadwal yang telah ditetapkan oleh Kementerian maupun BKN', 'https://bit.ly/DDAMI_Kepegawaian24', 'Kenaikan pangkat dosen terhambat', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 540, 'belum selesai', '2024-12-27 13:12:51', '2025-01-06 07:11:00'),
(50, 'telah disusun peraturan direktur terkait pengelolaan sdm', 'https://bit.ly/DDAMI_Kepegawaian24', 'untuk memberikan acuan atas pengelolaan sdm', '-', 'Kesulitan pengajuan penambahan SDM. Sistem pengembangan SDM : menggunakan sistem Spirit Personalia', 'Perlu pengembangan sistem akomodasi untuk SDM (Spirit Personalia)', 'KA Sumber Daya Manusia (SDM)', NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 490, 'belum selesai', '2024-12-27 13:14:41', '2025-01-06 05:52:34'),
(51, 'proses rekruitmen pegawai ASN mengikuti jadwal yang telah ditetapkan oleh Panselnas Kemendikbud, pengajuan usulan pensiun pegawai, penugasan pegawai dalam bentuk ST untuk pengembangan karir, proses SK terkait penerima tunjangan serdos dan tukin tendik, pemberian sanksi atas keterlambatan penyelesaian tugas belajar.', 'https://bit.ly/DDAMI_Kepegawaian24', '-', '-', 'Telah terdapat bukti melalui pengumuman pembukaan formasi dan link pendaftaran terpusat pada link CASSN', 'Sudah seuai', 'KA Sumber Daya Manusia (SDM)', NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 491, 'belum selesai', '2024-12-27 13:15:12', '2025-01-06 05:55:25'),
(52, 'Untuk peningkatan kompetensi tenaga kependidikan dengan mengikuti pelatihan/workhsop yang diselenggarakan oleh kementerian maupun internal PNJ', 'https://bit.ly/DDAMI_Kepegawaian24', 'peningkatan kompetensi tenaga kependidikan', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 541, 'belum selesai', '2024-12-27 13:18:20', '2025-01-06 07:14:59'),
(53, 'Peningkatan kompetensi tenaga kependidikan melalui pelatihan/workshop', 'https://bit.ly/DDAMI_Kepegawaian24', 'perkembangan teknologi dan tuntutan dalam pelayanan', NULL, 'Kurang dari 2 tahun, belum tentu setiap tendik mengikuti kegiatan tersebut, Data belum ada', 'melengkapi data dari Jurusan dan membuat mekanisme yang jelas sehingga data bisa terintegrasi.', 'KA Sumber Daya Manusia (SDM)', NULL, NULL, NULL, NULL, 2, 1, NULL, 13, 542, 'belum selesai', '2024-12-27 13:20:56', '2025-01-06 07:14:40'),
(54, 'Untuk peningkatan kompetensi tenaga kependidikan dengan mengikuti pelatihan/workhsop yang diselenggarakan oleh kementerian maupun internal PNJ', 'https://bit.ly/DDAMI_Kepegawaian24', 'perkembangan teknologi dan tuntutan dalam pelayanan', NULL, 'Sudah sesuai.', 'sudah sesuai. melengkapi bukti dokumen', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 543, 'belum selesai', '2024-12-27 13:22:24', '2025-01-06 07:15:40'),
(55, 'Dalam rangka pengembangan dosen melalui studi lanjut, telah diusulkan ke Kementerian terkait usulan tugas belajar untuk pegawai yang studi lanjut', 'https://bit.ly/DDAMI_Kepegawaian24', 'pemenuhan kebutuhan dosen S3', NULL, 'Saat ini tidak ada ijin belajar tapi tugas belajar untuk dosen saja.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 544, 'belum selesai', '2024-12-27 13:25:09', '2025-01-06 07:17:28'),
(56, 'Dalam rangka pengembangan dosen melalui studi lanjut, telah diusulkan ke Kementerian terkait usulan tugas belajar untuk pegawai yang studi lanjut', 'https://bit.ly/DDAMI_Kepegawaian24', 'pemenuhan kebutuhan dosen S3', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 545, 'belum selesai', '2024-12-27 13:26:11', '2025-01-06 07:17:57'),
(57, 'Dana bantuan pendidikan untuk studi lanjut pernah menjadi temuan BPK, utk studi lanjut arahan dari kementerian untuk menggunakan mekanisme beasiswa. Bantuan yang diberikan oleh PNJ berupa biaya untuk penelitian/riset.', 'https://bit.ly/DDAMI_Kepegawaian24', 'pemenuhan kebutuhan dosen S3', NULL, 'Saat ini sudah tidak diperbolehkan', 'tidak bisa dilaksanakan karena menyalahi aturan.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 546, 'belum selesai', '2024-12-27 13:26:53', '2025-01-06 07:18:37'),
(58, 'Penghitungan tunjangan kinerja tenaga kependidikan meliputi komponen kehadiran (bobot 40%), komponen kinerja (60%)', 'https://bit.ly/DDAMI_Kepegawaian24', 'untuk memberikan penduan dalam penilaian maka ketentuan penghitungan tunjangan kinerja mengikuti ketentuan yang berlaku', '-', 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 550, 'belum selesai', '2024-12-27 13:31:41', '2025-01-06 07:18:54'),
(59, 'ya, dengan memberikan surat edaran terkait kehadiran', 'https://bit.ly/DDAMI_Kepegawaian24', '-', '-', 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 552, 'belum selesai', '2024-12-27 13:32:39', '2025-01-06 07:19:48'),
(60, 'Penghitungan tunjangan kinerja tenaga kependidikan meliputi komponen kehadiran (bobot 40%), komponen kinerja (60%)', 'https://bit.ly/DDAMI_Kepegawaian24', 'untuk memberikan penduan dalam penilaian maka ketentuan penghitungan tunjangan kinerja mengikuti ketentuan yang berlaku', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 551, 'belum selesai', '2024-12-27 13:37:46', '2025-01-06 07:19:58'),
(61, 'Pelanggaran atas disiplin dengan mengacu kepada Peraturan Pemerintah terkait Disiplin PNS', 'https://bit.ly/DDAMI_Kepegawaian24', 'Untuk memberikan efek jera', '-', 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, 13, 553, 'belum selesai', '2024-12-27 13:41:49', '2025-01-06 07:20:39'),
(62, 'Pelanggaran atas disiplin dengan mengacu kepada Peraturan Pemerintah terkait Disiplin PNS', 'https://bit.ly/DDAMI_Kepegawaian24', 'Untuk memberikan efek jera', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 554, 'belum selesai', '2024-12-27 13:43:38', '2025-01-06 07:21:09'),
(63, 'Pemberian cuti kepada para pegawai mengikuti ketentuan yang berlaku', 'https://bit.ly/DDAMI_Kepegawaian24', 'untuk memberikan kepastian akan hak cuti pegawai', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 555, 'belum selesai', '2024-12-27 13:45:02', '2025-01-06 07:21:21'),
(64, 'Pemberian cuti kepada para pegawai mengikuti ketentuan yang berlaku', 'https://bit.ly/DDAMI_Kepegawaian24', 'untuk memberikan kepastian akan hak cuti pegawai', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 556, 'belum selesai', '2024-12-27 13:45:49', '2025-01-06 07:22:33'),
(65, 'Mutasi dosen/tenaga kependidikan mengikuti ketentuan yang berlaku dengan menyampaikan usulan mutasi ke kementerian', 'https://bit.ly/DDAMI_Kepegawaian24', 'untuk memberikan panduan proses mutasi dosen/tenaga kependidikan', NULL, 'Tidak ada yang mutasi dari dan ke PNJ', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 557, 'belum selesai', '2024-12-27 13:48:08', '2025-01-06 07:25:24'),
(66, 'Usul pensiun pegawai dilakukan satu tahun sebelum tanggal pensiun pegawai ybs, menyampaikan dalam bentuk surat ke pegawai yang akan pensiun', 'https://bit.ly/DDAMI_Kepegawaian24', 'SK pensiun diterbitkan oleh Kementerian membutuhkan waktu yang cukup lama', NULL, 'Menggunakan aplikasi dari BKN.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 558, 'belum selesai', '2024-12-27 13:49:41', '2025-01-06 07:25:54'),
(67, '-', 'https://bit.ly/DDAMI_Kepegawaian24', '-', NULL, 'Tersedia dalam simpeg.PNJ namun belum di spirit personalia', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 559, 'belum selesai', '2024-12-27 13:50:05', '2025-01-06 07:27:56'),
(68, 'ya, kepegawaian menyiapkan seluruh dokumen yang diperlukan sebagai syarat usulan pensiun', 'https://bit.ly/DDAMI_Kepegawaian24', 'SK pensiun diterbitkan oleh Kementerian membutuhkan waktu yang cukup lama', '-', 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 560, 'belum selesai', '2024-12-27 13:50:40', '2025-01-06 07:30:59'),
(69, 'Bagi pegawai yang akan memasuki masa pensiun diberikan pelatihan masa persiapan pensiun', 'https://bit.ly/DDAMI_Kepegawaian24', 'persiapan mental pegawai menjelang pensiun', NULL, 'Terdapat pelatihan bagi pegawai/dosen yang akan pensiun', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 561, 'belum selesai', '2024-12-27 13:52:38', '2025-01-06 07:32:44'),
(70, 'Bagi pegawai yang akan memasuki masa pensiun diberikan pelatihan masa persiapan pensiun', 'https://bit.ly/DDAMI_Kepegawaian24', 'persiapan mental pegawai menjelang pensiun', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 562, 'belum selesai', '2024-12-27 13:53:09', '2025-01-06 07:33:45'),
(71, 'penetepan SOTK oleh kementerian dengan ditetapkannya Permendikbudristek tentang OTK PNJ', 'https://bit.ly/DDAMI_Kepegawaian24', 'memberikan kejelasan tentang koordinasi dalam pelaksanaan tugas', NULL, 'Kesulitan pengajuan penambahan SDM. Sistem pengembangan SDM : menggunakan sistem Spirit Personalia', 'Perlu pengembangan sistem akomodasi untuk SDM (Spirit Personalia)', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 492, 'belum selesai', '2024-12-27 13:54:49', '2025-01-06 06:16:14'),
(72, 'penetepan SOTK oleh kementerian dengan ditetapkannya Permendikbudristek tentang OTK PNJ', 'https://bit.ly/DDAMI_Kepegawaian24', 'memberikan kejelasan tentang koordinasi dalam pelaksanaan tugas', NULL, 'Sudah sesuai.', 'Perlu penjelasan yang lebih rinci, terlebih untuk struktur organisasi bagian kepegawaiannya.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 493, 'belum selesai', '2024-12-27 13:55:18', '2025-01-06 06:17:30'),
(73, 'rencana pengembangan dosen dan tenaga kependidikan tercantum dalam dokumen HCDP/human capital development plan', 'https://bit.ly/DDAMI_Kepegawaian24', 'untuk memberikan arah pengembangan dosen dan tenaga kependidikan', NULL, 'Sudah sesuai.', 'sudah sesuai', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 13, 496, 'belum selesai', '2024-12-27 13:59:01', '2025-01-06 06:18:05'),
(74, 'Telah dilaksanakan, didokumentasikan, dan disosialisasikan: ada Perdir dan Pedoman', 'https://s.pnj.ac.id/9DbGgy', 'Tracer merupakan tigas pokok', 'Dapat dilaksanakan dengan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 5, 95, 'belum selesai', '2024-12-27 23:04:10', '2025-01-02 03:59:27'),
(75, 'Telah dilaksanakan', 'https://s.pnj.ac.id/8LLbZc', 'Ini, merupakan tugas utama UPA Karir', 'Berjalan dengan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 5, 96, 'belum selesai', '2024-12-27 23:10:10', '2024-12-27 23:10:10'),
(76, 'Ada', 'https://s.pnj.ac.id/v86L9n', '-', 'Berjalan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 5, 97, 'belum selesai', '2024-12-27 23:14:47', '2024-12-27 23:14:47'),
(77, 'Tersedia', 'https://s.pnj.ac.id/rFLTNN', 'Tersedia', 'Terlaksana dengan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 5, 98, 'belum selesai', '2024-12-27 23:21:05', '2024-12-27 23:21:05'),
(78, 'Telah di up load', 'https://s.pnj.ac.id/XNGFP3', 'Merupakan kewajiban up load ke Web Dikti', 'berjalan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 5, 99, 'belum selesai', '2024-12-27 23:27:24', '2024-12-27 23:27:24'),
(79, 'Secara Berkala disampaikan ke Grup Pimpinan', 'https://s.pnj.ac.id/8LLbZc', 'Telah Dilaksanakan', 'Telah dilaksanakan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 100, 'belum selesai', '2024-12-27 23:30:07', '2025-01-01 20:16:19'),
(80, 'Terdapat dokumen SOTK beserta tupoksi dan wewenang yg telah ditetapkan', 'https://lsp.pnj.ac.id/readmore/62d4e48819057aa1a0085b12/profil-lsp', 'Komitmen mengikuti panduan dan standar BNSP', 'Tupoksi dan wewenang LSP menjadi jelas', 'ada', '-', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://lsp.pnj.ac.id/readmore/62d4e48819057aa1a0085b12/profil-lsp', 2, 2, NULL, 3, 46, 'belum selesai', '2024-12-28 12:23:16', '2025-01-13 05:37:50'),
(81, 'Terdapat dokumen SOTK lengkap dengan tugas, fungsi dan wewenang yang telah ditetapkan', 'https://lsp.pnj.ac.id/readmore/62d4e48819057aa1a0085b12/profil-lsp', 'Komitmen mengikuti panduan dan standar BNSP', 'Tupoksi dan wewenang LSP menjadi jelas', 'ada', 'website mohon untuk diupdate yang terbaru', NULL, NULL, NULL, NULL, 'https://lsp.pnj.ac.id/readmore/62d4e48819057aa1a0085b12/profil-lsp', 2, 2, NULL, 3, 47, 'belum selesai', '2024-12-28 12:24:37', '2025-01-13 05:39:43'),
(82, 'terdapat dokumen SOTK lengkap dengan tugas, fungsi dan wewenang yang telah ditetapkan', 'https://lsp.pnj.ac.id/readmore/62d4e48819057aa1a0085b12/profil-lsp', 'Komitmen mengikuti panduan dan standar BNSP', 'Tupoksi dan wewenang LSP menjadi jelas', 'ada', 'mohon diupdate terbaru', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://lsp.pnj.ac.id/readmore/62d4e48819057aa1a0085b12/profil-lsp', 2, 2, NULL, 3, 48, 'belum selesai', '2024-12-28 12:25:51', '2025-01-13 05:40:44'),
(83, 'Terdapat dokumen SOTK lengkap dengan tugas, fungsi dan wewenang yang telah ditetapkan', 'https://lsp.pnj.ac.id/readmore/62d4e48819057aa1a0085b12/profil-lsp', 'Komitmen mengikuti panduan dan standar BNSP', 'Tupoksi dan wewenang LSP menjadi jelas', 'ada', 'untuk diupate lagi', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://lsp.pnj.ac.id/readmore/62d4e48819057aa1a0085b12/profil-lsp', 2, 2, NULL, 3, 49, 'belum selesai', '2024-12-28 12:27:23', '2025-01-13 05:41:20'),
(84, 'Tersedia prosedur layanan', 'https://drive.google.com/drive/folders/19Ny7vM6YyPUJi6oNQreyk6lWaEv1lB01?usp=drive_link', 'Komitmen mengikuti panduan dan standar BNSP', 'SOP dayanan tersedia lengkap', 'ada', 'belum ada tanda tangan', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/19Ny7vM6YyPUJi6oNQreyk6lWaEv1lB01?usp=drive_link', 2, 2, NULL, 3, 50, 'belum selesai', '2024-12-28 12:29:22', '2025-01-13 05:42:25'),
(85, 'Sosialisasi layanan LSP kepada civitas akademika melalui website LSP', 'https://lsp.pnj.ac.id/readmore/62c7ca818b88f019ea0b9584/alur-pelaksanaan-uji-kompetensi', 'Komitmen memudahkan akses layanan', 'Pemberian layanan menjadi mudah diakses', 'Baru sebatas web resmi', '-', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://lsp.pnj.ac.id/readmore/62c7ca818b88f019ea0b9584/alur-pelaksanaan-uji-kompetensi', 2, 2, NULL, 3, 51, 'belum selesai', '2024-12-28 12:31:57', '2025-01-13 05:46:07'),
(86, 'Layanan telah disosialisasikan melalui website LSP PNJ', 'https://lsp.pnj.ac.id/readmore/62c7ca818b88f019ea0b9584/alur-pelaksanaan-uji-kompetensi', 'Komitmen memudahkan akses layanan', 'Pemberian layanan menjadi mudah diakses', 'Ada', 'Layanan telah sesuai dengan prosedur dengan bukti foto dan website lsp', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://lsp.pnj.ac.id/readmore/62c7ca818b88f019ea0b9584/alur-pelaksanaan-uji-kompetensi', 2, 2, NULL, 3, 52, 'belum selesai', '2024-12-28 12:33:18', '2025-01-13 05:53:48'),
(87, 'Prosedur layanan telah disosialisasikan melalui website LSP PNJ', 'https://lsp.pnj.ac.id/readmore/62c7ca818b88f019ea0b9584/alur-pelaksanaan-uji-kompetensi', 'Komitmen memudahkan akses layanan', 'Layanan mudah diakses', 'ada dalam bentuk rapat evalauasi dgn BNSP', '-', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://lsp.pnj.ac.id/readmore/62c7ca818b88f019ea0b9584/alur-pelaksanaan-uji-kompetensi', 2, 2, NULL, 3, 53, 'belum selesai', '2024-12-28 12:35:25', '2025-01-13 05:56:04'),
(88, 'Tahun 2024 telah disusun dan dikembangkan sebanyak 7 skema baru sesuai dengan kebutuhan kompetensi Program Studi', 'https://drive.google.com/drive/folders/1zE1CdKL8kjRAV9eHDjrK4fVGLMEYvnR5?usp=drive_link', 'Komitmen mengembangkan skema yang relevan dengan kebutuhan Program Studi', 'Terdapat 7 skema baru sesuai dengan kebutuhan kompetensi program studi', 'Tidak ada', 'Tersedia bukti sahih skema sertifikasi profesi yang sudah disusun dan dikembangkan sesuai dengan kebutuhan kompetensi masing-masiing prodi dan sudah disahkan oleh BNSP serta dapat dilaksanakan pada tahun 2025', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1zE1CdKL8kjRAV9eHDjrK4fVGLMEYvnR5', 2, 2, NULL, 3, 54, 'belum selesai', '2024-12-28 12:46:46', '2025-01-13 05:59:34'),
(89, 'tahun 2024 telah disusun dan dikembangkan sebanyak 7 skema baru sesuai dengan kebutuhan kompetensi Program Studi', 'https://drive.google.com/drive/folders/1zE1CdKL8kjRAV9eHDjrK4fVGLMEYvnR5?usp=drive_link', 'Komitmen mengembangkan skema yang relevan dengan kebutuhan Program Studi', 'terdapat 7 skema baru relevan tengan kebutuhan kompetensi program studi', 'belum ada rekapan skema dan prodinya', '-', NULL, NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1zE1CdKL8kjRAV9eHDjrK4fVGLMEYvnR5?usp=drive_link', 2, 1, NULL, 3, 55, 'belum selesai', '2024-12-28 12:48:51', '2025-01-13 06:01:42'),
(90, 'tahun 2024 telah disusun dan dikembangkan sebanyak 7 skema baru sesuai dengan kebutuhan kompetensi Program Studi', 'https://drive.google.com/drive/folders/1zE1CdKL8kjRAV9eHDjrK4fVGLMEYvnR5?usp=drive_link', 'komitmen mengembangkan skema sertifikasi sesuai kebutuhan kompetensi program studi', 'Terdapat 7 skema baru sesuai dengan kebutuhan kompetensi program studi', 'belum ada evaluasi dengan prodi bersangkutan hanya sebatas dengan BNSP', '-', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1zE1CdKL8kjRAV9eHDjrK4fVGLMEYvnR5?usp=drive_link', 2, 1, NULL, 3, 56, 'belum selesai', '2024-12-28 12:50:02', '2025-01-13 06:05:03'),
(91, 'Telah dilaksanakan', 'https://s.pnj.ac.id/xGgfeB', 'Kegiatan dilakukan untuk mengertahui tingkat kualitas layanan Unit', 'Layanan berjalan baik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 113, 'belum selesai', '2024-12-28 20:03:05', '2025-01-01 20:15:45'),
(92, 'Yang ada konseling karir dan pembinaan soft skill', 'https://s.pnj.ac.id/92FThE', 'Konseling karir dan pembinaan soft skill diperlukan', 'Telah dilakanakan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 111, 'belum selesai', '2024-12-28 20:07:40', '2024-12-28 20:07:40'),
(93, 'Dapat dilaksanakan, khususnya untuk kerja sama portal karir (dengan PT Atma)  dan job fair (dengan level 7 dan Maxi Organizer)', 'https://s.pnj.ac.id/RBEZNx', 'Sebagian kerja sama berlum terdata dengan tertib; sebagian kerja sama lebih banyak pada permintaan Webinar Karir dan Webinar Soft Skill', 'Kerja sama Karir perlu berfokus pada aktivitas recruitmen dan dengan pendataan yang lebih cermat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 109, 'belum selesai', '2024-12-28 22:17:40', '2024-12-28 22:17:40'),
(94, 'Untuk indikator ini, dilakanakan oleh Bidang Kemahasiswaam', 'https://s.pnj.ac.id/TQp2uc', 'UPA Karir tidak bertugas dalam hal magang', 'UPA Karir hanya meneruskan info magang ke Staf Wadir Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 110, 'belum selesai', '2024-12-28 22:23:24', '2024-12-28 22:23:24'),
(95, 'Ada dokumen perencanaan kegiatan:  penyebaran informasi kerja, khususnya melalui IG CDC dan Grup UPA dengan Jurusan, penyelenggaraan bursa kerja secara berkala, dengan job fair, satu tahun, 1 kali perencanaan karir pelatihan melamar kerja, dengan Klinikal Karir, layanan penempatan kerja: Recruitmen di Kampus.   Perencanaan kerja alumni yang belum tersusun', 'https://s.pnj.ac.id/DC67Ya', 'UPA Karir berfokus pada upaya pencapaian lulusan kerja-wirausaha-melanjutkan studi=80%;  secara data untuk lulusan 2023 telah 83%', 'perlu disusun perencanaan karir lulusan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 112, 'belum selesai', '2024-12-28 22:37:29', '2024-12-28 22:37:29'),
(96, 'Telah dilakukan survei', 'https://s.pnj.ac.id/agBuPC', 'Hasil survei menunjukkan bahwa layanan telah baik', 'Terus dilakukan perbaikan layanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 114, 'belum selesai', '2024-12-28 22:57:05', '2024-12-28 22:57:05'),
(97, 'Telah diserahkan', 'https://s.pnj.ac.id/agBuPC', 'Telah diserahkan dan didokumentasikan', 'Perlu terus dioptimalkan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 115, 'belum selesai', '2024-12-28 22:59:34', '2024-12-28 22:59:34'),
(98, 'Data kelulusan tepat waktu didata oleh Bagian Akademik', 'https://s.pnj.ac.id/XNGFP3', 'sesuai Tupoksi', 'Telah terdata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 102, 'belum selesai', '2024-12-28 23:01:49', '2025-01-01 20:12:08'),
(99, 'Pendataan keberhasilan studi oleh Bidang Akademik', 'https://s.pnj.ac.id/agBuPC', 'sesuai Tupoksi', 'Telah terdata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 103, 'belum selesai', '2024-12-28 23:03:34', '2025-01-01 20:16:38'),
(100, 'Masa tunggu untuk lulusan 2021, 2022, dan 2023 adalah 3,2 bulan', 'https://s.pnj.ac.id/VwnmD6', 'telah dilaporkan ke web Tracer Kementerian', 'Telah dilaporkan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 104, 'belum selesai', '2024-12-28 23:34:24', '2024-12-28 23:34:24'),
(101, 'Dari jawaban respon lulusan 2021, 2022, dan 2023; sangat sesuia= 1897 (45%), sesuai=1060 (25%), cukup sesuai=758 (18%);  total ke-2 aspek=3712 dari total=4242.  Untuk ke-2 aspel=87%', 'https://s.pnj.ac.id/VwnmD6', 'hasil sesuai data', 'data tersedia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 105, 'belum selesai', '2024-12-29 01:50:46', '2024-12-29 01:50:46'),
(102, 'Dengan menggunakan 10% data (196) hasil isian bahwa kepuasan pengguna lulusan untuk berbagai aspek melebihi 75%', 'https://s.pnj.ac.id/XnBDaP', 'Terdapat kesulitan meminta perusahaan mengisi instrumen pengguna lulusan', 'Capaian pengisian baru 196 lulusan (10%)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 106, 'belum selesai', '2024-12-29 02:14:14', '2024-12-29 02:14:14'),
(103, 'Belum ada dokumen terkait', NULL, 'dokumen belum dibuat', NULL, 'sudah ada seperti perbaikan genset tetapi dokumentasi dalam proses perbaikan dan log book belum ada', 'mekanisme kontrol dalam kegiatan perbaikan perlu didokumentasi dengan baik', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 67, 'belum selesai', '2024-12-29 03:15:40', '2024-12-31 05:44:39'),
(104, 'belum ada program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', NULL, 'belum dibuat rencana program/kegiatannya', NULL, 'sebagai contoh ada pengajuan perbaikan transformator sifatnya masih usulan tapi belum direalisasikan', 'membuat perencanaan kegiatan perbaikan untuk satu tahun kedepan agar bisa terlacak ketercapainnya', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 68, 'belum selesai', '2024-12-29 03:17:04', '2024-12-31 05:47:18'),
(105, 'Tersedia Dokumen mengenai struktur organisasi unit kerja dilengkapi dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab.', 'https://drive.google.com/open?id=1-7mFQOwQTr8LHNWZd9injzRY_3k9TIQy&usp=drive_fs', 'dokumen telah dibuat', NULL, 'sudah tersedia dokumen terkai struktur organisasi unit kerja dengan deskripsi tertulis yang jelas tentang tugas, fungsi, wewenang, dan tanggung jawab.', 'sudah cukup baik', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://drive.google.com/file/d/1-7mFQOwQTr8LHNWZd9injzRY_3k9TIQy/view', 2, 2, NULL, 4, 69, 'belum selesai', '2024-12-29 03:30:01', '2024-12-31 00:24:35'),
(106, 'hanya terdapat dokumen struktur organisasi UPA PPK3', 'https://drive.google.com/file/d/1-YEnRWHxToIINI9G6_BhzPr_FG-JLLW2/view?usp=sharing', 'belum ada dokumen terkait', NULL, 'sudah ada dan bisa di cek di E SKP cuma kendalanya E SKP dibuka satu satu pertanggal', 'membuat database atau log book agar mempermudah Kepala UPA untuk melihat konsitensi dari jenis pekerjaan yang dilakukan', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 70, 'belum selesai', '2024-12-29 03:36:50', '2024-12-31 05:57:08'),
(107, 'Belum ada dokumen terkait', NULL, 'dokumen belum dibuat', NULL, 'belum ada visi, misi dan tujuan strategis dalam renstra dan RKAT Kepemimpinan organisasional', 'segera membuat visi, misi dan tujuan strategis dalam renstra dan RKAT Kepemimpinan organisasional yang terstruktur', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 71, 'belum selesai', '2024-12-29 03:39:43', '2024-12-31 05:59:42'),
(108, 'Belum ada dokumen terkait', NULL, 'dokumen belum dibuat', NULL, 'pekerjaan rutin sudah dilakukan hanya kalau ideal POAC belum terlihat dokumentasinya', 'perlu pelatihan POAC', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 72, 'belum selesai', '2024-12-29 03:40:09', '2024-12-31 06:03:35'),
(109, 'Terdapat dokumen SOP terkait', 'https://drive.google.com/file/d/10R3mHvGD3UqFukdkYCkvNU3M1yg63iax/view?usp=sharing', 'dokumen telah dibuat', NULL, 'sudah ada tapi belum diperbaharui', 'perlu diperbaharui sesuai dengan pimpinan yang menjabat', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://drive.google.com/file/d/10R3mHvGD3UqFukdkYCkvNU3M1yg63iax/view?usp=sharing', 2, 2, NULL, 4, 73, 'belum selesai', '2024-12-29 03:41:25', '2024-12-31 06:05:20'),
(110, 'Belum ada dokumen terkait', NULL, 'dokumen dan kegiatan belum dibuat', NULL, 'sudah dilakukan hanya saja dengan lisan belum ada sistem atau program yang sifatnya sosialisasi kepada civitas akademika', 'membuat spanduk membuat alur prosedur pengaduan di web atau di video tron', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 74, 'belum selesai', '2024-12-29 03:41:45', '2024-12-31 06:08:20'),
(111, 'terdapat dokumen mengenai layanan terkait SOP, namun belum ada sosialisasi dan evaluasi setiap tahun', NULL, 'belum ada dokumen terkait', NULL, 'belum ada bukti sosialisasi dan evaluasi setiap tahunnya', 'membuat dulu panduan layanan yang mudah untuk dipahami dan disosialisasikan perlu adanya dokumentasi database', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 75, 'belum selesai', '2024-12-29 03:43:38', '2024-12-31 06:11:39'),
(112, 'Terdapat dokumen SOP terkait', 'https://drive.google.com/file/d/10R3mHvGD3UqFukdkYCkvNU3M1yg63iax/view?usp=sharing', 'dokumen telah dibuat', NULL, 'belum ada kegiatan yang sifatnya mengevaluasi layanan yang sudah dilakukan', 'mengadakan rapat rutin terkait dengan kegiatan layanan (sifatnya mengevaluasi)', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 2, 1, NULL, 4, 76, 'belum selesai', '2024-12-29 03:46:02', '2024-12-31 06:14:57'),
(113, 'Belum ada dokumen terkait', NULL, 'dokumen belum dibuat', NULL, 'semua dokumen yang disampaikan di indikator sedang proses dibuat', 'segera merealisasikan dokumen terkait', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 77, 'belum selesai', '2024-12-29 03:46:58', '2024-12-31 06:17:54'),
(114, 'Belum ada dokumen terkait', NULL, 'dokumen belum dibuat', NULL, 'dokumen rencana pengembangan prasarana dan sarana yang dibreakdown dari Renstra PNJ sedang proses dibuat', 'segera merealisasikan dokumen terkait', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://perencanaan.pnj.ac.id/upload/artikel/files/677600_PNJ_Renstra_revisi_2020-2024.Rev_2%20_1723449045.pdf', 1, 1, NULL, 4, 78, 'belum selesai', '2024-12-29 03:47:32', '2024-12-31 06:20:26'),
(115, 'Belum ada dokumen terkait', NULL, 'dokumen belum dibuat', NULL, 'belum ada bukti hasil evaluasi ditindak lanjuti untuk penyempurnaan pelayanan', 'perlunya adanya rapat rutin terkait dengan  evaluasi ditindak lanjuti untuk penyempurnaan pelayanan yang terdokumentasi dengan baik', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 79, 'belum selesai', '2024-12-29 03:47:53', '2024-12-31 06:22:08'),
(116, 'Kelengkapan peralatan belum memadai', NULL, 'contoh: APAR belum ada di semua gedung', NULL, 'kelengkapan K3 belum lengkap di PNJ', 'membuat log book terkait pendataan terlebih dahuludengan kelengkapan K3 bagian gedung yang belum lengkap perlengkapan k3', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 80, 'belum selesai', '2024-12-29 03:49:26', '2024-12-31 06:25:12'),
(117, 'Belum ada dokumen terkait', NULL, 'dokumen belum dibuat', NULL, 'belum ada monitoring dan evaluasi terhadap: 1) pelaksanaan program layanan dan 2) tingkat kepuasan pelayanan yang diukur', 'membuat survey tingkat kepuasan layanan dan mengevaluasi serta monitoring dalam pelaksanaan program yang sudah dibuat', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 81, 'belum selesai', '2024-12-29 03:49:48', '2024-12-31 06:31:38'),
(118, 'Belum ada pembaharuan sertifikasi kompetensi Teknisi pemelihara dan perawatan bangunan gedung', NULL, 'belum diajukan kegiatan pelatihan/sertifikasi', NULL, 'sertifikat kompetensi sudah kadaluarsa', 'segera mengajukan sertifikasi kompetensi', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 82, 'belum selesai', '2024-12-29 03:51:30', '2024-12-31 06:33:54'),
(119, 'Terdapat dokumen kegiatan perbaikan gedung yang dilakukan setiap hari kerja', 'https://drive.google.com/file/d/1HjB6Cjf53iZOC5CMFVt8xQ5MsWGMP9dd/view?usp=sharing', 'dokumen telah dibuat', NULL, 'dokumen tata cara pemeliharaan gedung belum ada hanya ada laporan kegiatan', 'segera membuat dokumen tata cara pemeliharaan gedung', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 2, 1, NULL, 4, 83, 'belum selesai', '2024-12-29 03:52:53', '2024-12-31 06:36:04'),
(120, 'Belum ada pembaharuan sertifikasi kompetensi Teknisi pemelihara dan perawatan bangunan gedung', NULL, 'belum diajukan kegiatan pelatihan/sertifikasi', NULL, 'hanya gedung gedung baru seperti perpustakaan dan PUT sudah ada sertifikasi', 'untuk gedung gedung yang lain bisa dilakukan pencatatan dalam bentuk yang lain segera dilengkapi', 'KA UPA Perawatan dan Perbaikan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 4, 84, 'belum selesai', '2024-12-29 03:53:22', '2024-12-31 06:39:42'),
(121, 'Telah tercapai', 'https://s.pnj.ac.id/yWerQD', 'Telah tersedia hasil tracer', 'Tersedia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 107, 'belum selesai', '2024-12-29 22:22:27', '2025-01-01 20:11:06'),
(122, 'Ada sumbangan dana dan fasilitas berupa pemberian beasiswa dan perbaikan masjid darul ilmi', 'https://drive.google.com/drive/u/0/folders/1Ec1eV_2-GeHUeBRCQZ6BWh4xNEmDmN4K', 'untuk data lain harus dikomunikasikan dulu ke berbagai pihak karena CDC belum memiliki datanya', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 5, 108, 'belum selesai', '2024-12-29 22:29:14', '2024-12-29 22:29:14');
INSERT INTO `instrumen_audits` (`id`, `deskripsi_temuan`, `bukti`, `akar_penyebab`, `akibat`, `temuan_audit`, `rekomendasi_auditor`, `penanggung_jawab`, `rencana_perbaikan`, `tanggapan_auditee`, `jadwal_penyelesaian`, `link`, `id_status_tercapai`, `id_status_temuan`, `id_status_akhir`, `id_AMI`, `id_indikator`, `status_audit`, `created_at`, `updated_at`) VALUES
(123, 'SOTK UPATIK sudah terlaksana sesuai dengan prosedur operasional yang ada.', 'https://drive.google.com/drive/folders/1ADiT_kftC9NNpZ_E177o2ISPH9rwFx-A?usp=sharing', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 16, 'belum selesai', '2024-12-30 00:46:52', '2025-01-02 01:56:06'),
(124, 'UPATIK memiliki rencana kegiatan sesuai dengan indikator kinerja dari pimpinan', 'https://drive.google.com/drive/folders/1Q2LEDQYoIhLzZB2GN2gx7M3F2qcg4Fuv?usp=drive_link', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 17, 'belum selesai', '2024-12-30 01:02:05', '2024-12-30 01:02:05'),
(125, 'UPATIK melakukan fungsi pengelolaan secara efektif', 'https://drive.google.com/file/d/1Dinde3-VQ8Ac_wFdWYXut2e5V4uaCvAC/view?usp=drive_link', 'tidak ada', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 18, 'belum selesai', '2024-12-30 01:07:53', '2024-12-30 01:07:53'),
(126, 'Laporan Kinerja UPATIK menunjukkan bahwa UPATIK menjalankan >80% program.', 'https://drive.google.com/drive/folders/1FXa3hWQwut2IA4K8_09_f7lD1s6YW3e3?usp=sharing', 'tidak ada', 'tidak ada', 'Persentase ketercapaian realisasi anggaran dan kegiatan adalah 0,825 atau 82,5% dari sejumlah 12 kegiatan yang disetujui dengan rincian 9 kegiatan selesai direalisasikan dan terdapat 3 kegiatan yang dilaksanakan selama tahun 2024. Pengajuan kegiatan sebanyak 28 hanya disetujui sebanyak 12 kegiatan saja.', 'Perlu adanya koordinasi dengan pimpinan di awal tahun perencanaan dan persetujuan di awal tahun. Sehingga kegiatan sudah pasti akan dilaksanakan dan mitigasi realisasi kegiatan yang tidak dapat disetujui di tahun berjalan dapat direalisasikan pada tahun depan untuk mencapai roadmap blueprint IT.', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 2, 2, NULL, 6, 14, 'belum selesai', '2024-12-30 01:11:39', '2025-01-02 09:39:08'),
(127, 'UPATIK melakukan evaluasi berdasarkan survey layanan UPATIK yang dibagikan setiap pengguna layanan membuat tiket support di https://layanan.pnj.ac.id/', 'https://docs.google.com/spreadsheets/d/1H8LxLtQB7HnCrFFHAg7j-_nlNzdSmI-O/edit?usp=sharing&ouid=114831394127018132122&rtpof=true&sd=true', 'tidak ada', 'tidak ada', 'SOP sudah tersedia lengkap, disosialisasikan melalui platform elearning dan dipasang di area UPATIK. Survey kepuasan sudah dilakukan pada layanan UPATIK tetapi belum dilakukan evaluasi terhadap hasil kepuasan.', 'Dibuat pengajuan anggaran kegiatan untuk evaluasi seluruh layanan UPATIK. Dibuat evaluasi secara berkala.', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 22, 'belum selesai', '2024-12-30 01:22:46', '2025-01-02 02:41:50'),
(128, 'Sertifikasi kompetensi telah dilaksanakan berdasarkan skema yang sesuai dengan kebutuhan kompetensi prodi', 'https://drive.google.com/drive/folders/13V50IShPA9xFs5U_X7s46AtsS29N2v09?usp=sharing', 'Komitmen melakukan sertfifikasi kompetensi sesuai kebutuhan kompetensi prodi', 'Sertifikasi dilakukan sesuai kebutuhan kompetensi prodi', 'Bukti yang diberikan tidak spesifik, perlu di update kembali bukti-bukti yang diberikan', 'Update isi dari bukti berupa pedoman pelaksanaan uji kompetensi dan sertifikasi', NULL, NULL, NULL, NULL, 'https://drive.google.com/drive/folders/13V50IShPA9xFs5U_X7s46AtsS29N2v09', 2, 2, NULL, 3, 57, 'belum selesai', '2024-12-30 06:48:04', '2025-01-13 06:09:45'),
(129, 'Kegiatan sertifikasi kompetensi mahasiswa telah dilaksanakan oleh LSP PNJ sebanyak 80 orang, sisanya dilakukan Oleh Prodi dengan bekerjasama dennen LSP P3', 'https://docs.google.com/spreadsheets/d/1kPVRWEyu0W9vYZAkTFxLwTK0mkIVlRJN/edit?usp=sharing&ouid=106432281651851587337&rtpof=true&sd=true', 'License LSP PNJ habis masa berlakunya sehingga tidak bisa melakukan sertifikasi kompetensi', 'Pelaksanaan sertifikasi kompetensi dilakukan prodi bekerjasama dengan LSP P3, menjadikan kenaikan biaya', 'Tidak ada', 'Tersedia bukti pelaksanaan uji kompetensi dan sertifikasi yang paling sedikit memuat: 1) Daftar total mahasiswa yang telah mengikuti uji kompetensi pada tahun berjalan. 2) Jumlah dan daftar mahasiswa yang lulus uji kompetensi dan memiliki sertifikat kompetensi profesi.', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/1kPVRWEyu0W9vYZAkTFxLwTK0mkIVlRJN/edit?gid=1493696963#gid=1493696963', 2, 2, NULL, 3, 58, 'belum selesai', '2024-12-30 07:09:28', '2025-01-13 06:10:49'),
(130, 'Tersedia dokumen sahih terkait monitoring dan evaluate pelaksanaan sertifikasi komptensi, hasilnya ditindaklanjuti', 'https://drive.google.com/file/d/1OZ4GkTUZkI2asiUlFj2P8Z1XIAOv5UIS/view?usp=drive_link', 'Komitmen pengurus LSP untuk selalu melakukan evaluasi dan menindaklanjuti catatan evaluasi', 'Perbaikan proses sertifikasi kompetensi mahasiswa', 'Menambahkan bukti terkait monitoring dan evaluasi pelaksaan uji kompetansi dan sertifikasi', 'Tersedia dokumen sahih terkait monitoring dan evaluasi pelaksanaan uji kompetensi dan sertifikasi yang hasilnya ditindaklanjuti dan dijadikan pengambilan keputusan.', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/file/d/1OZ4GkTUZkI2asiUlFj2P8Z1XIAOv5UIS/view', 2, 2, NULL, 3, 59, 'belum selesai', '2024-12-30 07:18:26', '2025-01-13 06:13:52'),
(131, 'Capaian target rencana kerja sudah 146%', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'Proses pencapaian tersebut terkendala salah satunya oleh kurangnya data dukung dari prodi', 'sehingga ada beberapa dokumen PKS yang belum terupdated pada SIKERMA DIKSI', 'sudah melampaui lebih dari 100%', 'bisa mengupdate PKS pada SIKERMA DIKSI', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 3, 3, NULL, 11, 455, 'belum selesai', '2024-12-30 07:24:54', '2024-12-30 08:09:53'),
(132, 'Capaian target mata kuliah selaras dengan kepentingan industri sudah mencapai >80%, hal ini bisa dilihat pada kelas kerjasama PNJ dengan PT SBI', 'https://drive.google.com/file/d/1Xal7FNhJNdK9ebTid2t5LIYuJvYb0517/view?usp=drive_link', 'tidak ada', 'tidak ada', 'sudah mencapai sebagai contoh di PT SBI matakuliah sudah sesuai dengan kebutuhan industri', 'bisa melanjutkan', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, 'https://drive.google.com/file/d/1Xal7FNhJNdK9ebTid2t5LIYuJvYb0517/view?usp=drive_link', 2, 2, NULL, 11, 456, 'belum selesai', '2024-12-30 07:37:58', '2024-12-30 08:16:23'),
(133, 'belum memiliki lebih dari 2 TEFA', 'https://0.com', 'belum ada sarana dan prasarana yang mendukung, kualitas yang dibuat mahasiswa belum sesuai dengan standar industri/mitra', 'TEFA belum berjalan maksimal', 'program sudah ada cuma masih belum bisa berjalan', 'perlu ada perubahan status dari BLU menjadi PTNBH dengan adanya perubahan status ini menjadikan PT lebih fleksibel', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 11, 458, 'belum selesai', '2024-12-30 07:56:17', '2024-12-30 08:20:14'),
(134, 'Kinerja ini sudah ditarik oleh Bidang Akademik', 'https://drive.google.0.com', 'Proses dilakukan dibidang Akademik', 'Bidang Kerjasama tidak dapat memberikan data', 'Kinerja ini sudah ditarik oleh Bidang Akademik', 'Bidang terkait meminta ke Bidang Akademik', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.0.com', 1, 1, NULL, 11, 457, 'belum selesai', '2024-12-30 07:59:50', '2024-12-30 08:22:12'),
(135, 'Jumlah dosen praktisi kurang dosen 30%', 'https://drive.google.0.com', 'beberapa Surat Tugas dari Industri belum didapatkan oleh dosen praktisi', 'Bukti pendukung indikator ini tidak ada', 'bidang kerjasama belum memilik data jumlah dosen praktisi yang mengajar di PT', 'bidang kerjasama bisa segera mengumpulkan bukti bukti seperti surat tugas dari Industri yang menyatakan bahwasanya praktisi mengajar di PNJ', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.0.com', 1, 1, NULL, 11, 459, 'belum selesai', '2024-12-30 08:18:56', '2024-12-30 08:24:04'),
(136, 'Kurang dari 50%', 'https://drive.google.com/file/d/1qnIMCcc0kko5irezVSZ1CGVeWahoYQTP/view?usp=drive_link', 'industri kecil tidak ada PKS dan juga beberapa industri yang menerima magang belum dilakukan inisiasi untuk menjalin kerjasama secara formal.', 'Tidak tercapai persentase mahasiswa yang bisa magang di industri yang memiliki kerjasama dengan PNJ', 'kondisi yang sudah ada PKS badak dan SBI tetapi seluruh mahasiswa PNJ akan melakukan magang di industri berdasarkan kurikulum untuk D3 pada semester 5 dan untuk D4 pada semester 7', 'untuk bidang kerja sama bisa membuat log book data base terkait dengan daftar nama perusahaan tempat mahasiswa magang dan kemudian bisa membuat kerja sama dengan perusahaan terkait untuk melakukan magang', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1qnIMCcc0kko5irezVSZ1CGVeWahoYQTP/view?usp=drive_link', 1, 2, NULL, 11, 461, 'belum selesai', '2024-12-30 08:37:56', '2025-01-07 06:58:29'),
(137, 'LSP senantiasa melaksanakan kegiatan pelatihan Asesor Kompetensi dan Recognicy Current Competency setiap tahun untuk dosen dan asesor PNJ', 'https://drive.google.com/drive/folders/1iiYC980koJ5glhurWbHe4DNcXncFcQbO?usp=sharing', 'Komitmen untuk selalu membina dan mengembangkan kompetensi asesor dan dosen PNJ', 'Asesor dan dosen LSP PNJ senantiasa terjaga dan berkembang', 'Ada, namun bukti pada file Panduan Mutu belum dicantumkan', 'Menambahkan bukti sahih pedoman pelaksanaan pembinaan dan pengembangan dosen menjadi asesor kompetensi.', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1iiYC980koJ5glhurWbHe4DNcXncFcQbO', 2, 2, NULL, 3, 60, 'belum selesai', '2024-12-31 01:55:43', '2025-01-13 06:18:24'),
(138, 'LSP senantiasa melaksanakan kegiatan pelatihan Asesor Kompetensi dan Recognicy Current Competency setiap tahun untuk dosen dan asesor PNJ', 'https://drive.google.com/drive/folders/1QoPonnK_D4jhh7yPeP3YbdfPUnIf9kgX?usp=sharing', 'Komitmen untuk selalu membina dan mengembangkan kompetensi asesor dan dosen PNJ', 'Asesor dan dosen LSP PNJ senantiasa terjaga dan berkembang', 'Tidak ada', 'Tersedia bukti pelaksanaan pembinaan dan pengembangan dosen menjadi asesor kompetensi, yang paling sedikit memuat: 1) Daftar total dosen yang telah mengikuti uji kompetensi menjadi asesor kompetensi pada tahun berjalan. 2) Jumlah dan daftar dosen yang lulus uji kompetensi dan memiliki sertifikat asesor kompetensi.', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1QoPonnK_D4jhh7yPeP3YbdfPUnIf9kgX', 2, 2, NULL, 3, 61, 'belum selesai', '2024-12-31 01:57:45', '2025-01-13 06:19:24'),
(139, 'LSP senantiasa melaksanakan kegiatan pelatihan Asesor Kompetensi dan Recognicy Current Competency setiap tahun untuk dosen dan asesor PNJ', 'https://drive.google.com/drive/folders/1iiYC980koJ5glhurWbHe4DNcXncFcQbO?usp=drive_link', 'Komitmen untuk selalu membina dan mengembangkan kompetensi asesor dan dosen PNJ', 'Asesor dan dosen LSP PNJ senantiasa terjaga dan berkembang', 'Tidak ada', 'Tersedia dokumen sahih terkait monitoring dan evaluasi pelaksanaan pembinaan dan pengembangan yang hasilnya ditindaklanjuti dan dijadikan pengambilan keputusan.', NULL, NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1iiYC980koJ5glhurWbHe4DNcXncFcQbO', 2, 2, NULL, 3, 62, 'belum selesai', '2024-12-31 02:04:09', '2025-01-13 06:20:30'),
(140, 'TUK tersedia di masing-masing jurusan dengan kondisi telah terverifikasi', 'https://drive.google.com/file/d/1wwMSBNBVUVCpCuKtnSNMxLZa2KH3PY8L/view?usp=sharing', 'Komitmen untuk menyiapkan TUK untuk dapat digunakan sertifikasi kompetensi', 'TUK siap gunakan untuk sertifikasi kompetensi', 'Tidak ada', 'Tersedia 7 daftar TUK lengkap dengan status kondisi kesiapan pakai untuk pelaksanaan uji kompetensi. Terdiri dari jumlah dan daftar rinci TUK yang sudah tersedia serta status kondisinya', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/file/d/1wwMSBNBVUVCpCuKtnSNMxLZa2KH3PY8L/view', 2, 2, NULL, 3, 63, 'belum selesai', '2024-12-31 02:07:58', '2025-01-13 06:23:23'),
(141, 'TUK tersedia di masing-masing jurusan dengan kondisi telah terverifikasi', 'https://drive.google.com/file/d/1wwMSBNBVUVCpCuKtnSNMxLZa2KH3PY8L/view?usp=sharing', 'Komitmen untuk menyiapkan TUK untuk dapat digunakan sertifikasi kompetensi', 'TUK siap gunakan untuk sertifikasi kompetensi', 'Ada, penambahan bukti foto-foto TUK yang digunakan', 'Menambahkan bukti sahih TUK digunakan untuk pelaksanaan uji kompetensi.', NULL, NULL, NULL, NULL, 'https://drive.google.com/file/d/1wwMSBNBVUVCpCuKtnSNMxLZa2KH3PY8L/view', 2, 2, NULL, 3, 64, 'belum selesai', '2024-12-31 02:10:49', '2025-01-13 06:25:44'),
(142, 'TUK tersedia di masing-masing jurusan dengan kondisi telah terverifikasi', 'https://drive.google.com/file/d/1wwMSBNBVUVCpCuKtnSNMxLZa2KH3PY8L/view?usp=sharing', 'Komitmen untuk menyiapkan TUK untuk dapat digunakan sertifikasi kompetensi', 'TUK siap gunakan untuk sertifikasi kompetensi', 'ada , namun semua bukti dalam sosialisasi tempat TUK dilakukan oleh masing-masing jurusan', '-', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://drive.google.com/file/d/1wwMSBNBVUVCpCuKtnSNMxLZa2KH3PY8L/view?usp=sharing', 2, 2, NULL, 3, 65, 'belum selesai', '2024-12-31 02:11:48', '2025-01-13 06:28:37'),
(143, 'LSP telah melakukan survey kepuasan layana uji kompetensi melalui aplikasi G-Form', 'https://docs.google.com/spreadsheets/d/1bm6iqJ-ZBCq2H9kRRPIS12asUISCetzPmZ2p0vYzhd0/edit?usp=sharing', 'Komitmen untuk mendapatkan masukan dari pengguna untuk ditindaklanjuti perbaikan layanan', 'Mendapatkan umpan balik dari pengguna', 'ada, masih berupa data mentah (blm dalam bentuk rekapan)', '-', 'KA UPA Layanan Uji Kompetensi', NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/1bm6iqJ-ZBCq2H9kRRPIS12asUISCetzPmZ2p0vYzhd0/edit?usp=sharing', 2, 1, NULL, 3, 66, 'belum selesai', '2024-12-31 02:27:51', '2025-01-13 06:31:12'),
(144, 'Tidak memenuhi, jumlah mahasiswa asing (non student exchange) masih NOL', 'http://tidak.ada', 'tidak ada dana dari PNJ yang sangat melimpah untuk bisa menstimulus mahasiswa asing untuk datang. Memang siapa PNJ? Yakin banget bisa dapat mahasiswa asing tanpa kasih beasiswa', 'tidak tercapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, 296, 'belum selesai', '2025-01-01 10:50:37', '2025-01-02 00:29:33'),
(145, 'ada', 'https://drive.google.com/file/d/10gXXjpy_XnPro0P8GxtWp_-Bv-pk-ssW/view?usp=sharing', '-', 'keren banget', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 299, 'belum selesai', '2025-01-01 10:51:23', '2025-01-02 00:26:37'),
(146, 'sudah dengan bantuan auto translate', 'http://pnj.ac.id', '-', 'ada dua bahasa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 298, 'belum selesai', '2025-01-01 10:52:15', '2025-01-01 10:52:15'),
(147, 'tidak ada rencana operasional', 'http://tidak.ada', 'tidak pernah disuruh membuat', 'tidak ada rencana operasional', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, 279, 'belum selesai', '2025-01-02 00:31:31', '2025-01-02 00:31:31'),
(148, 'Melampaui batas', 'https://drive.google.com/file/d/10gXXjpy_XnPro0P8GxtWp_-Bv-pk-ssW/view?usp=drive_link', 'Kami hebat', 'Melampaui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 8, 280, 'belum selesai', '2025-01-02 00:32:33', '2025-01-02 00:32:33'),
(149, 'Ada', 'https://drive.google.com/file/d/1-xgqpiqg1ddXC7HzpvSqGpSHAThPQ9kP/view?usp=sharing', '-', 'tercapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 281, 'belum selesai', '2025-01-02 00:36:58', '2025-01-02 00:36:58'),
(150, 'Ada', 'https://drive.google.com/file/d/1-xgqpiqg1ddXC7HzpvSqGpSHAThPQ9kP/view?usp=sharing', '-', 'tercapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 282, 'belum selesai', '2025-01-02 00:38:16', '2025-01-02 00:38:52'),
(151, 'Ada', 'https://drive.google.com/file/d/10gXXjpy_XnPro0P8GxtWp_-Bv-pk-ssW/view?usp=sharing', '-', 'tercapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 283, 'belum selesai', '2025-01-02 00:40:25', '2025-01-02 00:40:25'),
(152, 'Ada SOP dan sudah disahkan akhir tahun 2022.', 'https://docs.google.com/spreadsheets/d/122JAwsgAEYaFRjX-7jg_AL5EYwbdmm-w/edit?usp=sharing&ouid=103196879604100357305&rtpof=true&sd=true', '-', 'punya SOP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 284, 'belum selesai', '2025-01-02 00:44:53', '2025-01-02 00:44:53'),
(153, 'Ada', 'https://drive.google.com/drive/folders/101rhHPeqFo9mj372ktbH-aq_EQLDQQAG?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 285, 'belum selesai', '2025-01-02 00:49:40', '2025-01-02 00:49:40'),
(154, 'tidak ada', 'http://tidak.ada', 'tidak tahu cara buatnya, mohon arahannya', 'tidak punya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, 286, 'belum selesai', '2025-01-02 00:50:50', '2025-01-02 00:50:50'),
(155, 'tidak ada', 'http://tidak.ada', 'tidak tahu cara buatnya, mohon arahannya', 'tidak tercapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, 287, 'belum selesai', '2025-01-02 00:51:15', '2025-01-02 00:51:15'),
(156, 'Informasi publik dikelola oleh PPID (Pejabat Pengelola Informasi dan Dokumentasi), bukan KUI karna tidak ada hubungan pekerjaannya.', 'http://tidak.ada', 'bukan tupoksi', 'tidak dilakukan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, 288, 'belum selesai', '2025-01-02 00:54:21', '2025-01-02 00:54:21'),
(157, 'Tersedia bukti. Dalam bentuk TOR dan ikut exhibition di Perth pada Maret 2024 terkait APAIE yg bertujuan untuk promosi PNJ.', 'https://drive.google.com/file/d/11QcJu3ZJ-J3R-MSWniw8JjC-x_amoTax/view?usp=sharing', 'kita hebat ada dananya', 'tercapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 289, 'belum selesai', '2025-01-02 00:57:57', '2025-01-02 00:57:57'),
(158, 'Ada berupa laporan kegiatan', 'https://drive.google.com/file/d/1MUYw6HkxmHjl3vQEia-U-gNm2lfMYu0G/view?usp=sharing', '-', 'ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 290, 'belum selesai', '2025-01-02 01:00:14', '2025-01-02 01:00:39'),
(159, 'Ada', 'https://drive.google.com/file/d/1MUYw6HkxmHjl3vQEia-U-gNm2lfMYu0G/view?usp=sharing', '-', 'tercapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 291, 'belum selesai', '2025-01-02 01:01:14', '2025-01-02 01:01:14'),
(160, 'Belum ada', 'http://tidak.ada', 'tidak tahu cara buatnya, mohon arahannya', 'tidak tercapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, 292, 'belum selesai', '2025-01-02 01:02:32', '2025-01-02 01:02:32'),
(161, 'Ada', 'https://docs.google.com/spreadsheets/d/1U5fto25xH96l3HBTduZ8a5NJeqE2_oFe/edit?gid=1270121455#gid=1270121455', '-', 'ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 8, 293, 'belum selesai', '2025-01-02 01:03:28', '2025-01-02 01:03:28'),
(162, 'Dalam Renstra tidak tertera jelas jumlah IKU/ IKT yang berhubungan dengan double, dual, join degree', 'http://tidak.ada', 'definisi efektivitas apa? Belum jelas. Yang mengelola harusnya adalah jurusan yang bertanggung jawab ke WD 4/ WD 1', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, 294, 'belum selesai', '2025-01-02 01:04:45', '2025-01-02 01:04:45'),
(163, 'Ada, tetapi bukti pelaksanaan teknisnya bukan di KUI', 'http://tidak.ada', 'kami tidak mengelola teknis hanya membuka jalan', 'tidak ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, 295, 'belum selesai', '2025-01-02 01:05:45', '2025-01-02 01:05:45'),
(164, 'Belum ada pedoman pengelolaan website bahasa Inggris.', 'http://tidak.ada', 'website PNJ dikelola secara terpusat oleh humas.', 'tidak ada pedoman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, 297, 'belum selesai', '2025-01-02 01:08:41', '2025-01-02 01:08:41'),
(165, 'UPATIK melaksanakan evaluasi melalui rapat mingguan namun belum terdokumentasi.', NULL, 'UPATIK melaksanakan evaluasi melalui rapat mingguan namun belum terdokumentasi.', NULL, 'Kegiatan evaluasi sudah dilakukan tetapi belum ada dokumentasi kegiatannya', 'Bukti kegiatan evaluasi bisa berupa notulensi dari kegiatan yang dilakukan', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 28, 'belum selesai', '2025-01-02 02:17:17', '2025-01-02 03:10:03'),
(166, 'UPATIK melaksanakan evaluasi melalui rapat mingguan namun belum terdokumentasi.', NULL, 'UPATIK melaksanakan evaluasi melalui rapat mingguan namun belum terdokumentasi.', NULL, 'Sudah ada tindak lanjut dari kegiatan evaluasi tetapi karne tidak terdokumentasi jadi tidak tercatat dengan baik terkait kegiatannya', 'Perlunya mendokumentasi kegiatan evaluasi yang dilakukan', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 29, 'belum selesai', '2025-01-02 02:17:33', '2025-01-02 03:12:22'),
(167, 'UPATIK telah melaksanakan evaluasi melalui rapat AMI tahun 2023.', 'https://drive.google.com/drive/folders/1Ho3iKKdIRYOEbTNFWoOC-ic3Q4eYShxz?usp=sharing', 'UPATIK telah melaksanakan evaluasi melalui rapat AMI tahun 2023.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 31, 'belum selesai', '2025-01-02 02:20:28', '2025-01-02 02:20:28'),
(168, 'UPATIK telah melaksanakan evaluasi melalui rapat mingguan namun belum terdokumentasi.', NULL, 'Tidak ada dokumentasi rapat mingguan.', NULL, 'Seudah melakukan evaluasi pengelolaan sistem informasi namun kegiatan yang dilakukan tidak terdokumentasi', 'Perlunya mendokumentasi kegiatan evaluasi yang dilakukan seperti notulensi kegiatan', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 34, 'belum selesai', '2025-01-02 02:21:21', '2025-01-02 03:16:06'),
(169, 'UPATIK telah melaksanakan evaluasi melalui rapat mingguan namun belum terdokumentasi.', NULL, 'Tidak ada dokumentasi rapat.', NULL, 'Sudah ada tindak lanjut dari kegiatan evaluasi tetapi karne tidak terdokumentasi jadi tidak tercatat dengan baik terkait kegiatannya', 'Perlunya mendokumentasi kegiatan evaluasi yang dilakukan', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 35, 'belum selesai', '2025-01-02 02:21:48', '2025-01-02 03:19:56'),
(170, 'UPATIK telah melaksanakan evaluasi melalui rapat mingguan namun belum terdokumentasi.', NULL, 'Tidak ada dokumentasi rapat mingguan.', NULL, 'e-learning PNJ sudah pernah dilakukan survey, hanya saja belum dilakukan secara berkala. Hasil survey kepuasan sebagai bahan evaluasi belum ditindaklanjuti dan dibahas dalam rapat.', 'UPATIK perlu melakukan evaluasi penggunaan Sistem Informasi Pembelajaran dan mengadakan rapat bersama dengan bagian Akademik (WD1, Kajur dan KaProdi) sebagai bentuk tindak lanjut hasil evaluasi sistem.', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 38, 'belum selesai', '2025-01-02 02:22:18', '2025-01-02 03:36:58'),
(171, 'UPATIK telah melaksanakan evaluasi melalui rapat mingguan namun belum terdokumentasi.', NULL, 'Tidak ada dokumentasi rapat mingguan.', NULL, 'Survei sudah pernah dilakukan tetapi tidak secara kontinyu dan dikarenakan adanya aplikasi dikembangkan sendiri di unit kerja, UPATIK tidak dapat membuat survey mandiri. Untuk survey yang sudah pernah dilakukan belum dilakukan pengolah data sehingga belum ada hasil evaluasi.', 'Perlunya mendokumentasi kegiatan evaluasi yang dilakukan dan melakukan koordinasi untuk kebijakan pengembangan aplikasi dan evaluasinya sesuai UPATIK.', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 42, 'belum selesai', '2025-01-02 02:22:47', '2025-01-02 03:55:49'),
(172, 'UPATIK telah melaksanakan evaluasi melalui rapat mingguan namun belum terdokumentasi.', NULL, 'Tidak ada dokumentasi rapat mingguan.', NULL, 'Sudah memiliki fitur dua bahasa pada laman web PNJ di beberapa informasi yang tersedia. Tugas untuk update laman website PNJ adalah Humas dan masing-masing jurusan, sehingga kendali update laman dan bilingual bukan tupoksi UPATIK yang utama.', 'Perlu dibuat himbauan dan kebijakan dalam update konten laman PNJ serta pengecekan berkala. Perlu adanya pengawasan dan koordinasi diantara unit yang berkewajiban mengisi konten dan UPATIK sebagai penyedia layanan.', 'KA UPA Teknologi Informasi dan Komunikasi', NULL, NULL, NULL, NULL, 1, 1, NULL, 6, 43, 'belum selesai', '2025-01-02 02:23:00', '2025-01-02 09:03:48'),
(173, 'Tersedia dokumen renstra UPA Perpustakaan dan Laporan Kinerja Tahun 2024', 'https://drive.google.com/drive/search?q=Renstra', 'Perencanaan UPA Perpustakaan sudah tertuang pada Renstra 2020-2024', 'Program belum terlaksana secara penuh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 116, 'belum selesai', '2025-01-02 03:11:51', '2025-01-02 03:11:51'),
(174, 'Tersedia dokumen Laporan Kinerja', 'https://drive.google.com/file/d/1B3Qey2rlBN6W-hkU9LJXJfn5s9bGSwFM/view?usp=sharing', 'Terdapat rencana/program yang tidak tercapai (RFID) karena kurangnya informasi terkait dokumen clearance', 'Tidak Terlaksananya Pengadaan RFID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 117, 'belum selesai', '2025-01-02 03:17:56', '2025-01-02 03:17:56'),
(175, 'Tersedianya data pencacahan di tahun 2023 dan 2024', 'https://docs.google.com/spreadsheets/d/1hNwi7Jb0AgranOKZIG6tXy3m52Vttr7T1PIm9GGRCPc/edit?gid=0#gid=0', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 153, 'belum selesai', '2025-01-02 03:32:26', '2025-01-02 03:32:26'),
(176, 'Tersedianya data penyiangan tahun 2023 dan 2024', 'https://docs.google.com/spreadsheets/d/1hNwi7Jb0AgranOKZIG6tXy3m52Vttr7T1PIm9GGRCPc/edit?gid=0#gid=0', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 154, 'belum selesai', '2025-01-02 03:34:20', '2025-01-02 03:34:20'),
(177, 'Belum dilakukan pengukuran untuk kondisi poin a sampai e apakah sesuai standar atau tidak', 'https://jdih.perpusnas.go.id/file_peraturan/Perka_13_2017_SNP_Perpustakaan_Perguruan_Tinggi.pdf', 'Alat Ukur yang belum tersedia', 'tidak dapat dilaksanakan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 155, 'belum selesai', '2025-01-02 03:39:46', '2025-01-02 03:39:46'),
(178, 'Belum dilakukan pengajuan untuk fumigasi di 2024, terakhir dilakukan pada tahun 2022', 'https://drive.google.com/file/d/14duTO9SEaFWYxi1TVQL4fTUEfGwKjmX_/view', 'Belum dilakukan pengajuan untuk fumigasi di 2024, terakhir dilakukan pada tahun 2022', 'Bahan perpustakaan dapat rusak akibat serangga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 156, 'belum selesai', '2025-01-02 03:42:59', '2025-01-02 03:42:59'),
(179, 'Perbaikan buku 50 eksemplar namun belum dilakukan pencatatan. Pencatatan terakhir dilakukan pada tahun 2021.', 'https://docs.google.com/spreadsheets/d/1hpdNAdQUiaR4R53PqPC1V7dD3Atj9Glq/edit?gid=1256557675#gid=1256557675', 'Perlu dibuatkan pendokumentasian jumlah buku yang diperbaiki setiap tahun', 'Tidak tercatat jumlah buku yang diperbaiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 157, 'belum selesai', '2025-01-02 03:49:55', '2025-01-02 03:49:55'),
(180, 'Saat ini UPA Perpustakaan Menempati Lantai dasar Gedung Perpustakaan, dimana luas lantai dasar tersebut 1200M2, secara minimal luas gedung terpenuhi, Namun jika ditinjau dari standar Perpusnas (0,5m2 dikalikan jumlah mahasiswa jika diasumsikan mahasiswa PNJ 10.000 orang maka luas minimal 5000m2) maka luar perpustakaan masih dibawah standar.', 'https://jdih.perpusnas.go.id/file_peraturan/Perka_13_2017_SNP_Perpustakaan_Perguruan_Tinggi.pdf', 'Gedung Perpustakaan belum maksimal digunakan untuk fasilitas perpustakaan, seperti lantai 1 dan 2  yang belum digunakan', 'Ruang baca perpustakaan tidak cukup menampung jumlah mahasiswa yang berkunjung sehingga suasana perpustakaan kurang nyaman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 158, 'belum selesai', '2025-01-02 05:36:24', '2025-01-02 05:36:24'),
(181, 'Memiliki gedung tersendiri yang mudah di akses', 'https://drive.google.com/drive/folders/1DP1hN9SX_XMTwF7X12G23xRuamsBIT5I?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 167, 'belum selesai', '2025-01-02 05:40:45', '2025-01-02 05:40:45'),
(182, 'Rak Buku saat ini berjumlah 50 Rak', 'https://docs.google.com/spreadsheets/d/1u0zzX9V5xHBFZoM38xQdBHs7fKrzJwil/edit?gid=1114637861#gid=1114637861', 'Ruangan yang tidak memadai untuk penambahan Rak Buku', 'Pengadaan teks book dialihkan ke e-book', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 168, 'belum selesai', '2025-01-02 05:44:05', '2025-01-02 05:44:05'),
(183, 'Saat ini jumlah Rak Jurnal berjumlah 3 Rak', 'https://docs.google.com/spreadsheets/d/1JCY5U8dkyHy1nvvJIZOo4LIQt08Q6MM1/edit?gid=908692803#gid=908692803', 'Luas ruang tidak memadai', 'tidak dapat menambah jumlah rak, dan jurnal saat ini dilanggan dalam bentuk digital', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 169, 'belum selesai', '2025-01-02 05:47:13', '2025-01-02 05:47:13'),
(184, 'Tersedia 2 rak surat kabar namun 1 rak dalam kondisi rusak', 'https://drive.google.com/drive/folders/1u9U9ihHelCOBKNgIvpH1VPMSlp8ON7_l?usp=sharing', 'sudah terlalu lama', 'rusak dan hanya 1 yang dapat difungsikan/digunakan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 170, 'belum selesai', '2025-01-02 06:16:55', '2025-01-02 06:16:55'),
(185, 'UPA Perpustakaan baru memiliki 1 rak multimedia', 'https://drive.google.com/drive/folders/1Esx2cGePTTbSSel0sN6m28rxo_OSysxk?usp=sharing', 'baru teralisasi diakhir tahun 2024', 'belum bisa dimanfaatkan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 171, 'belum selesai', '2025-01-02 06:26:46', '2025-01-02 06:28:21'),
(186, 'Tersedia 5 Rak Referensi namun dengan kondisi beberapa rak sudah perlu diganti', 'https://drive.google.com/drive/folders/16VEgFdrYPVYloPQWlByacyRHOL045PnS?usp=sharing', 'sudah terlalu lama', 'kurang menarik bagi pemustaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 172, 'belum selesai', '2025-01-02 06:45:15', '2025-01-02 06:45:15'),
(187, 'saat ini rak display buku baru tersedia 1 rak', 'https://drive.google.com/drive/folders/1wa6B5a_H2tqlgZQMjtaYyPVRN6HjpEPY?usp=sharing', 'sudah 3 tahun pengadaan bahan koleksi dalam bentuk digital', 'tidak bertambahnya koleksi teks book dan kurang tersedianya ruangan sehingga sulit untuk menambah koleksi teks book', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 173, 'belum selesai', '2025-01-02 06:54:39', '2025-01-02 06:54:39'),
(188, 'Saat ini sudah tersedia sebanyak 4 unit rak beserta audio visualnya', 'https://drive.google.com/drive/folders/19uhj1KignB5JznwgNaM0pJikShBZ2u4C?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 174, 'belum selesai', '2025-01-02 06:56:17', '2025-01-02 06:56:45'),
(189, 'Saat ini hanya tersedia komputer yang digunakan untuk katalog yang tersmabung pada sistem opac.pnj.ac.id', 'https://drive.google.com/drive/folders/14OFAlXMo05gNZtLHbyg5NqLeKIgMwBN1?usp=sharing', 'sudah terkomputerisasi', 'lebih mudah untuk penelusuran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 175, 'belum selesai', '2025-01-02 07:10:55', '2025-01-02 07:10:55'),
(190, 'saat ini UPA Perpustakaan memiliki papan pengumuman atau mading hanya tersedia 1 buah', 'https://drive.google.com/drive/folders/1i9Zd85r4j8CVdBsTWZTzp9Uf-2d09Nfy?usp=sharing', 'Penampatan yang sulit di tata', 'tidak memenuhi standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 176, 'belum selesai', '2025-01-02 07:14:56', '2025-01-02 07:14:56'),
(191, 'saat ini luas ruang koleksi belum memenuhi standar karena keterbatasan ruang yang di pecah untuk beberapa area', 'https://drive.google.com/file/d/1C5u4kfId65raC_tOxGLkKUdhvLytIdbL/view?usp=sharing', 'hanya 1 lantai di gedung perpustakaan yang di gunakan oleh UPA Perpustakaan', 'Tidak terpenuhinya standar yang sesuai aturan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 159, 'belum selesai', '2025-01-02 07:24:42', '2025-01-02 07:24:42'),
(192, 'Jumlah meja saat ini sudah melebihi dari 20 buah', 'https://drive.google.com/drive/folders/1s_dreMs0Tydkq0z10na7iwkeeuicm-gk?usp=sharing', 'Mendapatka tambahan meja dari gedung PUT dan tambahan meja baca lesehan', 'terpenuhi dari jumlah minimal yang distandarkan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 177, 'belum selesai', '2025-01-03 07:16:29', '2025-01-03 07:16:29'),
(193, 'Tersedia meja sirkulasi', 'https://drive.google.com/drive/folders/17xcd9SKTf_8mlIKp4xLDY8zBWRdRns4v?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 178, 'belum selesai', '2025-01-03 07:19:33', '2025-01-03 07:19:33'),
(194, 'Sudah Terpenuhi', 'https://drive.google.com/drive/folders/1l_TLF3iCGm0b95AIwB4-boymbpV_ig_V?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 179, 'belum selesai', '2025-01-03 07:24:37', '2025-01-03 07:24:37'),
(195, 'Sudah Terpenuhi', 'https://drive.google.com/drive/folders/1s_dreMs0Tydkq0z10na7iwkeeuicm-gk?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 180, 'belum selesai', '2025-01-03 07:25:33', '2025-01-03 07:25:33'),
(196, 'Terpenuhi', 'https://drive.google.com/drive/folders/19uhj1KignB5JznwgNaM0pJikShBZ2u4C?usp=sharing', 'Penambahan 2 unit di tahun 2024', 'Terpenuhi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 181, 'belum selesai', '2025-01-03 07:26:44', '2025-01-03 07:26:44'),
(197, 'saat ini hanya tersedia 1 buah unit', 'https://drive.google.com/drive/folders/1pALU7NHJYCZicPD7E1IUrUk2ncvpgELc?usp=sharing', 'Pengadaan Printer dan Scanner Tahun 2024 tidak dapat terealisasi karena butuh dokumen clearance', 'tidak ada penambahan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 182, 'belum selesai', '2025-01-03 07:29:46', '2025-01-03 07:29:46'),
(198, 'Sudah terpenuhi PC dan Laptop', 'https://drive.google.com/drive/folders/1fXegwAz_47bFOSWXh4LYnIb64O0_GrOj?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 183, 'belum selesai', '2025-01-03 07:32:52', '2025-01-03 07:32:52'),
(199, 'Jumlah PC Pemustaka Saat ini berjumlah 7 unit', 'https://drive.google.com/drive/folders/1mkOJ23qFRMyG42e-KPsUbX3nWHLwiV_5?usp=sharing', 'Belum ada pengadaan PC', 'Tidak terpenuhinya standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 184, 'belum selesai', '2025-01-06 05:30:17', '2025-01-06 05:30:17'),
(200, 'Secara jumlah keseluruhan Komputer/PC dan Laptop di UPA Perpustakaan sudah terpenuhi dan', 'https://drive.google.com/drive/folders/1HXov_60FsoPF0WNxOiPIuesiPSyoQrmm?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 185, 'belum selesai', '2025-01-06 05:36:25', '2025-01-06 05:36:25'),
(201, 'Memiliki Sistem Otomasi Perpustakaan SLIMS dan sudah terupdate SLIMS 9 (Bulian)', 'https://opac.pnj.ac.id/', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 186, 'belum selesai', '2025-01-06 05:38:53', '2025-01-06 05:38:53'),
(202, 'Belum terpenuhi minimal luas 400m ruang pemustaka yang sesuai dengan standar', 'https://drive.google.com/file/d/1C5u4kfId65raC_tOxGLkKUdhvLytIdbL/view?usp=sharing', 'Karena gedung perpustakaan hanya difungsikan di lantai dasar saja sedangkan lantai lainnya digunakan untuk fungsi lain sehingga luas perpustakaan tidak memenuhi standar Perpusnas.', 'terlalu padat atau sesak ketika pemustaka sedang visit ke UPA Perpustakaan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 160, 'belum selesai', '2025-01-06 05:42:53', '2025-01-06 05:42:53'),
(203, 'Sudah Terpenuhi/Tersedia', 'https://drive.google.com/drive/folders/1te_b_C4f3YtXq-Cxb0WJTJkqrHKBg3-5?usp=sharing', 'Tersedia', 'Termonitor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 188, 'belum selesai', '2025-01-06 05:55:58', '2025-01-06 05:55:58'),
(204, 'Belum Tersedia', 'https://drive.google.com/drive/folders/1NRGXV2l4-uYS96gLZaa3AvX82WVXBXPC?usp=sharing', 'Sudah dilakukan pengajuan namun sampai saat ini tidak terealisasi dikarenakan kurangnya dokumen clearance', 'Belum Tersedia Pintu Detektor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 189, 'belum selesai', '2025-01-06 06:01:23', '2025-01-06 06:01:23'),
(205, 'Saat ini ruang staf masih terbatas dikarenakan luas ruangan yg digunakan UPA Perpustakaan dan Jumlah Staf', 'https://drive.google.com/drive/folders/1xmoy6vIyLSMlfiOcAcSeFWz-fzMGoxCR?usp=sharing', 'Luas Ruang area Perpustakaan Terbatas', 'Tidak Terpenuhi Sesuai Standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 161, 'belum selesai', '2025-01-06 06:08:30', '2025-01-06 06:08:30'),
(206, 'Sudah Terpenuhi', 'https://drive.google.com/file/d/13d_2P4WJyJmdRnZjUZoIFc9xu3h1SwAN/view?usp=sharing', 'Jika Mencakup Luas Area Loker, Toilet, Lift dll minimal 75 m sudah terpenuhi', 'Terpenuhi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 162, 'belum selesai', '2025-01-06 06:18:51', '2025-01-06 06:18:51'),
(207, 'Sudah Terpenuhi, namun kecepatan internet di UPA PERPUSTAKAAN sering Logout/Lemot', 'https://drive.google.com/drive/folders/1AxvOetNx_4Vn4tWULEJqLaBzgbPfmIh2?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 187, 'belum selesai', '2025-01-06 06:26:33', '2025-01-06 06:26:33'),
(208, 'Tercapai/Tersedia', 'https://drive.google.com/drive/folders/1GXrEbd2Co2CmsRMy3iSKfY2skqJW2CAN?usp=sharing', 'Ruang Tersedia namun masih terbatas dengan luas area yang sesuai standar', 'Terbatas dalam penggunaannya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 163, 'belum selesai', '2025-01-06 06:39:10', '2025-01-06 06:39:10'),
(209, 'Ruang terjaga dan bersih', 'https://drive.google.com/drive/folders/1GXrEbd2Co2CmsRMy3iSKfY2skqJW2CAN?usp=sharing', 'OB diruang Perpustakaan yang Rajin/Sigap dan Cekatan', 'Ruangan Bersih dan Nyaman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 164, 'belum selesai', '2025-01-06 06:41:11', '2025-01-06 06:41:11'),
(210, 'tersedia namun tidak memenuhi standar Perpusnas dari luas ruangan', 'https://drive.google.com/drive/folders/1GXrEbd2Co2CmsRMy3iSKfY2skqJW2CAN?usp=sharing', 'Hanya 1 Lantai Dasar yang digunakan saat ini untuk perpustakaan', 'tidak terpenuhinya kriteria yang sesuai standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 190, 'belum selesai', '2025-01-06 06:46:11', '2025-01-06 06:46:11'),
(211, 'Semua Civitas Akademika PNJ secara otomatis terdaftar dalam anggota perpustakaan PNJ, sehingga total anggota perpustakaan berjumlah 35070', 'https://drive.google.com/file/d/1dHobnlj1LSAPh4aeb1YqQPyPW9syrzFi/view?usp=sharing', 'Otomatis', 'memudahkan Civitas akademika/pemustaka dilingkungan PNJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 199, 'belum selesai', '2025-01-06 06:53:41', '2025-01-06 06:53:41'),
(212, 'Dosen dan Tendik secara otomatis sudah terdftar menjadi anggota perpustakaan PNJ', 'https://drive.google.com/file/d/1dHobnlj1LSAPh4aeb1YqQPyPW9syrzFi/view?usp=sharing', 'Terupdate secara otomatis oleh UPATIK', 'Memudahkan Pemustaka dilingkungan PNJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 200, 'belum selesai', '2025-01-06 06:57:51', '2025-01-06 06:57:51'),
(213, 'Survey Kepuasan tahun 2024 sudah dilaksanakan', 'https://drive.google.com/drive/folders/1FSPH_2FMHUbbch71tHD7C9dCzt_r6yYZ?usp=sharing', 'Kuesioner hanya terbatas sebanyak 254 Responden', 'Belum maksimal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 191, 'belum selesai', '2025-01-06 07:03:01', '2025-01-06 07:03:01'),
(214, 'dari segi sarana dan prasarana terdapat peningkatan', 'https://drive.google.com/drive/folders/1-Vrx7sxJIi1fJkTzBegFCv9RhQjDi082?usp=sharing', 'Seperti kelengkapan meubeler di ruang rapat dan audivisualnya (TV), layanan Bebas Pustaka Online, Dibukanya Kelas Merajut', 'Memberikan suasana yang nyaman, dan pilihan kegiatan atau layanan yang ada di Perpustakaan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 192, 'belum selesai', '2025-01-06 07:10:23', '2025-01-06 07:10:23'),
(215, 'UPA Perpustakaan menerima Kunjungan dari Pemsutaka diluar Keanggotaan', 'https://drive.google.com/drive/folders/1izwxk64wyvKCu-ozD04tHn3RwgEqhr5L?usp=sharing', 'Kebutuhan Pemustaka diluar anggota Perpustakaan', 'dibukanya layanan kunjungan untuk non anggota', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 193, 'belum selesai', '2025-01-06 07:20:32', '2025-01-06 07:20:32'),
(216, 'Tersedianya sistem otomasi peminjaman dan pengembalian buku menggunakan SLIMS', 'https://opac.pnj.ac.id/', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 194, 'belum selesai', '2025-01-06 07:23:05', '2025-01-06 07:23:05'),
(217, 'Tersedianya Sistem Penelusuran secara otomasi (OPAC) koleksi buku dan tersedianya Katalog Manual untuk alat bantu penelusuran di Ruang Referensi (Tugas Akhir/Skripsi)', 'https://opac.pnj.ac.id/', 'Pengolahan buku yang sudah tersistem yang mengikuti standar internasional (DDC) dan data koleksi tersimpan secara digital menggunakan SLIMS', 'Mudah untuk di telusuri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 195, 'belum selesai', '2025-01-06 07:31:02', '2025-01-06 07:31:02'),
(218, 'terdapat dosen yang magang lebih dari 2', 'https://drive.google.com/file/d/13qWY0dxJjV-dUys6mRDthbvcxuurIs5w/view?usp=drive_link', 'terpenuhi', 'terpenuhi', 'Terdapat lebih dari 2 dosen magang di industri per tahun', 'SK terkait dengan dosen magang di industri didokumentasikan dengan lengkap', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/13qWY0dxJjV-dUys6mRDthbvcxuurIs5w/view?usp=drive_link', 2, 2, NULL, 11, 462, 'belum selesai', '2025-01-06 07:31:23', '2025-01-07 07:01:24'),
(219, 'Tersedianya informasi terkait koleksi e-book, e-journal, dan informasi lainnya yang terkait dengan layanan perpustakaan, sedangkan informasi offline juga dsediakan seperti banner, brosur, katalog TA/Skripsi dengan batas tahun sampai dengan 2020 dll', 'https://perpustakaan.pnj.ac.id/', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 196, 'belum selesai', '2025-01-06 07:36:18', '2025-01-06 07:36:18'),
(220, 'UPA Perpustakaan PNJ telah bergabung dengan jejaring indonesia one search', 'https://onesearch.id/', 'Masih kurang terpublikasi dengan baik, walaupun sudah tersedia juga pada web perpustakaan', 'kurang diminati pemustaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 197, 'belum selesai', '2025-01-06 07:42:35', '2025-01-06 07:42:35'),
(221, 'terdapat 2 kelas industri per tahun Formosa, SBI dan Badak', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'terpenuhi', 'terpenuhi', 'sudah ada 2 yakni sbi dan badak', 'bisa ditingkatkan jumlah kerjasama', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 2, 2, NULL, 11, 460, 'belum selesai', '2025-01-06 07:48:58', '2025-01-07 09:27:06'),
(222, 'Sudah tercapai, khsusunya pada kelas CCIT UI', 'https://drive.google.com/file/d/1o1vlEIv624iglEOYHoxDLLGt6ofO7pan/view?usp=drive_link', 'tercapai, akan tetapi data sertifikat tidak dipegang oleh PNJ', 'PNJ tidak memiliki dokumentasi', 'beberapa program studi sudah melakukan uji kompetensi agar setiap lulusan bisa mendapatkan sertifikat kompetensi tetapi belum untuk semua mahasiswa', 'perlu ada koordinasi dengan bidang BNSP', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1o1vlEIv624iglEOYHoxDLLGt6ofO7pan/view?usp=drive_link', 1, 2, NULL, 11, 463, 'belum selesai', '2025-01-06 07:53:19', '2025-01-07 07:29:53'),
(223, 'Jumlah peserta pelatihan yang diselenggarakan bersama DUDI melebihi 50 orang per tahun, dari berbagai industri, diantaranya Pelatihan Badak, Wings', 'https://drive.google.com/file/d/1AeG8YofhdhJTNq1NV5duNWZHf0tmg1SG/view?usp=drive_link', 'Sudah terpenuhi', 'terpenuhi', 'peserta pelatihan dari pegawai yang berasal dari beberapa industri lebih dari 50 peserta', 'sudah sangat baik', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1AeG8YofhdhJTNq1NV5duNWZHf0tmg1SG/view?usp=drive_link', 2, 3, NULL, 11, 465, 'belum selesai', '2025-01-06 08:02:37', '2025-01-07 09:33:27'),
(224, 'Dosen dan tendik yang terlibat dalam kerja sama >25%', 'https://drive.google.com/file/d/1Xal7FNhJNdK9ebTid2t5LIYuJvYb0517/view?usp=drive_link', 'terpenuhi', 'terpenuhi', 'sumber daya manusia yang ada dibidang kerjasama berasal dari PNJ', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1Xal7FNhJNdK9ebTid2t5LIYuJvYb0517/view?usp=drive_link', 2, 3, NULL, 11, 430, 'belum selesai', '2025-01-06 08:04:40', '2025-01-07 06:58:00'),
(225, 'tidak memenuhi', 'https://0.com', 'beberapa industri yang melakukan kerjasama tidak bisa menerbitkan sertkfikat kompetensi', 'tidak ada sertifikat kompetensi yang terbit', 'Kondisi saat ini Persentase jumlah dosen tersertifikasi hasil dari kerja sama dibanding total seluruh mahasiswa >10% karena industri kerjasama tidak bisa mengeluarkan sertifikasi kompetensi', 'Data perlu dicek ke bidang WD 1', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 11, 464, 'belum selesai', '2025-01-06 08:08:25', '2025-01-07 07:36:12'),
(226, '>10 hasil riset terapan yang diselenggarakan bersama DUDI dalam 1 tahun', 'https://drive.google.com/file/d/1ONRx7tk2RnKgV0ZKI13rbLLOd5t_WXgO/view?usp=drive_link', 'terpenuhi', 'terpenuhi', 'sudah tercapai cuma file yang dilampirkan belum lengkap dibidang kerjasama karena datanya bersifat etika dan rahasiswa karena permintaan data perlu meminta kebidang UP2M', 'sudah baik', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1ONRx7tk2RnKgV0ZKI13rbLLOd5t_WXgO/view?usp=drive_link', 1, 3, NULL, 11, 466, 'belum selesai', '2025-01-06 08:11:44', '2025-01-07 07:34:55'),
(227, 'mahasiswa yang mendapat beasiswa dari DUDI > 30 per tahun, kerjasama dengan PT Badak, SBI, Gojek, Baznas.', 'https://docs.google.com/document/d/1xfdMqWTQjUUrqFD7SXnbF9FgZ-YSnWZM/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 'tercapai', 'tercapai', 'Kondisi saat ini umlah mahasiswa yang mendapat beasiswa dari DUDI > 30 per tahun', 'Dipertertahankan dan ditingkatkan. Semua perjanjian kerjasama didokumentasikan dengan baik sehingga semua perjanjian kerjasama terdokumentasi', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://docs.google.com/document/d/1xfdMqWTQjUUrqFD7SXnbF9FgZ-YSnWZM/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 2, 2, NULL, 11, 468, 'belum selesai', '2025-01-06 08:19:36', '2025-01-07 09:38:40'),
(228, 'valuasi dari CSR DUDI >500 juta per tahun, seperti dari SBI, Badak dan Pertamina Oses', 'https://drive.google.com/file/d/1uERPgGRKrvULlmfWLK-ae_HKGWDvMF1_/view?usp=drive_link', 'terpenuhi', 'terpenuhi', 'Kondisi saat ini terkait dengan Total valuasi dari CSR DUDI >500 juta per tahun sudah melampaui 1,2 milyar di lokasi narogong dan 1,3 milyar di lokasi Cilacap', 'Total valuasi dari CSR DUDI >500 juta per tahun dipertahankan dan ditingkatkan', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1uERPgGRKrvULlmfWLK-ae_HKGWDvMF1_/view?usp=drive_link', 3, 3, NULL, 11, 469, 'belum selesai', '2025-01-06 08:24:03', '2025-01-07 08:07:47'),
(229, 'Perpanjangan/addendum MoU/PKS dibandingkan MoU/PKS yang akan/telah kadaluwarsa >30%, seperti dengan CCIT, Badak, SBI, BJBSyariah.', 'https://drive.google.com/file/d/1SjoiMpFD_tLt5ksvgovTKhxafnBBMOLW/view?usp=drive_link', 'terpenuhi', 'terpenuhi', 'semua kelas kerjasama sudah diperpanjang', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1SjoiMpFD_tLt5ksvgovTKhxafnBBMOLW/view?usp=drive_link', 2, 3, NULL, 11, 470, 'belum selesai', '2025-01-06 08:26:56', '2025-01-07 09:40:36'),
(230, 'jumlah peserta pelatihan kerjasama dengan DUDI (atau menggunakan biaya pelatihan perorang berdasarkan LPDP Rp 6 juta per orang)', 'https://drive.google.com/file/d/1AdcdO1VU58bBQe0flVPI4ONrZAfGEHQD/view?usp=drive_link', 'terpenuhi', 'terpenuhi', 'Kondisi saat ini Valuasi jumlah peserta pelatihan kerjasama dengan DUDI (atau menggunakan biaya pelatihan perorang berdasarkan LPDP Rp 6 juta per orang)', 'Dipertahankan dan dilengkapkan', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1AdcdO1VU58bBQe0flVPI4ONrZAfGEHQD/view?usp=drive_link', 2, 2, NULL, 11, 479, 'belum selesai', '2025-01-06 08:50:24', '2025-01-07 09:47:01'),
(231, 'Valuasi riset terapan yang dilakukan bersama DUDI (rupiah pembiayan riset) Rp2.000.000.000,-', 'https://drive.google.com/file/d/1ol_1SUIWmkGn_AVATnF9z8GCUM0zLDvS/view?usp=drive_link', 'terpenuhi', 'terpenuhi', 'Valuasi riset terapan yang dilakukan bersama DUDI (rupiah pembiayan riset) Rp2.000.000.000,-', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1ol_1SUIWmkGn_AVATnF9z8GCUM0zLDvS/view?usp=drive_link', 2, 2, NULL, 11, 480, 'belum selesai', '2025-01-06 08:54:48', '2025-01-07 09:42:04'),
(232, 'Valuasi kerjasama > 8M, diantaranya Badak 5,7M, SBI 2,7M dan Baznas 30Juta, dll.', 'https://docs.google.com/document/d/1xfdMqWTQjUUrqFD7SXnbF9FgZ-YSnWZM/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 'terpenuhi', 'terpenuhi', 'Valuasi kerjasama > 8M, diantaranya Badak 5,7M, SBI 2,7M dan Baznas 30Juta, dll.', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://docs.google.com/document/d/1xfdMqWTQjUUrqFD7SXnbF9FgZ-YSnWZM/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 2, 2, NULL, 11, 481, 'belum selesai', '2025-01-06 08:59:47', '2025-01-07 09:49:25');
INSERT INTO `instrumen_audits` (`id`, `deskripsi_temuan`, `bukti`, `akar_penyebab`, `akibat`, `temuan_audit`, `rekomendasi_auditor`, `penanggung_jawab`, `rencana_perbaikan`, `tanggapan_auditee`, `jadwal_penyelesaian`, `link`, `id_status_tercapai`, `id_status_temuan`, `id_status_akhir`, `id_AMI`, `id_indikator`, `status_audit`, `created_at`, `updated_at`) VALUES
(233, 'tidak dapat mengidentifikasi, karena indikator seharusnya ada pada bidang Akademik.', 'https://0.com', 'proses PBL ada pada bidang akademik', 'tidak teridentifikasi', 'Kondisi saat ini terkait dengan indikator Valuasi Rupiah pembiayaan industri untuk Mata kuliah berbasis Project based learning (PjBL) lebih tepat ada pada bidang Akademik.', 'Kondisi saat ini terkait dengan indikator Valuasi Rupiah pembiayaan industri untuk Mata kuliah berbasis Project based learning (PjBL) lebih tepat ada pada bidang Akademik. dan Bidang kerjsama melakukan diskusi dengan bidang akademik', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://0.com', 1, 2, NULL, 11, 471, 'belum selesai', '2025-01-06 09:05:56', '2025-01-07 07:47:37'),
(234, 'TEFA belum berjalan optimal', 'https://0.com', 'masih dimanfaatkan sebagai lab penelitian, belum berskala industri', 'tidak dapat menghitung valuasi omset TEFA', 'TEFA sudah berjalan seperti SBI dan LNG Badak dari jurusan teknik mesin', 'koordinasi dengan bidang terkait untuk bisa mengetahui nilai omset yang dihasilkan', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://0.com', 1, 2, NULL, 11, 472, 'belum selesai', '2025-01-06 09:09:20', '2025-01-07 07:43:31'),
(235, 'Valuasi rupiah pembiayaan DUDI untuk kelas industri (UKT per tahun) > 7M', 'https://drive.google.com/file/d/1GgTcP-gWG1-xYYRqVBE_62tM2wJn1RsE/view?usp=drive_link', 'terpenuhi', 'terpenuhi', 'Valuasi rupiah pembiayaan DUDI untuk kelas industri (UKT per tahun) > 7M', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1GgTcP-gWG1-xYYRqVBE_62tM2wJn1RsE/view?usp=drive_link', 2, 3, NULL, 11, 474, 'belum selesai', '2025-01-06 09:32:18', '2025-01-07 09:54:48'),
(236, 'Valuasi honor magang dari DUDI 3,8juta/mahasiswa/bulan', 'https://drive.google.com/file/d/1Do_-ITtQwImQxDkH6hiYW4N1zG_BipHv/view?usp=drive_link', 'Honor magang mahasiswa mengikuti standar dari DUDI', 'rata- rata pendapatan honor magang bisa di atas atau di bawah UMR, sesuai karakter industri', 'kondisi honor magang masih dibawah UMR karena memang pengalaman untuk mendapatkan honor 4 juta cukup sulit', 'indikator perlu diturunkan mungkin bisa 1 atau 2 juta per bulan', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1Do_-ITtQwImQxDkH6hiYW4N1zG_BipHv/view?usp=drive_link', 1, 1, NULL, 11, 475, 'belum selesai', '2025-01-06 09:40:56', '2025-01-07 07:47:21'),
(237, 'Memiliki kolobaroasi dengan industri skala internasional seperti LiuGong', 'https://drive.google.com/file/d/1Do_-ITtQwImQxDkH6hiYW4N1zG_BipHv/view?usp=drive_link', 'tercapai', 'tercapai', 'sudah Memiliki kolobaroasi dengan industri skala internasional seperti LiuGong', 'sudah sesuai', NULL, NULL, NULL, NULL, 'https://drive.google.com/file/d/1Do_-ITtQwImQxDkH6hiYW4N1zG_BipHv/view?usp=drive_link', 2, 2, NULL, 11, 482, 'belum selesai', '2025-01-06 10:07:52', '2025-01-07 09:55:50'),
(238, 'Unit memiliki rencana operasional penjabaran dari renstra institusi. Permasalahan adalah jumlah SDM dan koordinasi', 'https://drive.google.com/drive/folders/1v2gxu7VLfq73J9KhCuT9sXvnFRsX9ClA?usp=drive_link', 'Support institusi perlu menjadi prioritas', 'capaian dan target tidak optimal', 'ada renstra unit (belum di sah kan)', '-', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1v2gxu7VLfq73J9KhCuT9sXvnFRsX9ClA?usp=drive_link', 2, 2, NULL, 2, 229, 'belum selesai', '2025-01-06 22:18:27', '2025-01-09 05:28:04'),
(239, 'kurang dari 80% dari program/kegiatan yang direncanakan terealisasi pada tahun yang sama.', 'https://docs.google.com/document/d/12SwchtScusutZNRVkURIufWJO6Qr7wGW/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'Support institusi perlu menjadi prioritas', 'realisasi tidak tecapai', 'resntra unit belum disahkan', 'segerah disahkan', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1v2gxu7VLfq73J9KhCuT9sXvnFRsX9ClA', 1, 1, NULL, 2, 230, 'belum selesai', '2025-01-06 22:21:16', '2025-01-09 05:28:37'),
(240, 'Sudah terdapat tugas fungsi dalam SK', 'https://drive.google.com/drive/folders/1fqZVycIFdwHIQHgjZvyi-Q_ZzmzY4pjf?usp=drive_link', 'detail mengenai wewenang dan koordinasi antar bidang', 'birokrasi lebih panjang', 'segera dibuat kan SK 2025', '-', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1fqZVycIFdwHIQHgjZvyi-Q_ZzmzY4pjf?usp=drive_link', 2, 2, NULL, 2, 231, 'belum selesai', '2025-01-06 22:24:39', '2025-01-09 05:36:10'),
(241, 'Terdapat bukti pelaksanaan dijalankan dengan konsisten', 'https://drive.google.com/drive/folders/1rNrFp9xRbtXXtfNYnGxmmCHW_0KHWcNX?usp=drive_link', 'Support institusi perlu menjadi prioritas', 'belum optimal capaiannya', 'ada bukti', 'tidak ada', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1rNrFp9xRbtXXtfNYnGxmmCHW_0KHWcNX?usp=drive_link', 2, 2, NULL, 2, 233, 'belum selesai', '2025-01-06 22:28:00', '2025-01-09 05:35:26'),
(242, 'Terdapat bukti kegiatan koordinasi di RTPU melalui rapat dan pertemuan untuk melaksanakan visi', 'https://drive.google.com/drive/folders/1N3pvfq_sK7AD9GKwGzPSuj7Qm7wm7VBo?usp=drive_link', 'kesibukan anggota dilaksanakan secara per-kasus', 'belum optimal capaiannya', 'masih draft', '-', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1N3pvfq_sK7AD9GKwGzPSuj7Qm7wm7VBo', 2, 1, NULL, 2, 234, 'belum selesai', '2025-01-06 22:32:36', '2025-01-09 05:39:16'),
(243, 'Sudah terdapat prosedur pelayanan civitas akademika berupa SOP maupun sistem', 'https://docs.google.com/spreadsheets/d/1BifPW4EZlH2eGDc9sQ0M_RtWggLrT8Gn/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'koordinasi antar bidang di kampus perlu dilaksanakan', 'belum tersosialisasi', 'masih draft', 'Butuh kegiatan sosialisai dan evaluasi', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/1BifPW4EZlH2eGDc9sQ0M_RtWggLrT8Gn/edit?gid=957027695#gid=957027695', 2, 1, NULL, 2, 235, 'belum selesai', '2025-01-06 22:36:51', '2025-01-09 05:45:27'),
(244, 'dilakukan pada rapat bidang kerjasama', 'https://drive.google.com/drive/folders/1heNWz2Ah35eZs4h9eh7C_AeY96EZ51aq?usp=drive_link', 'dilakukan di kuartal akhir dan tidak dihadiri semua stakeholder', 'belum semua stakeholder terinformasi', 'ada', 'tercapai , dengan kegiatan di gabung dengan kegiatan lain sehingga belum bisa dilakukan evaluasi secara optimal', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1heNWz2Ah35eZs4h9eh7C_AeY96EZ51aq?usp=drive_link', 2, 1, NULL, 2, 236, 'belum selesai', '2025-01-06 22:38:53', '2025-01-09 05:48:58'),
(245, 'Terdapat bukti pelaksanaan layanan sesuai prosedur berupa dokumen surat pengajuan', 'https://docs.google.com/spreadsheets/d/1GGp1wBcmHAjZcery2yi1SrOvXHFscyXW/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'saat ini prosedur dilakukan pada unit bisnis jasa pelatihan dan sertifikasi hanya saja birokrasi panjang', 'layanan memerlukan waktu', 'prosedur masih berupa draft', 'dilampirkan data pendukung seperti draft, pengajuan, review/ dll. Data pendukung sesuai dengan poin pada prosedur', NULL, NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/1GGp1wBcmHAjZcery2yi1SrOvXHFscyXW/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 2, 2, NULL, 2, 237, 'belum selesai', '2025-01-06 22:42:25', '2025-01-09 05:51:35'),
(246, 'Sudah dilakukan evaluasi prosedur', 'https://drive.google.com/drive/folders/1GsjchFYxn0qIVVIRRiy2YG8Mz3LUDPxt?usp=drive_link', 'perlunya koordinasi antar bidang', 'prosedur memiliki alur panjang', 'ada', 'belum ada evaluasi, hanya sosialisasi', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1GsjchFYxn0qIVVIRRiy2YG8Mz3LUDPxt?usp=drive_link', 2, 1, NULL, 2, 238, 'belum selesai', '2025-01-06 22:46:38', '2025-01-09 05:52:51'),
(247, 'terdapat bukti pengawasan melalui SOP', 'https://drive.google.com/drive/folders/14C7FcWiIS22Z_-_5yD13yH3aegYiTfgv?usp=drive_link', 'belum memiliki sistem QA/ ISO', 'belum terdapat standar', 'belum di sahkan', '-', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/14C7FcWiIS22Z_-_5yD13yH3aegYiTfgv?usp=drive_link', 2, 1, NULL, 2, 253, 'belum selesai', '2025-01-06 22:48:46', '2025-01-09 06:36:50'),
(248, 'Terdapat bukti pemasaran produk unggulan', 'https://drive.google.com/drive/folders/1-AhtXSIIennRW7spSGz2buFee5Aj_Rqy?usp=drive_link', 'belum ada pendanaan khusus didedikasikan untuk pemasaran', 'memiliki skala prioritas dalam pelaksanaan', 'ada', '-', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1-AhtXSIIennRW7spSGz2buFee5Aj_Rqy?usp=drive_link', 2, 2, NULL, 2, 254, 'belum selesai', '2025-01-06 22:50:55', '2025-01-09 06:37:57'),
(249, 'Luaran program tercatat dan terevaluasi', 'https://docs.google.com/document/d/1PbaoZhZM-pgVzHX5jbWF8QaqRYTjoMp9/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'evaluasi produk masih sebagian sudah dilaksanakan', 'pemasaran belum optimal', 'ada', '-', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://docs.google.com/document/d/1PbaoZhZM-pgVzHX5jbWF8QaqRYTjoMp9/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 2, 2, NULL, 2, 255, 'belum selesai', '2025-01-06 22:57:40', '2025-01-09 06:38:59'),
(250, 'terdapat bukti pelaksanaan program', 'https://drive.google.com/drive/folders/1gBM4S6HveeL_u8a3uXOTI1aVB1GltVZI?usp=drive_link', 'problem pada jumlah SDM dan birokrasi', 'pelaksanaan program rata-rata melibatkan SDM yang sudah terbiasa aktif dan birokrasi masih sering menemukan kendala timeline', 'ada', '-', NULL, NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1gBM4S6HveeL_u8a3uXOTI1aVB1GltVZI?usp=drive_link', 2, 1, NULL, 2, 246, 'belum selesai', '2025-01-06 23:08:38', '2025-01-09 06:23:20'),
(251, 'Luaran program tercatat dan terevaluasi', 'https://docs.google.com/document/d/1YGflYLfszfqwkVktLChrhYh2EBdLMSTX/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'evaluasi produk masih sebagian sudah dilaksanakan', 'pemasaran belum optimal', 'ada', 'sama seperti 5.1', NULL, NULL, NULL, NULL, 'https://docs.google.com/document/d/1YGflYLfszfqwkVktLChrhYh2EBdLMSTX/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 2, 2, NULL, 2, 247, 'belum selesai', '2025-01-06 23:10:36', '2025-01-09 06:25:04'),
(252, 'Terdapat list daftar sarana dan prasarana untuk income generator', 'https://drive.google.com/drive/folders/1WMEb5Q9g0J9MXDxnWAcZPHbNLp0jVWZC?usp=drive_link', 'keterbatasan sarana dan prasarana', 'capaian dan target tidak optimal', 'belum ada tempat yg tetap untuk bidang RTPU', 'perlu ditetapkan ruangan dan fasiltas khusus untuk RTPU', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1WMEb5Q9g0J9MXDxnWAcZPHbNLp0jVWZC?usp=drive_link', 2, 1, NULL, 2, 248, 'belum selesai', '2025-01-06 23:14:16', '2025-01-09 06:30:30'),
(253, 'Sarana prasarana yang sudah dimiliki telah dimanfaatkan', 'https://drive.google.com/drive/folders/14UE8z9LJ3l7_gJ-35WPNJQ-iMvhjSCYY?usp=drive_link', 'keterbatasan sarana dan prasarana', 'kesulitan pengelolaan', 'fasilitas sarana dan prasana RTPU belum tetap (masih berupa pemakaian bersama)', 'segera ditetapkan fasiltas khusus RTPU', NULL, NULL, NULL, NULL, 'https://drive.google.com/drive/folders/14UE8z9LJ3l7_gJ-35WPNJQ-iMvhjSCYY?usp=drive_link', 2, 1, NULL, 2, 249, 'belum selesai', '2025-01-06 23:16:41', '2025-01-09 06:40:24'),
(254, 'terdapat evaluasi layanan via online', 'https://drive.google.com/drive/folders/1VpLtqVZIGJNTbchUep1zcyeludQ5fNHw?usp=drive_link', 'tidak semua pihak melakukan pengulangan layanan (customized) untuk periode terbatas', 'sarana tidak termanfaatkan optimal', '-', 'rekapitulasi hasil pengukuran kepuasan', NULL, NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1VpLtqVZIGJNTbchUep1zcyeludQ5fNHw?usp=drive_link', 2, 2, NULL, 2, 250, 'belum selesai', '2025-01-06 23:20:57', '2025-01-09 06:33:30'),
(255, 'Terdapat hasil evaluasi', 'https://docs.google.com/document/d/1O8_32NZKF2THWNr7utGj6-7WzSamVL1K/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'umumnya masih bersifat survey', 'tidak tervalidasi info nyata', '-', 'hasil rekapitulasi pengukuran kepuasan', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://docs.google.com/document/d/1O8_32NZKF2THWNr7utGj6-7WzSamVL1K/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 2, 1, NULL, 2, 251, 'belum selesai', '2025-01-06 23:23:07', '2025-01-09 06:34:16'),
(256, 'Laporan kepuasan pemangku kepentingan sebagian terlaksana', 'https://docs.google.com/document/d/1O8_32NZKF2THWNr7utGj6-7WzSamVL1K/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'tidak semua program dapat dilakukan pengukuran karena keterbatasan waktu dan SDM', 'tidak semua laporan kepuasan layanan dimiliki oleh unit', 'ada', 'ada', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://docs.google.com/document/d/1O8_32NZKF2THWNr7utGj6-7WzSamVL1K/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 2, 2, NULL, 2, 252, 'belum selesai', '2025-01-06 23:25:23', '2025-01-09 06:36:28'),
(257, 'Terdapat dokumentasi pelaksanaan produksi Produk Unggulan', 'https://drive.google.com/drive/folders/10KhROZaYu2z4QDla-2sM5pRo-4SJnE9E?usp=drive_link', 'media yang digunakan sebagian sudah tersedia', '-', 'belum lengkap', '-', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/10KhROZaYu2z4QDla-2sM5pRo-4SJnE9E?usp=drive_link', 1, 1, NULL, 2, 239, 'belum selesai', '2025-01-06 23:30:27', '2025-01-09 05:55:10'),
(258, 'terdapat evaluasi layanan via online dan pengembangan produk unggulan', 'https://drive.google.com/drive/folders/191D-pn-CvkgQGYKK9UvGab8s9S3fEJgj?usp=drive_link', 'tidak semua produk diproduksi kembali (customized untuk periode terbatas)', 'tidak terlaksana bisnis lanjutan', 'ada namun belum lengkap', 'bisa dilampirkan LPJ, Hasil monev,', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/191D-pn-CvkgQGYKK9UvGab8s9S3fEJgj?usp=drive_link', 2, 1, NULL, 2, 240, 'belum selesai', '2025-01-06 23:33:21', '2025-01-09 06:02:05'),
(259, 'pengembangan dan pengelolaan terdapat dalam renstra unit', 'https://docs.google.com/document/d/1AYSSZul6iYQUC25meoAdm_Uywb-9D1KJ/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'belum detail dan terkait dengan unit/bidang lain', 'koordinasi masih belum optimal', 'ada', 'dalam bentuk draft REnstra Unit', NULL, NULL, NULL, NULL, 'https://docs.google.com/document/d/1AYSSZul6iYQUC25meoAdm_Uywb-9D1KJ/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 2, 1, NULL, 2, 241, 'belum selesai', '2025-01-06 23:42:10', '2025-01-09 06:04:43'),
(260, 'Terdapat bukti pelaksanaan pengembangan bisnis melalui pendidikan melalui penelitian atau pengabdian masyarakat', 'https://drive.google.com/drive/folders/173J490GcePyOViSMiVYk6TgxvE_S-puI?usp=drive_link', 'Sebagian produk merupakan hasil pengembangan penelitian pengabdian', 'tidak semua produk dilakukan pengembangan', 'berisi target dan achievment , dan hanya berupa fokus ke bidang Jasa', '-', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/173J490GcePyOViSMiVYk6TgxvE_S-puI?usp=drive_link', 2, 1, NULL, 2, 243, 'belum selesai', '2025-01-06 23:45:06', '2025-01-09 06:10:12'),
(261, 'Terdapat sistem pencatatan pendapatan', 'https://docs.google.com/spreadsheets/d/10zOGublQ2RUOCvjHn4qlKfXTd9g4Cw_S/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'masih menggunakan sistem sederhana', 'data belum ditampilkan secara grafis dan laporan', 'ada', '-', NULL, NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/10zOGublQ2RUOCvjHn4qlKfXTd9g4Cw_S/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 2, 2, NULL, 2, 244, 'belum selesai', '2025-01-06 23:47:07', '2025-01-09 06:15:32'),
(262, 'Terdapat bukti monitoring dan evaluasi program dan tingkat kepuasan user', 'https://docs.google.com/document/d/1ahv_1F_m2dxfjQjJ73CLdkMNn1dzOudB/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 'sebagian evaluasi sudah dilakukan', 'tidak semua monitoring program dapat ditindaklanjuti', 'ada', 'perlu rekapitulasi dari hasil data', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://docs.google.com/document/d/1ahv_1F_m2dxfjQjJ73CLdkMNn1dzOudB/edit?usp=drive_link&ouid=106969149622128126813&rtpof=true&sd=true', 2, 2, NULL, 2, 242, 'belum selesai', '2025-01-06 23:52:07', '2025-01-09 06:19:37'),
(263, 'Saat ini UPA Perpustakaan sudah memiliki Website Perpustakaan', 'https://perpustakaan.pnj.ac.id/', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 198, 'belum selesai', '2025-01-07 00:47:02', '2025-01-07 00:47:02'),
(264, 'Terpenuhi', 'https://perpustakaan.pnj.ac.id/', 'Media Promosi sudah dilakukan yang disesuaikan dengan kebutuhan', 'tersedianya berbagai macam media promosi seperti mading pengumuman, banner, web perpus, dll instagram', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 201, 'belum selesai', '2025-01-07 00:55:47', '2025-01-07 00:55:47'),
(265, 'adanya kebutuhan RTPU sebagai unit yang bertanggungjawab terhadap produk unggulan', 'https://drive.google.com/drive/folders/11dHsirsL5J2PrbiOo4nwii6bnAcb16JD?usp=drive_link', 'prosedur masih sebagian terlaksana', 'tidak semua program terlaksana optimal', 'ada', '-', NULL, NULL, NULL, NULL, 'https://drive.google.com/drive/folders/11dHsirsL5J2PrbiOo4nwii6bnAcb16JD?usp=drive_link', 2, 2, NULL, 2, 232, 'belum selesai', '2025-01-07 01:00:25', '2025-01-09 05:41:25'),
(266, 'terdapat bukti monitoring evaluasi', 'https://drive.google.com/drive/folders/1SC_-HSAhQIhqyIvc0exYXWsaaZzzI88f?usp=drive_link', 'evaluasi dilakukan untuk obyek peserta program', 'belum terdapat informasi masukan dari tim penyelenggara program', 'ada', 'perlu dokumen evaluasi', 'KA UPA Rekaya Teknologi dan Produk Unggulan', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1SC_-HSAhQIhqyIvc0exYXWsaaZzzI88f?usp=drive_link', 2, 1, NULL, 2, 245, 'belum selesai', '2025-01-07 01:05:39', '2025-01-09 06:21:07'),
(267, 'kegiatan promosi UPA Perpustakaan baru terlaksana beberapa kegiatan seperti, User education pada kegiatan PKKP, Bimbingan Pemustaka,', 'https://drive.google.com/drive/folders/1Gp9bZOch_v-rnmp3p5VR8C0Gw2ZeOwRs?usp=sharing', 'Terbatasnya SDM UPA Perpustakaan', 'Masih minim kegiatan promosi yang dilaksanakan, lebih fokus ke layanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 202, 'belum selesai', '2025-01-07 01:09:50', '2025-01-07 01:09:50'),
(268, 'Melaksanakan User education di kegiatan PKKP terkait layanan, sarana prasarana di UPA Perpustakaan, Bimbingan pemustaka', 'https://drive.google.com/drive/folders/1Gp9bZOch_v-rnmp3p5VR8C0Gw2ZeOwRs?usp=sharing', 'Jumlah SDM Perpustakaan masih terbatas', 'Literasi Informasi tidak terlaksana secara maksimal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 203, 'belum selesai', '2025-01-07 01:24:04', '2025-01-07 01:24:04'),
(269, 'kegiatan Literasi Informasi UPA Perpustakaan baru terlaksana beberapa kegiatan seperti, User education pada kegiatan PKKP, Bimbingan Pemustaka.', 'https://drive.google.com/drive/folders/1Gp9bZOch_v-rnmp3p5VR8C0Gw2ZeOwRs?usp=sharing', 'Kurangnya Jumlah SDM UPA Perpustakaan', 'Kegiatan Literasi Informasi belum dapat dilaksanakan sesuai standar yaitu 8 kegiatan pertahun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 204, 'belum selesai', '2025-01-07 01:27:22', '2025-01-07 01:27:22'),
(270, 'UPA Perpustakaan melakukan himbauan tertulis pada media banner kepada pemustaka tentang anti plagiarisme', 'https://drive.google.com/drive/folders/1ykQ6IZfY4DIykRj4Cs_Btchofqo2V4_6?usp=sharing', 'secara pengelolaan sistem/aplikasi plagiarisme (turnitin) merupakan wewenang PPPM dan secara Teknis Verifikasi dilaksanakan oleh Admin Turnitin masing-masing jurusan', 'UPA Perpustakaan jarang melayani pemustaka khususnya mahasiswa PNJ  terkait Layanan Plagiarisme', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 205, 'belum selesai', '2025-01-07 01:45:02', '2025-01-07 01:45:02'),
(271, 'Pengunjung Perpustakaan tahun 2024 belum mencapai minimal 8.000 orang per tahun namun jika dibandingkan dengan tahun 2023 jumlah pengunjung di tahun 2024 sangat signifikan kenaikan jumlah pengunjungnya', 'https://drive.google.com/drive/folders/1orl0ntj2pSOydrBKrvMvu1NumO-6PTZq?usp=sharing', 'Kapasitas ruangan yang masih minim yang hanya di gunakan lantai dasar gedung perpustakaan', 'tidak menampung pengunjung/pemustaka yang datang ke perpustakaan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 206, 'belum selesai', '2025-01-07 01:56:28', '2025-01-07 01:56:28'),
(272, 'saat ini UPA Perpustakaan memiliki KubacaPNJ, dimana Jumlah Koleksinya masih terbatas yaitu 300 Judul', 'https://drive.google.com/file/d/1rDICgeB_XFneRfMFBDJdHPWtHhe9pTo3/view?usp=sharing', 'koleksi buku terbatas', 'banyak yang masih menggunakan teksbook', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 207, 'belum selesai', '2025-01-07 02:41:09', '2025-01-07 02:41:09'),
(273, 'Koleksi bahan pustaka yang tersedia sudah kurang update, dikarenakan beberapa tahun ini pengadaan fokus kepada koleksi digital e-book, dan data peminjaman buku tidak terbackup saat migrasi sistem atau update sistem (SLIMS versi 9 Bulian)', 'https://drive.google.com/file/d/1qq6UHj0Ea7k0FmiM01qCqtTipVdEyl4O/view?usp=sharing', 'koleksi yang tersedia tidak update atau koleksi cetakan lama dan tidak terbackup saat migrasi sistem atau update sistem (SLIMS versi 9 Bulian)', 'kurang peminat dan data kurang valid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 208, 'belum selesai', '2025-01-07 03:06:41', '2025-01-07 03:06:41'),
(274, 'Saat ini Kepala UPA Perpustakaan Belum Memiliki Sertifikasi Kompetensi Pustakawan tetapi sudah mengikuti BIMTEK Layanan Perpustakaan yang diselenggarakan oleh Perpusnas', 'https://drive.google.com/file/d/1qOXgeIBi_ex6Jx-LCKK2-fi2d6ZJ5eFS/view?usp=sharing', 'Kuota mengikuti sertifikasi dari perpusnas terbatas', 'Menunggu panggilan dari Perpusnas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 209, 'belum selesai', '2025-01-07 03:11:46', '2025-01-07 03:11:46'),
(275, 'Saat ini Kepala UPA Perpustakaan Berpendidikan S1', 'https://drive.google.com/file/d/1cQPx8yX02jIVHKDuPVuZlrfhozVB8W1U/view?usp=sharing', 'Belum Melanjutkan Studi ke S2', 'Belum memiliki Ijazah S2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 210, 'belum selesai', '2025-01-07 03:13:59', '2025-01-07 03:13:59'),
(276, 'Sudah Mengikuti Bimtek dan Pelatihan Terkait Pengembangan Pengelolaan Perpustakaan', 'https://drive.google.com/drive/folders/1nJcJMdhBY12lp9wq8rbavfwuaoDZq5j9?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 211, 'belum selesai', '2025-01-07 03:15:47', '2025-01-07 03:15:47'),
(277, 'Saat ini Jumlah Pustakawan di UPA Perpustakaan berjumlah 4 orang dan di bulan juni 1 orang pustakawan pensiun', 'https://drive.google.com/drive/folders/1VPJG0GzFhpx9i8sg5ynHKo0L-TkprC4W?usp=sharing', 'Kurangnya formasi terkait Pustakawan', 'Kurang Tenaga Pustakawan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 212, 'belum selesai', '2025-01-07 03:22:50', '2025-01-07 03:22:50'),
(278, 'Saat ini Tenaga Teknis di UPA Perpustakaan berjumlah 2 orang', 'https://drive.google.com/drive/folders/1HoXgqXbYbGg9Xeb8v1nceGJFE-DkJHvj?usp=sharing', 'Kurangnya formasi SDM di UPA Perpustakaan', 'Kurang Tenaga teknisnya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 213, 'belum selesai', '2025-01-07 03:29:00', '2025-01-07 03:29:00'),
(279, 'saat ini SDM di perpustakaan berjumlah 7 orang, namun yang bersertifikasi pustakawan belum ada', 'https://drive.google.com/file/d/1cfor-NnbULlEb-5STJ1zB284QzEn6tP5/view?usp=sharing', 'Belum ada kesempatan karena masih menunggu panggilan dari perpusnas, tahun 2023 salah satu sdm sudah bersertifikasi namun yang bersangkutan sudah mutasi.', 'Belum ada lagi SDM yang mengikuti sertifikasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 214, 'belum selesai', '2025-01-07 03:34:56', '2025-01-07 03:34:56'),
(280, 'rata-rata mengikuti kegiatan tersebut sudah memenuhi standar', 'https://drive.google.com/drive/folders/1ED2dJiO3G-sg9-Uh3_aI3j8yePz-F5yX?usp=sharing', 'Mengikuti kegiatan baik online maupun offline', 'Terpenuhi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 215, 'belum selesai', '2025-01-07 03:40:16', '2025-01-07 03:40:16'),
(281, 'Saat ini SDM di Perpustakaan belum ada yang memiliki Sertifkasi Kompetensi Pustakawan', 'https://drive.google.com/drive/folders/1ED2dJiO3G-sg9-Uh3_aI3j8yePz-F5yX?usp=sharing', 'Menunggu antrian/panggilan dari perpusnas', 'belum ada kesempatan mengikuti sertifikasi kompetensi pustakawan, yang diikuti masih terbatas seperti bimtek, pelatihan, seminar, webinar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 216, 'belum selesai', '2025-01-07 03:43:32', '2025-01-07 03:43:32'),
(282, 'Rasio SDM unit pengelola kemitraan dengan jumlah dokumen kerjasama aktif ≤ 1:20 yaitu 1:4', 'https://drive.google.com/drive/folders/1M4XrVvAtW09p-6MF7eqU5RayfclHT3dU?usp=drive_link', 'terpenuhi', 'terpenuhi', 'kondisi di bidang kerjasama masih belum sesuai dengan beban kerja jadi 1 sdm masih mengerjakan lebih dari 20 dokumen', 'segera mengajukan tambahan tenaga sdm', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1M4XrVvAtW09p-6MF7eqU5RayfclHT3dU?usp=drive_link', 2, 2, NULL, 11, 431, 'belum selesai', '2025-01-07 05:26:30', '2025-01-07 07:04:01'),
(283, 'Untuk data honor bidang kerjasama tidak memiliki pencatatan', 'https://0.com', 'data ada pada bidang keuangan dan umum', 'tidak dapat mengakses valuasi dengan nilai jumlah sesi/jam pelajaran x Rp 900 ribu', 'Kondisi saat ini Valuasi dosen/tenaga ahli dari DUDI (honor pengajar per sesi sesuai standar SBM (jumlah sesi/jam pelajaran x Rp 900 ribu) belum ada datanya di bagian kerjasama, karena data ada dibidang keuangan dan umum dan jurusan', 'Bidang Kerjasama tetap melakukan dokumentasi terkait dengan Valuasi dosen/tenaga ahli dari DUDI dan melakukan komunikasi dengan bagian keuangan dan jurusan', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 11, 473, 'belum selesai', '2025-01-07 05:47:40', '2025-01-07 07:59:13'),
(284, 'Kegiatan dosen magang telah dilaksanakan di tahun 2024, salah satunya dengan PT Badak NGL, akan tetapi valuasi honor sesuai SBU ada pada bidang keuangan', 'https://0.com', 'data ada pada bidang keuangan dan umum', 'tidak dapat mengakses valuasi honor dosen magang atau sesuai SBU (Rp 6 juta/bulan.dosen)', 'ada beberapa dosen yang sudah magang di LNG Badak', 'bidang kerjasama perlu punya data info terkait dengan penhonoran', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 11, 476, 'belum selesai', '2025-01-07 05:59:49', '2025-01-07 07:53:49'),
(285, 'Saat ini belum ada data sertifikasi dengan nilai Rp500.000,- per mahasiswa', 'https://0.com', 'Data valuasi sertifikasi ada pada bidang akademik dan jurusan', 'Bidang kerjasama tidak dapat menyediakan data dimaksud', 'data yang disampaikan indikator sebenaranya sudah ada akan tetapi bidang terkait belum mengumpulkan data', 'bidang kerjasama perlu mengumpulkan data data lulusan yang yang melakukan sertifikasi kompetensi', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 11, 477, 'belum selesai', '2025-01-07 06:04:26', '2025-01-07 07:58:59'),
(286, 'PNJ dijadikan center dari kerjasama pendidikan Cina - Indonesia.', 'https://docs.google.com/document/d/1b2mUmw6kZx0VDnsU962Disb9rOys_ITI/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 'tercapai', 'tercapai', 'pnj sudah kerjasama dengan cina', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://docs.google.com/document/d/1b2mUmw6kZx0VDnsU962Disb9rOys_ITI/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 2, 2, NULL, 11, 483, 'belum selesai', '2025-01-07 06:13:41', '2025-01-07 09:58:54'),
(287, 'Cukup memadai untuk melakukan kerjasama dengan mitra, akan tetapi sarana dan prasarana belum tergolong mutakhir', 'https://drive.google.com/file/d/1IM8fADBwVHybakp6-Ih9cB5RS4rcuXAd', 'keterbatasan anggaran', 'sarana dan prasarana belum mendukung implementasi kegiatan kerjasama secara optimal', 'Sarana dan prasarana belum mendukung kegiatan kerjasama secara optimal', 'link terkait dengan bukti dukung sarana dan prasarana dirubah statusnya karena auditor tidak bisa membuka linknya.', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1IM8fADBwVHybakp6-Ih9cB5RS4rcuXAd', 2, 2, NULL, 11, 432, 'belum selesai', '2025-01-07 06:29:30', '2025-01-07 07:11:05'),
(288, 'Telah ada alokasi anggaran kemitraan tahunan dibagi total anggaran PTV <6%', 'https://drive.google.com/file/d/17YkufZrRPKKAXpAlh6ogE75sAT8sC5kZ/view?usp=drive_link', 'Pengajuan anggaran bidang kerjasama tidak semua disetujui pimpinan', 'nilai total anggaran bidang kerjasama lebih kecil dari 6%', 'Kondisi saat ini terkait dengan nilai total anggaran bidang kerjasama lebih kecil dari 6%', 'Membuat program kerja/kegiatan yang lebih terstruktur dan terukur. dan mendokumentasikan seluruh SK Kegiatan yang sudah disetujui sehingga total anggaran bidang kerjasama yang disetujui terdata', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/17YkufZrRPKKAXpAlh6ogE75sAT8sC5kZ/view?usp=drive_link', 1, 1, NULL, 11, 433, 'belum selesai', '2025-01-07 06:38:27', '2025-01-07 07:21:07'),
(289, 'Sangat Visioner', 'https://simkerma.pnj.ac.id/', 'Jumlah mitra kerjasama LN dan DN telah memenuhi target indikator kinerja direktur', 'dapat mendukung visi Direktur', 'Kondisi saat ini standar Kepemimpinan : 1. Kapasitas 2. Komitmen 3. Keterlibatan Sangat visioner dan memiliki visi yang jelas dan terukur', 'dipertahankan dan ditingkatkan', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://simkerma.pnj.ac.id/', 2, 2, NULL, 11, 434, 'belum selesai', '2025-01-07 06:43:13', '2025-01-07 10:00:26'),
(290, 'saat ini sdm upa perpustakaan yang terdaftar dalam anggota profesi berjumlah 3 orang', 'https://drive.google.com/file/d/15Uzo3UnVcWNvv9a3kah4tuG9U8hr_Z1-/view?usp=sharing', 'sdm yang lain belum lama bergabung dan belum mendaftar sebagai anggota profesi pustakawan', 'belum sesuai standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 217, 'belum selesai', '2025-01-07 06:45:37', '2025-01-07 06:45:37'),
(291, 'Kepemimpinan memiliki kapasitas, komitmen dan keterlibatan sangat tinggi', 'https://simkerma.pnj.ac.id/', 'Kerjasama DN dan LN dibangun dan dikelola dengan komitmen yang sangat tinggi', 'dapat mendukung visi Direktur', 'sudah sesuai', 'sudah sangat baik', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://simkerma.pnj.ac.id/', 1, 2, NULL, 11, 435, 'belum selesai', '2025-01-07 06:47:05', '2025-01-07 07:37:17'),
(292, 'UPA Perpustakaan mempunyai Renstra Tahun 2020 - 2024 yang mengacu pada Renstra Politeknik Negeri Jakarta tahun 2020-2024,', 'https://drive.google.com/file/d/1i9_4Of4SwEN_iLYgSt3j6HcC5reCR2zI/view?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 218, 'belum selesai', '2025-01-07 06:49:38', '2025-01-07 06:49:38'),
(293, 'Laporan Kinerja Tahun 2024 Sudah di Laporkan Ke Pimpinan', 'https://drive.google.com/file/d/1B3Qey2rlBN6W-hkU9LJXJfn5s9bGSwFM/view?usp=sharing', 'Laporan Tahunan', 'Tersedia Laporan Tahunan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 219, 'belum selesai', '2025-01-07 06:51:27', '2025-01-07 06:51:27'),
(294, 'Terdapat target kinerja kemitraan yang jelas dalam perjanjian kinerja pimpinan dan pimpinan unit', 'https://drive.google.com/file/d/1kXe2GSbJMUotngM5npItHwJA_bUGdx1-/view?usp=drive_link', 'memiliki Perjanjian Kinerja', 'dapat mendukung visi Direktur', 'sudah terdapat target kinerja kemitraan yang jelas dalam perjanjian kinerja pimpinan dan pimpinan unit', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1kXe2GSbJMUotngM5npItHwJA_bUGdx1-/view?usp=drive_link', 2, 2, NULL, 11, 436, 'belum selesai', '2025-01-07 06:52:39', '2025-01-07 10:06:03'),
(295, 'Sudah dilakukan kegiatan pemantauan dan pengawasan secara periodik (3 bulan sekali)', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'monitoring dan evaluasi dilakukan setiap triwulan', 'dapat memonitor capaian kinerja', 'pimpinan sedang memulai program terkait evaluasi bidang kerjasama yang akan dilakukan 3 bulan 1 kali', 'sudah sesuai', NULL, NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 2, 2, NULL, 11, 437, 'belum selesai', '2025-01-07 06:56:30', '2025-01-07 07:14:36'),
(296, 'Belum ada penambahan dana partisipasi, namun info terbaru adanya rencana penyekatan ruang perpustakaan dilantai 1 dan 2 berasal dari dana CSR Bank Syariah Indonesia', 'https://drive.google.com/drive/folders/14MNPDdbogKR9yrOWVLYIJf9jeUSHLhtQ?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 220, 'belum selesai', '2025-01-07 07:00:24', '2025-01-07 07:00:24'),
(297, 'Saat ini kerjasama yang dilakukan hanya dengan Perpusnas dan Perpustakaan Universitas Brawijaya', 'https://drive.google.com/drive/folders/1ho6_iHqhUBTazplB2SizqyuHVFVQDWfF?usp=sharing', 'Belum ada Kegiatan yang bisa dijadikan kerjasama antara perpustakan Perguruan Tinggi', 'belum tercapai minimal jumlah kerjasama sesuai standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 221, 'belum selesai', '2025-01-07 07:07:23', '2025-01-07 07:07:23'),
(298, 'Kemitraan sudah tercantum pada seluruh komponen renstra', 'https://drive.google.com/drive/folders/1M4XrVvAtW09p-6MF7eqU5RayfclHT3dU?usp=drive_link', 'Tata kelola organisasi  cukup baik, Arah kemitraan sesuai target renstra, dokumen kerjasama tersedia, Rencana kerja kemitraan sudah disusun', 'keberadaan unit kerjasama telah sesuai dengan seluruh komponen renstra', 'sudah sesuai', 'sudah cukup baik', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1M4XrVvAtW09p-6MF7eqU5RayfclHT3dU?usp=drive_link', 2, 2, NULL, 11, 438, 'belum selesai', '2025-01-07 07:07:50', '2025-01-07 08:05:46'),
(299, 'sudah lebih dari 90% kerja sama memiliki MoU/MoA/PKS', 'https://simkerma.pnj.ac.id/', 'Implementasi kerjasama selalu diikuti dengan MoU/MoA/PKS', 'Dokumen kerjasama terdokumentasi dengan baik.', 'dokumen kerja sama dalam bentuk MoU/MoA/PKS sudah terdata dengan baik', 'sudah baik', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://simkerma.pnj.ac.id/', 2, 2, NULL, 11, 439, 'belum selesai', '2025-01-07 07:10:47', '2025-01-07 08:08:10'),
(300, 'Telah terdapat Rencana kerja tahunan kemitraan yang lengkap mencakup program, anggaran, dan target kinerja (KPI/OKR)', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'Kegiatan kemitraan disusun berdasarkan rencana kinerja', 'Rencana kerja kemitraan  dapat berjalan dengan baik', 'Kondisi saat ini sudah  Terdapat Rencana kerja tahunan kemitraan yang lengkap mencakup program, anggaran, dan target kinerja', 'Laporan Rencana kerja tahunan kemitraan yang lengkap mencakup program, anggaran, dan target kinerja disusun tetap waktu', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 2, 2, NULL, 11, 440, 'belum selesai', '2025-01-07 07:13:06', '2025-01-07 08:18:52'),
(301, 'tidak ada unit kemitraan yang berada di level setara Wadir khusus Kerjasama', 'https://0.com', 'sesuai dengan Organisasi dan Tata kelola', 'unit kemitraan berada di bawah Wadir khusus kerjasama', 'Indikator \"Ada unit kemitraan yang berada di level setara Wadir khusus Kerjasama\" kurang tepat karena tidak Ada unit kemitraan yang berada di level setara Wadir khusus Kerjasama', 'indikator \"Ada unit kemitraan yang berada di level setara Wadir khusus Kerjasama\" ditinjau ulang', 'KA PPMPP', NULL, NULL, NULL, 'https://0.com', 2, 2, NULL, 11, 441, 'belum selesai', '2025-01-07 07:14:35', '2025-01-07 08:30:36'),
(302, 'Saat ini UPA Perpustakaan tergabung dalam anggota FPPTI DKI Jakarta', NULL, 'belum ada kerjasama anatar UPA Perpustakaan dengan pihak eksternal', 'Tidak terpenuhinya standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 222, 'belum selesai', '2025-01-07 07:16:30', '2025-01-07 07:16:30'),
(303, 'Bidang kerjasama memiliki aturan, kebijakan dan prosedur kemitraan', 'https://drive.google.com/drive/folders/1krSwBavNC_POu8RApAN9QxLJI72wHoLw?usp=drive_link', 'adanya SOP, Pedoman', 'semua operasional kegiatan bidang kerjasama berjalan sesuai dengan tata kelola organisiasi', 'bidang kerjasama sudah memiliki Aturan & Kebijakan serta Prosedur kemitraan', 'sudah sesuai ada dilaporan kinerja', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1krSwBavNC_POu8RApAN9QxLJI72wHoLw?usp=drive_link', 2, 2, NULL, 11, 442, 'belum selesai', '2025-01-07 07:19:42', '2025-01-07 08:27:36'),
(304, 'Menghadiri rapat Rapimkap/Rapat Terkait Persiapan dan Pelaksanaan Akreditasi', 'https://drive.google.com/drive/folders/1OAFWHXCIqh-JFBC1LIXXzb5e0XVWV26S?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 223, 'belum selesai', '2025-01-07 07:22:55', '2025-01-07 07:22:55'),
(305, 'Telah memiliki pedoman/SOP kemitraan yang lengkap mulai perencanaan hingga monitoring evaluasi', 'https://drive.google.com/drive/folders/1krSwBavNC_POu8RApAN9QxLJI72wHoLw?usp=drive_link', 'Rapat pleno senat PNJ menghasilkan kebijakan salah satunya terkait proses kerjasama', 'sehingga ada turunan SOP dan Pedoman Kemitraan', 'bidang kerjasama sudah memiliki pedoman/SOP kemitraan yang lengkap mulai perencanaan hingga monitoring evaluasi', 'sudah sangat baik', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1krSwBavNC_POu8RApAN9QxLJI72wHoLw?usp=drive_link', 2, 2, NULL, 11, 443, 'belum selesai', '2025-01-07 07:27:29', '2025-01-07 08:34:28'),
(306, 'terdapat beberapa inovasi sarana prasana (ruang kreasi) dan inklusi perpustakaan', 'https://drive.google.com/drive/folders/1-Vrx7sxJIi1fJkTzBegFCv9RhQjDi082?usp=sharing', 'Minimnya pengetahuan pustakawan karena kegiatan pengembangan SDM Terbatas', 'Jumlah Inovasi yang dilakukan masih kurang dari standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 224, 'belum selesai', '2025-01-07 07:28:29', '2025-01-07 07:28:29'),
(307, 'Setiap prodi telah menjalin kemitraan dengan DUDI', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'Terdapat Indikator Kinerja Bidang Kejasama yang mewajibkan Prodi menjalin kerjasma dengan DUDI', 'Program Studi memiliki minimal 1 mitra DUDI', 'setiap prodi yang ada di PNJ sudah memiliki kerjasama dengan mitra dudi', 'sudah cukup baik', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 2, 2, NULL, 11, 444, 'belum selesai', '2025-01-07 07:36:01', '2025-01-07 08:54:26'),
(308, '>10% mitra telah memiliki cakupan global atau internasional', 'https://simkerma.pnj.ac.id/', 'visi PNJ untuk menjadi Politeknik berskala internasional dan berdaya saing bangsa', 'lebih dari 10% mitra telah mencakup skala global dan internasional', 'Keadaan saat ini >10% mitra memiliki cakupan global atau internasional', 'sudah terpenuhi', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://simkerma.pnj.ac.id/', 2, 2, NULL, 11, 445, 'belum selesai', '2025-01-07 07:37:52', '2025-01-07 09:04:14'),
(309, 'Keunikan yang dimiliki saat ini memiliki ruang kreatifitas dan pojok baca lesehan', 'https://drive.google.com/drive/folders/1PoRUJctrHip1OF8SccAv-2gon7vqtLgt?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 225, 'belum selesai', '2025-01-07 07:39:51', '2025-01-07 07:39:51'),
(310, 'data dosen dan tendik yang terlibat dalam kerja sama >25% terdapat pada bidang lain', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjad ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 374, 'belum selesai', '2025-01-07 07:50:49', '2025-01-09 01:25:19'),
(311, '100% Prodi telah memiliki kerja sama', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'tercapai', 'tercapai', 'Kondisi saat ini 100% Prodi memiliki kerja sama', 'Sudah memenuhi dan mencapai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 2, 2, NULL, 11, 446, 'belum selesai', '2025-01-07 07:52:25', '2025-01-07 09:10:38'),
(312, 'data Rasio SDM unit pengelola kemitraan dengan jumlah dokumen kerjasama aktif ≤ 1:20 terdapat pada bidang lain', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 375, 'belum selesai', '2025-01-07 07:52:33', '2025-01-09 01:25:53'),
(313, 'data >100% target pada rencana kerja di dalam dokumen kerjasama tercapai ada pada bidang lain', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 399, 'belum selesai', '2025-01-07 07:53:17', '2025-01-09 01:37:42'),
(314, 'data Persentase jumlah mata kuliah inti selaras industri dibandingkan total mata kuliah inti >80% ada pada bidang lain', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjad ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 400, 'belum selesai', '2025-01-07 07:54:20', '2025-01-09 01:38:04'),
(315, 'Prodi di PTPPPV memiliki minimal 10 kerja sama aktif', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'Setiap Prodi memiliki minimal 19 kerjasama aktif pada tahun 2024', 'terpenuhi', 'setiap prodi yang memiliki kerjasama dalam kondisi aktif lebih dari 10 kerjasama', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 2, 2, NULL, 11, 447, 'belum selesai', '2025-01-07 08:27:56', '2025-01-07 09:05:16'),
(316, 'Sudah lebih dari 70% prodi yang berjejaring dan menjalin kemitraan', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'kemitraan prodi sudah lebih dari 100%', 'terpenuhi', 'Dokumen Kemitraan yang memiliki kegiatan terhadap Jumlah Dokumen Kemitraan aktif totalnya 100%', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 2, 3, NULL, 11, 448, 'belum selesai', '2025-01-07 08:30:17', '2025-01-07 09:10:59'),
(317, 'MoA/PKS dan IA lebih dari 100% sesuai dengan target rencana kerjasama', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'MoA, PKS dan IA yang dibuat disesuaikan dengan rencana kerjasama', 'terpenuhi', 'Kondisi saat ini terkait dengan MoA, PKS dan IA yang dibuat disesuaikan dengan rencana kerjasama sudah tercapai', 'dipertahankan dan ditingkatkan', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 2, 2, NULL, 11, 449, 'belum selesai', '2025-01-07 08:32:28', '2025-01-07 09:18:26'),
(318, 'Sudah ada berupa monitoring dan evaluasi', 'https://drive.google.com/drive/folders/1LQSAu_kI6qaW1mSowFp9IcHPiGQnQbCT?usp=drive_link', 'evaluasi dengan mitra diatur dalam SOP kerjasama dan PKS dengan mitra', 'terpenuhi', 'Sudah ada aktivitas pembinaan hubungan kemitraan yang direncanakan secara bersama dengan mitra dalam berupa PKS', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/drive/folders/1LQSAu_kI6qaW1mSowFp9IcHPiGQnQbCT?usp=drive_link', 2, 2, NULL, 11, 450, 'belum selesai', '2025-01-07 08:40:29', '2025-01-07 09:13:26'),
(319, 'sudah 100% pelaksanaan kemitraan sesuai PKS', 'https://docs.google.com/spreadsheets/d/1tc68RVVmkjgGS2hy5PprCbmzv8VPsY3I/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 'PKS yang dibuat sesuai dengan rencana kerjasma dengan mitra', 'Pelaksanaan kemitraan sesuai dengan PKS', 'pelaksaan kegiatan dalam bentuk PKS sudah sesuai', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/1tc68RVVmkjgGS2hy5PprCbmzv8VPsY3I/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 2, 2, NULL, 11, 451, 'belum selesai', '2025-01-07 08:49:46', '2025-01-07 09:21:13'),
(320, 'Terdapat target dan pengukuran kinerja secara berkala dari setiap kerjasama', 'https://drive.google.com/file/d/1kXe2GSbJMUotngM5npItHwJA_bUGdx1-/view?usp=drive_link', 'ada Perjanjian Kinerja yang dibuat antara Direktur dan Wakil Direktur Bidang Kerjasama', 'terpenuhi', 'sudah ada target dan pengukuran kinerja secara berkala dari setiap kerjasama yang dimonitoring oleh wadir 4', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1kXe2GSbJMUotngM5npItHwJA_bUGdx1-/view?usp=drive_link', 2, 2, NULL, 11, 452, 'belum selesai', '2025-01-07 08:54:07', '2025-01-07 09:24:47'),
(321, 'Jumlah dokumen kerjasama aktif dalam setahun lebih dari 100', 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 'Tata Kelola Organisasi berjalan dengan baik dan komitmen pimpinan dalam membangun dan menjaga kerjasama dengan mitra', 'terpenuhi', 'Kondisi saat ini terkait dengan Jumlah dokumen kerjasama aktif dalam setahun lebih dari 100 yaitu 240', 'Dipertahankan dan ditingkatkan', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://drive.google.com/file/d/1FYzxf7gNCBnfu9ACMDMoOnRHhbimsbwZ/view?usp=drive_link', 3, 3, NULL, 11, 453, 'belum selesai', '2025-01-07 08:56:02', '2025-01-07 09:27:52'),
(322, 'dokumen kerja sama dibanding total dokumen kerja sama sudah lebih dari 80%', 'https://docs.google.com/spreadsheets/d/1tc68RVVmkjgGS2hy5PprCbmzv8VPsY3I/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 'Stake holder memiliki komitmen tinggi untuk melakukan dokumentasi', 'terpenuhi', 'Persentase dokumen kerja sama yang sudah terimplementasi lebih dari 80%', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/1tc68RVVmkjgGS2hy5PprCbmzv8VPsY3I/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 2, 2, NULL, 11, 454, 'belum selesai', '2025-01-07 09:03:59', '2025-01-07 09:37:01'),
(323, 'lebih dari 30% mahasiswa bekerja pada perusahaan yang telah bekerjasama dengan PNJ', 'https://docs.google.com/spreadsheets/d/1VNA7DUCm1517yuY8-Y4TCaGwzZx2mYso/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 'adanya komitmen industri untuk menyerap lulusan', 'terpenuhi', 'mahasiswa yang difasilitasi kelas kerjasama 100% bekerja pada perusahaan tersebut', 'sudah sesuai', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/1VNA7DUCm1517yuY8-Y4TCaGwzZx2mYso/edit?usp=drive_link&ouid=109558972100374705735&rtpof=true&sd=true', 2, 3, NULL, 11, 467, 'belum selesai', '2025-01-07 09:12:50', '2025-01-07 09:38:22'),
(324, 'Sertifikasi kompetensi dari mitra tidak bisa dilakukan, karena DUDI tidak memiliki kapasitas untuk menerbitkan sertifikasi kompetensi.', 'https://0.com', 'Sertifikasi Kompetensi ada pada LSP bukan dari industri', 'tidak dapat dihitung Valuasi', 'Valuasi dosen yang memperoleh sertifikasi kompetensi hasil kemitraan, (atau jumlah dosen x Rp 6 juta)', 'Dilakukan pendekatan ke mitra untuk dapat memberikan kontribusi untuk sertifikasi kompetensi ke dosen', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 11, 478, 'belum selesai', '2025-01-07 09:16:41', '2025-01-07 09:55:25'),
(325, 'belum dilakukan pengukuran dampak ekonomi di wilayah PTPVV terhadap kerjasama internasional', 'https://0.com', 'kekurangan sumber daya', 'tidak terpenuhi', 'belum ada pengukuran terkait dengan dampak perekonomian wilayah yang terdampak karena ada kehadiran PNJ', 'segera bisa menyusun pembuatan survey', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 11, 484, 'belum selesai', '2025-01-07 09:18:19', '2025-01-07 10:03:38');
INSERT INTO `instrumen_audits` (`id`, `deskripsi_temuan`, `bukti`, `akar_penyebab`, `akibat`, `temuan_audit`, `rekomendasi_auditor`, `penanggung_jawab`, `rencana_perbaikan`, `tanggapan_auditee`, `jadwal_penyelesaian`, `link`, `id_status_tercapai`, `id_status_temuan`, `id_status_akhir`, `id_AMI`, `id_indikator`, `status_audit`, `created_at`, `updated_at`) VALUES
(326, 'belum dilakukan pengukuran dampak ekonomi di wilayah PTPVV terhadap kerjasama internasional', 'https://0.com', 'kekurangan sumber daya', 'tidak terpenuhi', 'untuk indikator \"Mencakup wilayah nasional\" belum tercapai', 'indikator Mencakup wilayah nasional diperjelas', 'KA Bidang Kerjasama', NULL, NULL, NULL, 'https://0.com', 1, 1, NULL, 11, 485, 'belum selesai', '2025-01-07 09:20:31', '2025-01-07 10:10:25'),
(327, 'data Persentase jumlah mata kuliah berbasis PBL dibandingkan total mata kuliah inti >15% pada bidang Akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 401, 'belum selesai', '2025-01-08 03:06:40', '2025-01-09 01:38:22'),
(328, 'data Memiliki > 2 TEFA pada bidang Akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 402, 'belum selesai', '2025-01-08 03:07:52', '2025-01-09 01:38:59'),
(329, 'data Jumlah dosen praktisi dibanding total seluruh dosen >30% pada bidang Akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 403, 'belum selesai', '2025-01-08 03:08:33', '2025-01-09 01:39:14'),
(330, 'data Terdapat > 2 kelas industri per tahun pada bidang Akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 404, 'belum selesai', '2025-01-08 03:09:14', '2025-01-09 01:39:44'),
(331, 'data Terdapat lebih dari 2 dosen magang di industri per tahun ada pada bidang akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 406, 'belum selesai', '2025-01-08 03:10:38', '2025-01-09 01:40:01'),
(332, 'data Persentase jumlah dosen tersertifikasi hasil dari kerja sama dibanding total seluruh mahasiswa >10% ada di bidang akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 408, 'belum selesai', '2025-01-08 03:29:43', '2025-01-09 01:40:58'),
(333, 'data Jumlah peserta pelatihan yang diselenggarakan bersama DUDI >50 orang per tahun pada bidang Akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 409, 'belum selesai', '2025-01-08 03:36:39', '2025-01-09 01:41:18'),
(334, 'data Terdapat >10 hasil riset terapan yang diselenggarakan bersama DUDI dalam 1 tahun pada bidang Akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 410, 'belum selesai', '2025-01-08 03:37:11', '2025-01-09 01:41:36'),
(335, 'data Total valuasi dari CSR DUDI >500 juta per tahun pada bidang Akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 413, 'belum selesai', '2025-01-08 03:37:56', '2025-01-09 01:41:52'),
(336, 'data Persentase jumlah perpanjangan/addendum MoU/PKS dibandingkan MoU/PKS yang akan/telah kadaluwarsa >30%pada bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 414, 'belum selesai', '2025-01-08 03:39:02', '2025-01-09 01:42:26'),
(337, 'data Valuasi jumlah peserta pelatihan kerjasama dengan DUDI (atau menggunakan biaya pelatihan perorang berdasarkan LPDP Rp 6 juta per orang)pada bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 423, 'belum selesai', '2025-01-08 03:40:09', '2025-01-09 01:42:50'),
(338, 'data Valuasi riset terapan yang dilakukan bersama DUDI (rupiah pembiayan riset) pada bidang Akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 424, 'belum selesai', '2025-01-08 03:41:55', '2025-01-09 01:43:07'),
(339, 'data Valuasi Rupiah pembiayaan industri untuk Mata kuliah berbasis Project based learning (PjBL) pada bidang Akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 415, 'belum selesai', '2025-01-08 03:42:57', '2025-01-09 01:43:26'),
(340, 'data Valuasi rupiah nilai omset TEFA terdapat pada bidang akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 416, 'belum selesai', '2025-01-08 03:45:37', '2025-01-09 01:43:42'),
(341, 'data Valuasi dosen/tenaga ahli dari DUDI (honor pengajar per sesi sesuai standar SBM (jumlah sesi/jam pelajaran x Rp 900 ribu) ada di bidang akademik', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 417, 'belum selesai', '2025-01-08 03:46:36', '2025-01-09 01:43:55'),
(342, 'data Valuasi rupiah pembiayaan DUDI untuk kelas industri (UKT per tahun) pada bidang Keuangan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 418, 'belum selesai', '2025-01-08 03:59:58', '2025-01-09 01:44:37'),
(343, 'data Valuasi honor dosen magang atau sesuai SBU (Rp 6 juta/bulan.dosen) pada bidang Keuangan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 420, 'belum selesai', '2025-01-08 04:18:48', '2025-01-09 01:44:54'),
(344, 'data Valuasi dosen yang memperoleh sertifikasi kompetensi hasil kemitraan, (atau jumlah dosen x Rp 6 juta) pada bidang lain', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 422, 'belum selesai', '2025-01-08 04:20:02', '2025-01-09 01:45:11'),
(345, 'data Cakupan dampak kemitraan pada bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 426, 'belum selesai', '2025-01-08 04:20:55', '2025-01-09 01:45:27'),
(346, 'indikator kurang dipahami', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'indikator tidak spesifik', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 427, 'belum selesai', '2025-01-08 04:22:59', '2025-01-09 01:45:47'),
(347, 'deskripsi indikator tidak dipahami', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'deskripsi indikator tidak dipahami', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 428, 'belum selesai', '2025-01-08 04:23:53', '2025-01-09 01:29:15'),
(348, 'deskripsi indikator tidak dipahami', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'deskripsi indikator tidak dipahami', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 429, 'belum selesai', '2025-01-08 04:24:14', '2025-01-09 01:28:41'),
(349, 'data Sarana dan Prasarana sudah Memadai dan mutakhir ada di bidang Keuangan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 376, 'belum selesai', '2025-01-08 04:25:11', '2025-01-09 01:26:33'),
(350, 'data anggaran kemitraan tahunan dibagi total anggaran PTV = (> 6%) terdapat pada bidang Keuangan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 377, 'belum selesai', '2025-01-08 04:26:09', '2025-01-09 01:27:07'),
(351, 'Kepemimpinan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 378, 'belum selesai', '2025-01-08 04:27:11', '2025-01-09 01:27:37'),
(352, 'Kepemimpinan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 379, 'belum selesai', '2025-01-08 04:28:29', '2025-01-09 01:28:05'),
(353, 'data Kemitraan tercantum pada seluruh komponen renstra pada bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 382, 'belum selesai', '2025-01-08 04:31:02', '2025-01-09 01:30:15'),
(354, 'Data kerjasama dibawah Bidang kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 383, 'belum selesai', '2025-01-08 08:34:53', '2025-01-09 01:30:43'),
(355, 'data Rencana kerja tahunan kemitraan yang lengkap mencakup program, anggaran, dan target kinerja (KPI/OKR) ada dibawah bidang kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 384, 'belum selesai', '2025-01-08 08:35:46', '2025-01-09 01:31:17'),
(356, 'tidak ada data unit kemitraan yang berada di level setara Wadir khusus Kerjasama di bidang kemahasiswaan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 385, 'belum selesai', '2025-01-08 08:36:39', '2025-01-09 01:31:46'),
(357, 'data kebijakan dan aturan yang jelas terkait kemitraan di PTPPV bukan dibawah Bidang Kemahasiswaan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 386, 'belum selesai', '2025-01-08 08:37:55', '2025-01-09 01:32:27'),
(358, 'data tentang pedoman/SOP kemitraan yang lengkap mulai perencanaan hingga monitoring evaluasi tidak berada dibawah Bidang kemahasiswaan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 387, 'belum selesai', '2025-01-08 08:38:39', '2025-01-09 01:32:46'),
(359, 'dataKapabilitas dan KompetensI 1. Kompetensi berjejaring 2. Jumlah prodi yang menjalin kemitraan tidak berada dibawah Bidang Kemahasiswaan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 388, 'belum selesai', '2025-01-08 08:39:29', '2025-01-09 01:33:07'),
(360, 'data tentang  mitra memiliki cakupan global atau internasional ada di Bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 389, 'belum selesai', '2025-01-08 08:40:13', '2025-01-09 01:33:27'),
(361, 'data  Prodi memiliki kerja sama tidak berada dibawah Bidang Kemahasiswaan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 390, 'belum selesai', '2025-01-08 08:40:52', '2025-01-09 01:33:57'),
(362, 'data Setiap prodi di PTPPPV memiliki minimal 10 kerja sama aktif tidak ditangani Bidang Kemahasiswaan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 391, 'belum selesai', '2025-01-08 08:41:41', '2025-01-09 01:34:15'),
(363, 'Kapabilitas dan KompetensI 1. Kompetensi berjejaring 2. Jumlah prodi yang menjalin kemitraan tidak ditangani oleh bidang Kemahasiswaan', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 392, 'belum selesai', '2025-01-08 08:42:22', '2025-01-09 01:34:52'),
(364, 'data mengenai jumlah PKS/MoA/IA sesuai dengan target rencana kerjasama dibawah Bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 393, 'belum selesai', '2025-01-08 08:43:12', '2025-01-09 01:35:08'),
(365, 'data mengenai jumlah PKS/MoA/IA sesuai dengan target rencana kerjasama dibawah Bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 394, 'belum selesai', '2025-01-08 08:43:59', '2025-01-09 01:35:25'),
(366, 'data 100% pelaksanaan kemitraan sesuai PKS berada di Bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA PPMPP', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 395, 'belum selesai', '2025-01-08 08:44:52', '2025-01-09 01:35:42'),
(367, 'data  target dan pengukuran kinerja secara berkala dari setiap kerjasama di Bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 396, 'belum selesai', '2025-01-08 08:45:43', '2025-01-09 01:36:26'),
(368, 'data Jumlah dokumen kerjasama aktif dalam setahun > 100 di Bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 397, 'belum selesai', '2025-01-08 08:46:18', '2025-01-09 01:36:57'),
(369, 'data Persentase dokumen kerja sama dibanding total dokumen kerja sama >80% dibawah Bidang Kerjasama', 'https://drive.google.com/file/d/1oIxJjocLQdWkvLI5n4ecz4vCeAmDm1eK/view', 'Bukan menjadi ranah bidang kemahasiswaan', 'instrumen standar tidak terpenuhi', 'Indikator tidak sesuai dengan bidang kemahasiswaan sehingga tidak dapat diukur.', 'Melakukan konfirmasi ke PPMPP terkait standar mutu tsb.', 'KA Bidang Kemahasiswaan', NULL, NULL, NULL, NULL, 1, 1, NULL, 12, 398, 'belum selesai', '2025-01-08 08:46:53', '2025-01-09 01:37:21'),
(370, 'Saat ini prestasi perpustakaan maupun pustakawan 3 tahun terakhir terdapat 2 prestasi, sebagai pemenang kedua kategori unit lomba website tahun 2022 dan juara dua tendik berprestasi tahun 2023', 'https://drive.google.com/drive/folders/1Tp6QLMNVHXwVUpBt6YtZNYRk0V7cdI7O?usp=sharing', 'kurangnya minat perpustakaan maupun pustakawan dalam mengikuti kegiatan yang menunjukan prestasi', 'Tidak terpenuhinya standar minimal 5 prestasi dalam 3 tahun terakhir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 226, 'belum selesai', '2025-01-09 00:33:35', '2025-01-09 00:33:35'),
(371, 'Kegiatan Perpustakaan yang melibatkan civitas akademika selama tahun 2024 diantaranya adalah sosialisasi perpustakaan digital atau KubacaPNJ, kegiatan pengadaan e-book, kegiatan pengadaan e-journal, dan kegiatan user education di  PKKP, survey kepuasan layanan perpustakaan', 'https://drive.google.com/file/d/1izy0oZLV00VMkeuOaOYNG2OB2CYmrGkl/view?usp=sharing', 'secara minimal standar sudah terpenuhi namun masih banyak kegiatan yang harus dilakukan dan melibatkan civitas akademika untuk pengembangan perpustakaan yang lebih baik', 'belum maksimal pengembangan yang dapat dilakukan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 227, 'belum selesai', '2025-01-09 00:41:39', '2025-01-09 00:41:39'),
(372, 'secara kegiatan survey layanan upa perpustakaan sudah melakukan survey layanan bebas pustaka, survey kepuasan pemustaka, survey kebutuhan pemustaka, namun dampak survey yang berbentuk karya ilmiah belum dilaksanakan', 'https://drive.google.com/file/d/1nk3-RI-ydW9pduCG8EQvh4wp9pWHdQJg/view?usp=sharing', 'Belum dilaksanakan oleh SDM Perpsutakaan', 'Tidak ada karya ilmiah terkait survey yang dilakukan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 228, 'belum selesai', '2025-01-09 01:02:24', '2025-01-09 01:02:24'),
(373, 'Struktur organisasi yang dilengkapi tugas dan fungsi wewenang dan tanggung jawab dituangkan dalam laporan kinerja tahun 2024', 'https://drive.google.com/file/d/1ZdQIAcuhHGSf66m9SKUAoOsELecCRDjk/view?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 118, 'belum selesai', '2025-01-09 01:08:49', '2025-01-09 01:08:49'),
(374, 'Terdapat beberapa kegiatan seperti pendampingan akreditasi baik perguruan tinggi maupun prodi, serta kegiatan pengadaan e-book, ejournal yang tertuang dalam laporan', 'https://drive.google.com/drive/folders/1aq7rt67ocLC6Hv3P8c8sXZurjw3B4x_U?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 119, 'belum selesai', '2025-01-09 01:14:58', '2025-01-09 01:14:58'),
(375, 'Melakukan Kegiatan Pengadaan E-book dan e-journal', 'https://drive.google.com/drive/folders/1aq7rt67ocLC6Hv3P8c8sXZurjw3B4x_U?usp=sharing', 'pengadaan berdasarkan usulan kebutuhan civitas akademikan, dengan anggaran yang terbatas', 'banyak usulan kebutuhan yang tidak dapat di realisasikan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 120, 'belum selesai', '2025-01-09 01:17:44', '2025-01-09 01:17:44'),
(376, 'pertanyaan 2.4 sama dengan 2.3', 'https://drive.google.com/drive/folders/1aq7rt67ocLC6Hv3P8c8sXZurjw3B4x_U?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 121, 'belum selesai', '2025-01-09 01:18:43', '2025-01-09 01:18:43'),
(377, 'Sosialisasi/user education di pkkp, dan sosialisasi layanan perpustakaan (bebas Pustaka)', 'https://drive.google.com/drive/folders/1Gp9bZOch_v-rnmp3p5VR8C0Gw2ZeOwRs?usp=sharing', 'sudah dilaksanakan user education sejak tahun 2023', 'Terpenuhi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 122, 'belum selesai', '2025-01-09 01:21:55', '2025-01-09 01:21:55'),
(378, 'terdapat SOP layanan', 'https://drive.google.com/file/d/1jNMg0UI2aNta2EwNV61hLX1oU4GKumIN/view?usp=sharing', 'Terdapat SOP Layanan', 'Terpenuhi Layanan Sesuai Standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 123, 'belum selesai', '2025-01-09 01:23:58', '2025-01-09 01:23:58'),
(379, 'Sudah Terpenuhi', 'https://docs.google.com/document/d/1f2VqAsornA3tjVzXdSBxhac8k5EmYcdh/edit?usp=sharing&ouid=107615406708519998139&rtpof=true&sd=true', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 124, 'belum selesai', '2025-01-09 01:25:20', '2025-01-09 01:25:20'),
(380, 'Sudah tersedia bukti evaluasi layanan secara berkala (mahasiswa sebelum lulus sebelum mendapatkan bebas pustaka harus mengisi link evaluasi)', 'https://docs.google.com/spreadsheets/d/1an1aD3d8wuih73gTDk030Yy2yf-GpjDByKbxjz_ES-s/edit?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 125, 'belum selesai', '2025-01-09 01:28:05', '2025-01-09 01:28:05'),
(381, 'Saat ini fungsional  Pustakawan yang ada di UPA Perpustakaan X2 berjumlah 3 Pustakawan, dan X3 berjumlah 1 Orang', 'https://drive.google.com/drive/folders/18GepCWvoL_eRgVyHDhWRWawCtb965Yzg?usp=sharing', 'Belum ada Penambahan SDM atau Formasi dan di tahun 2025 pertengahan terdapat pustakawan yang akan Pensiun', 'semakin berkurang SDM dan Semakin banyak beban Kerja Pustakawan yang ada, dan jumlah pustakawan semakin jauh dari standar yang ada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 126, 'belum selesai', '2025-01-09 01:35:48', '2025-01-09 01:35:48'),
(382, 'Jika dari total pustakawan yang ada 3 dari 4 pustakawan sudah berpendidikan S1 di UPA Perpustakaan sudah memenuhi 75%, tetapi jika mengacu pada aturan perpusnas belum memenuhi standar', 'https://drive.google.com/file/d/1q1zCyWl7Kvr1Q7USTGV_GZnOoBPjIpvo/view?usp=sharing', 'Belum ada Penambahan SDM atau Formasi dan di tahun 2025 pertengahan terdapat pustakawan yang akan Pensiun', 'tidak bertambahnya SDM di UPA Perpustakaan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 127, 'belum selesai', '2025-01-09 02:05:17', '2025-01-09 02:05:17'),
(383, 'Saat ini terdapat KATALOG pada web perpustakaan dimana pemustaka dapat mencari e-book dan e-journal, serta perpustakaan juga memiliki koleksi ebook yang berbasis android/Ios/Windows/macos', 'https://perpustakaan.pnj.ac.id/#', 'terpenuhi', 'terpenuhi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 128, 'belum selesai', '2025-01-09 02:10:00', '2025-01-09 02:10:00'),
(384, '1. Telah dilaksanakan AMI 2023 namun hasil AMI 2023 belum diterima oleh unit 2. Sudah tersedia bukti evaluasi layanan secara berkala (mahasiswa sebelum lulus sebelum mendapatkan bebas pustaka harus mengisi link evaluasi)', 'https://docs.google.com/spreadsheets/d/1an1aD3d8wuih73gTDk030Yy2yf-GpjDByKbxjz_ES-s/edit?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 129, 'belum selesai', '2025-01-09 02:12:30', '2025-01-09 02:12:30'),
(385, 'Sudah Terpenuhi', 'https://drive.google.com/drive/folders/1Q7RRMphMO1pnvKFkoAdRc5g1kB7rRo9_?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 130, 'belum selesai', '2025-01-09 02:15:07', '2025-01-09 02:15:07'),
(386, 'SK pendirian perpustakaan bersamaan dengan SK pembukaan Politeknik', 'https://drive.google.com/file/d/12S_UcWARoxHWycVTJtXHHL7ltIhNh7jZ/view?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 131, 'belum selesai', '2025-01-09 02:16:16', '2025-01-09 02:16:16'),
(387, 'Dokumen kebijakan terkait pelaksanaan pengembangan koleksi sudah ada, namun evaluasi kegiatan minimal 3 tahun sekali belum tersedia', 'https://docs.google.com/document/d/1nx_TS7h8Ht5wowBN-zHnDX9wpYmjtj_8/edit?usp=sharing&ouid=107615406708519998139&rtpof=true&sd=true', 'belum dilaksanakannya evaluasi terkait kebijakan pelaksanaan pengembangan koleksi', 'belum tersedianya dokumen evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 132, 'belum selesai', '2025-01-09 02:22:39', '2025-01-09 02:22:39'),
(388, 'Pelaksaan kebijakan dalam hal pengembangan koleksi dan kebutuhan pemustaka dapat di lihat dari laporan pengadaan e-book dan e-journal', 'https://drive.google.com/drive/folders/1aq7rt67ocLC6Hv3P8c8sXZurjw3B4x_U?usp=sharing', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 133, 'belum selesai', '2025-01-09 02:27:29', '2025-01-09 02:27:29'),
(389, 'Saat ini pelaksanaan pengadaan ebook dilaksanakan berdasarkan usulan dari kebutuhan setiap jurusan', 'https://drive.google.com/drive/folders/1iwCfp3Rbs8aLH3jjdktUXWLjTDhtRE2r?usp=sharing', 'pengadaan tiap tahun dilaksanakn sesuai usulan', 'pengadaan sesuai dengan kebutuhan civitas akademika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 134, 'belum selesai', '2025-01-09 03:26:30', '2025-01-09 03:26:30'),
(390, 'Saat ini alat seleksi bahan perpustakaan menggunakan 6 alat seleksi', 'https://drive.google.com/drive/folders/1WqoSavox5Dw0CQvTGmBnj48VBu054GLv?usp=sharing', 'selama ini hanya menggunakan 6 alat ukur', 'tidak memenuhi standar dari 7 jenis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 135, 'belum selesai', '2025-01-09 06:14:35', '2025-01-09 06:14:35'),
(391, 'Saat ini jumlah daftar judul buku tercetak  di UPA Perpustakaan berjumlah 10.391 judul', 'https://drive.google.com/file/d/1ZdQIAcuhHGSf66m9SKUAoOsELecCRDjk/view?usp=sharing', 'pengadaan beberapa tahun terakhir hanya pengadaan koleksi digital (e-book)', 'tidak ada penambahan judul buku maupun eksemplar buku teks', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 136, 'belum selesai', '2025-01-09 06:23:32', '2025-01-09 06:23:32'),
(392, 'saat ini jumlah judul e-book yang dimiliki dalam hal pengadaan berjumlah 571 judul, dapat dilihat pada web perpustakaan pada menu katalog (daftar e-book)', 'https://perpustakaan.pnj.ac.id/', 'pengadaan e-book terbentur anggaran yang minim', 'banyak usulan dari civitas akademika yang tidak terealisasikan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 145, 'belum selesai', '2025-01-09 06:27:50', '2025-01-09 06:27:50'),
(393, 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', 'https://drive.google.com/drive/folders/1oDLh7nkClybASJ45K4qCegOHuTQ78EWy?usp=sharing', 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 146, 'belum selesai', '2025-01-09 06:31:41', '2025-01-09 06:31:41'),
(394, 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', 'https://drive.google.com/drive/folders/1oDLh7nkClybASJ45K4qCegOHuTQ78EWy?usp=sharing', 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 147, 'belum selesai', '2025-01-09 06:33:02', '2025-01-09 06:33:02'),
(395, 'sudah terpenuhi 3 standar minimal database', 'https://docs.google.com/spreadsheets/d/1JCY5U8dkyHy1nvvJIZOo4LIQt08Q6MM1/edit?usp=sharing&ouid=107615406708519998139&rtpof=true&sd=true', 'saat ini hanya 3 database yang bisa dilanggan, masih kurang dari permintaan usulan terutama dari Dosen, anggaran yang terbatas', 'yang dilanggan terbatas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 148, 'belum selesai', '2025-01-09 06:37:34', '2025-01-09 06:37:34'),
(396, 'Jumlah buku bukan koleksi inti misalnya novel sangat terbatas tidak sampai 10%, artinya 90% koleksi adalah koleksi inti', 'https://perpustakaan.pnj.ac.id/', 'Jumlah buku bukan koleksi inti misalnya novel sangat terbatas tidak sampai 10%, artinya 90% koleksi adalah koleksi inti', 'lebih banyak koleksi inti dari pada non koleksi inti, dapat dilihat di web perpustakaan PNJ pada menu KATALOG_Katalog Buku Jurusan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 137, 'belum selesai', '2025-01-09 06:42:40', '2025-01-09 06:42:40'),
(397, 'Saat ini koleksi yang dimiliki berjumlah 115 judul', 'https://docs.google.com/spreadsheets/d/1Z66mwnQHuTnoUKmw1hJ6EwpzuiurV9v9/edit?usp=sharing&ouid=107615406708519998139&rtpof=true&sd=true', 'Belum ada penambahan pengadaan, koleksi maupun sarana penyimpanannya (Rak) dikarenakan ruang terbatas', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 138, 'belum selesai', '2025-01-09 06:45:27', '2025-01-09 06:45:27'),
(398, 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', 'https://drive.google.com/drive/folders/1oDLh7nkClybASJ45K4qCegOHuTQ78EWy?usp=sharing', 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 139, 'belum selesai', '2025-01-09 06:46:33', '2025-01-09 06:46:33'),
(399, 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', 'https://drive.google.com/drive/folders/1oDLh7nkClybASJ45K4qCegOHuTQ78EWy?usp=sharing', 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', 'Standar sudah tidak relevan dengan instrumen akreditasi perpustakaan nomor 303 tahun 2022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 140, 'belum selesai', '2025-01-09 06:47:13', '2025-01-09 06:47:13'),
(400, 'Sudah sulit ditemukan jurnal cetak, solusinya adalah dengan menyediakan versi cetak dari jurnal elektronik', 'https://perpustakaan.pnj.ac.id/', 'Sudah sulit ditemukan jurnal cetak, solusinya adalah dengan menyediakan versi cetak dari jurnal elektronik', 'tidak dapat berlangganan jurnal cetak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 141, 'belum selesai', '2025-01-09 06:50:11', '2025-01-09 06:54:20'),
(401, 'Jurnal yang dilanggan saat ini hanya mewakili jurusan tidak terfokus pada prodi, dapat dilihat dari web perpustakaan pada menu KATALOG_Daftar Jurnal', 'https://perpustakaan.pnj.ac.id/', 'Anggaran yang terbatas', 'Tidak dapat mengakomodir usulan jurnal sesuai prodi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 142, 'belum selesai', '2025-01-09 06:55:30', '2025-01-09 06:55:30'),
(402, 'data yang terdapat pada sistem perpustakaan dan tercatat mulai tahun 2016 s.d tahun 2020 berjumlah 7495 dan jumlah yang terdata dari repository berjumlah 8.865', 'https://drive.google.com/drive/folders/1ANaxK77o0PZNwje25LjatyVlyXOPhW35?usp=sharing', '-', 'terpenuhi dari jumlah minimal yang distandarkan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 143, 'belum selesai', '2025-01-09 07:07:27', '2025-01-09 07:07:27'),
(403, 'tidak terpenuhi dikarenakan pengadaan koleksi hanya pengadaan digital (e-book) dan terbatasnya ruang untuk pengadaan koleksi teks book', 'https://docs.google.com/spreadsheets/d/1Q8P0AlZXb8FO_IxpqI0Vsl43j7BYiriLHd-d8uCqjsg/edit?usp=sharing', 'tidak terpenuhi dikarenakan pengadaan koleksi hanya pengadaan digital (e-book) dan terbatasnya ruang untuk pengadaan koleksi teks book', 'Tidak ada penambahan teks book dari pengadaan, penambahan hanya dari sumbangan mahasiswa dan dosen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 144, 'belum selesai', '2025-01-09 07:19:33', '2025-01-09 07:19:33'),
(404, 'Tersedia data pengolahan buku', 'https://drive.google.com/drive/folders/1W-hMM0CcvACGJdWVUqSn4lUcc_CxyXQi?usp=sharing', 'tercatat data pengolahan buku', 'Tersedia data pengolahan buku', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 149, 'belum selesai', '2025-01-09 07:30:57', '2025-01-09 07:30:57'),
(405, 'pengolahan bahan perpustakaan sudah mengikuti ketentuan baku internasional secara konsisten menggunakan DDC', 'https://drive.google.com/file/d/1bwsNCWDnPmPZP3vRAKEk38mNV-H-wxcd/view?usp=sharing', 'Standar Internasional yang sudah digunakan perpustakaan di Indonesia', 'Terpenuhi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 150, 'belum selesai', '2025-01-09 07:37:04', '2025-01-09 07:37:04'),
(406, 'Tersedia sistem otomasi pengolahan menggunakan aplikasi otomasi dengan LAN terkoneksi internet Aplikasi SLIMS', 'https://opac.pnj.ac.id/', 'Tersedia sistem otomasi pengolahan menggunakan aplikasi otomasi dengan LAN terkoneksi internet Aplikasi SLIMS', 'Tersedia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 151, 'belum selesai', '2025-01-09 07:39:57', '2025-01-09 07:39:57'),
(407, 'Tersedia kelengkapan buku minimal: a. kartu buku b. kantong buku c. slip tanggal kembali d. label buku e. stampel f. barcode', 'https://drive.google.com/file/d/1b8zHf0zEgJ17KmDkUN2feQTvMU4NUDWz/view?usp=sharing', 'Sesuai Standar', 'Terpenuhi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 152, 'belum selesai', '2025-01-09 07:47:05', '2025-01-09 07:47:05'),
(408, 'Kalimat standar perlu dilengkapi dengan penjelasan bukti apa yang bisa dijadikan indikator', 'https://drive.google.com/drive/folders/1KKvQPovGBUDwW3BEUzVL1Cd51jTErv1m?usp=sharing', 'Pernah dilakukan observasi atau penelitian mahasiswa prodi listrik', 'Banyak yang tidak sesuai dengan standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 165, 'belum selesai', '2025-01-09 07:53:08', '2025-01-09 07:53:08'),
(409, 'Kalimat standar perlu dilengkapi dengan penjelasan bukti apa yang bisa dijadikan indikator', 'http://8.215.59.149:8002/instrument/create', 'Kalimat standar perlu dilengkapi dengan penjelasan bukti apa yang bisa dijadikan indikator', 'belum ada standar indikator dalam pengukuran sirkulasi udara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 166, 'belum selesai', '2025-01-09 07:56:06', '2025-01-09 07:56:06'),
(410, 'Sudah terdapat SOP untuk beberapa pelayanan di Rumah Tangga', 'https://drive.google.com/drive/folders/1NqasPcFajvxJG9Bnm5IEsvDpWI6bpy9X?usp=drive_link', 'sudah terdapat beberapa SOP untuk pelayanan di rumah tangga namun untuk tahun 2024 belum di update', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 9, 308, 'belum selesai', '2025-01-12 03:02:39', '2025-01-12 03:02:39'),
(411, 'Terdapat standar yang ditetapkan, Status ketercapaian melampaui', 'https://drive.google.com/drive/folders/16oFsaQ8w-9isvuIIb_1PHuV8PjRSubfP?usp=drive_link', 'Melampaui standar', 'Melampaui standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 10, 347, 'belum selesai', '2025-01-13 01:09:28', '2025-01-13 02:16:01'),
(412, 'Terdapat standar yang ditetapkan (Mencapai)', 'https://drive.google.com/drive/folders/1690U_E5jPuGg7ByqnC6hDSc3eTdBJxFm?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 348, 'belum selesai', '2025-01-13 02:52:39', '2025-01-13 02:52:39'),
(413, 'Terdapat standar yang ditetapkan, mencapai', 'https://drive.google.com/drive/folders/1TDmtIgZcUw73uL6pw7iKO3jlZNSX7PqH?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 372, 'belum selesai', '2025-01-13 02:56:25', '2025-01-13 05:49:47'),
(414, 'Terdapat standar yang ditetapkan ( mencapai)', 'https://drive.google.com/drive/folders/1orYJ6Uc9SfEQ-zqLEU3d-Rv90Qa5w97E?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 373, 'belum selesai', '2025-01-13 03:00:05', '2025-01-13 03:00:05'),
(415, 'Terdapat standar yang ditetapkan (Mencapai)', 'https://drive.google.com/drive/folders/1fzxPCpGTp7tqbLJDju9RbiTPIB64C8hP?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 349, 'belum selesai', '2025-01-13 03:02:56', '2025-01-13 03:02:56'),
(416, 'Mencapai', 'https://drive.google.com/drive/folders/1UEoJUv3xWntFzse7mg0LZ_BJQNn0zAdL?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 350, 'belum selesai', '2025-01-13 03:23:36', '2025-01-13 03:23:36'),
(417, 'Melampaui', 'https://drive.google.com/drive/folders/1Du2_BksOn-yTwQqaCL6tXDpHRWv7bFw-?usp=drive_link', 'Melampaui standar', 'Melampuai standar (dari sisi audite)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 10, 351, 'belum selesai', '2025-01-13 03:28:35', '2025-01-13 03:28:35'),
(418, 'Mencapai', 'https://drive.google.com/drive/folders/1C0RGFLuJIyhQMa_iwLuTnT9izQXgF2eV?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 355, 'belum selesai', '2025-01-13 06:08:39', '2025-01-13 06:08:39'),
(419, 'Melampaui', 'https://drive.google.com/drive/folders/1_SrUIsaNCFiSh2vB_l04ePj5T5y78h2X?usp=drive_link', 'Melampaui standar', 'Melampaui standar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 361, 'belum selesai', '2025-01-13 06:11:35', '2025-01-13 06:11:35'),
(420, 'Mencapai', 'https://drive.google.com/drive/folders/14N16bZhJjJ944kXK7D0Lcye4vNncQCze?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 362, 'belum selesai', '2025-01-13 06:16:33', '2025-01-13 06:16:33'),
(421, 'Mencapai', 'https://drive.google.com/drive/folders/1VJTJUGPdN_eyaTnqGKOrnIoyg2CaDq0W?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 363, 'belum selesai', '2025-01-13 06:19:03', '2025-01-13 06:19:03'),
(422, 'Mencapai', 'https://drive.google.com/drive/folders/1ZjHEdEnJ4ugyBgXwCuGjqIc7cszX3Tbu?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 364, 'belum selesai', '2025-01-13 06:24:11', '2025-01-13 06:24:11'),
(423, 'Mencapai', 'https://drive.google.com/drive/folders/14dkjuZCdofMtwl0KQ0PKUNcVe7QfHsv7?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 365, 'belum selesai', '2025-01-13 06:27:08', '2025-01-13 06:27:08'),
(424, 'Mencapai', 'https://drive.google.com/drive/folders/1qVtRQIsV11BGrNa6W7md3q7mJD5euekS?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 366, 'belum selesai', '2025-01-13 06:31:44', '2025-01-13 06:31:44'),
(425, 'Belum Tercapai', 'https://drive.google.com/drive/folders/1X_2Uh0z3rFbnrDGDaPA6cmMqUGPiY8br?usp=drive_link', 'Belum Tercapai', 'Beluj tercapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 10, 368, 'belum selesai', '2025-01-13 06:37:20', '2025-01-13 06:37:20'),
(426, 'Mencapai', 'https://drive.google.com/drive/folders/1Zn_We4Ummz4jYih9w6FVZpTJDyRz2y0w?usp=drive_link', 'Mencapai', 'Mencapai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, 369, 'belum selesai', '2025-01-13 06:42:16', '2025-01-13 06:42:16'),
(427, 'Humpro PNJ memiliki form monitoring untuk mengkontrol ketercapaian atau realisasi program', 'https://docs.google.com/spreadsheets/d/1M06EVK0wz_6_CUnU0ZAlgZ4LKCgH0cLe/edit?gid=792623689#gid=792623689', 'Indikator capaian yang ditargetkan setiap tahunnya', NULL, 'sudah mencapai', 'pastitkan proses monitoring berjalan setiap tahun, dan dilakukan pelaporan sesuai ketentuan', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 256, 'belum selesai', '2025-01-15 01:25:23', '2025-01-15 14:54:42'),
(428, 'Humpro memiliki form monitoring yang didalamnya terdapat bukti dari realisasi kegiatan pada tahun yang sama', 'https://docs.google.com/spreadsheets/d/1M06EVK0wz_6_CUnU0ZAlgZ4LKCgH0cLe/edit?gid=792623689#gid=792623689', 'Indikator capaian per tahun', NULL, 'sudah mencapai', 'pastitkan proses monitoring berjalan setiap tahun, dan dilakukan pelaporan sesuai ketentuan', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 257, 'belum selesai', '2025-01-15 01:26:30', '2025-01-15 14:55:08'),
(429, 'Belum ada di SOTK terbaru', 'https://humpro.pnj.ac.id/', 'Indikator capaian', NULL, 'Tidak ada di dalam SOTK Nomor 60 tahun 2022', 'Agar segera disesuaikan dengan SOTK terbaru.', 'KA PPMPP', NULL, NULL, NULL, 'https://drive.google.com/drive/u/0/search?q=sotk', 1, 1, NULL, 7, 258, 'belum selesai', '2025-01-15 01:33:38', '2025-01-15 05:55:43'),
(430, 'Pelaksanaan pekerjaan di humpro belum sesuai dengan SOTK', 'https://humpro.pnj.ac.id/', 'Indikator capaian', NULL, 'Tidak ada di dalam SOTK Nomor 60 tahun 2022', 'Agar segera disesuaikan dengan SOTK terbaru.', 'KA PPMPP', NULL, NULL, NULL, 'https://drive.google.com/drive/u/0/search?q=sotk', 1, 1, NULL, 7, 259, 'belum selesai', '2025-01-15 01:34:20', '2025-01-15 05:56:29'),
(431, 'Humpro memiliki website, data kinerja dan form monitoring untuk melaksanakan pekerjaan sesuai fungsi pengelolaan', 'https://docs.google.com/spreadsheets/d/1M06EVK0wz_6_CUnU0ZAlgZ4LKCgH0cLe/edit?gid=883251907#gid=883251907', 'Indikator capaian', NULL, 'sudah mencapai', 'pastikan pengelolaan berjalan secara baik untuk setiap kegiatan', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 260, 'belum selesai', '2025-01-15 01:35:48', '2025-01-15 14:55:46'),
(432, 'Humpro memiliki website, data kinerja dan form monitoring untuk melaksanakan fungsi pengelolaan', 'https://docs.google.com/spreadsheets/d/1M06EVK0wz_6_CUnU0ZAlgZ4LKCgH0cLe/edit?gid=883251907#gid=883251907', 'Indikator capaian', NULL, 'sudah mencapai', 'pastikan pengelolaan berjalan secara baik untuk setiap kegiatan', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 261, 'belum selesai', '2025-01-15 01:36:40', '2025-01-15 14:56:06'),
(433, 'Humpro memiliki beberapa SOP yang sudah disosialisasikan dan di evaluasi setiap tahunnya', 'https://docs.google.com/spreadsheets/d/1Ad6yzKsSSH3NlFpEHZu96N3GKideAkeo/edit?usp=drive_link&ouid=107864554074878513386&rtpof=true&sd=true', 'Indikator capaian', NULL, 'sudah mencapai', 'pastikan agar SOP tersosialisasi dengan baik, dan lakukan evaluasi secara berkala', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 262, 'belum selesai', '2025-01-15 01:40:02', '2025-01-15 14:56:50'),
(434, 'Humpro sudah mensosialisasikan prosedur layanan kepada civitas akademika', 'https://drive.google.com/drive/folders/171swFKi6cUjdWFGM8BWkg-JYEk7epb0P?usp=sharing', 'Indikator capaian', NULL, 'sudah mencapai', 'pastikan agar SOP tersosialisasi dengan baik, dan lakukan evaluasi secara berkala', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 263, 'belum selesai', '2025-01-15 02:01:06', '2025-01-15 14:57:07'),
(435, 'Prosedur yang kami buat sudah di sosialisasikan dan diterapkan oleh civitas akademika dan di evaluasi oleh bagian di tiap tahunnya', 'https://docs.google.com/spreadsheets/d/1Ad6yzKsSSH3NlFpEHZu96N3GKideAkeo/edit?gid=1187120644#gid=1187120644', 'Indikator capaian', NULL, 'sudah mencapai', 'pastikan agar SOP tersosialisasi dengan baik, dan lakukan evaluasi secara berkala', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 264, 'belum selesai', '2025-01-15 02:14:49', '2025-01-15 14:57:24'),
(436, 'Di tahun ini dilakukan evaluasi prosedur layanan keprotokolan', 'https://docs.google.com/spreadsheets/d/1Ad6yzKsSSH3NlFpEHZu96N3GKideAkeo/edit?gid=1187120644#gid=1187120644', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan agar SOP tersosialisasi dengan baik, dan lakukan evaluasi secara berkala', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 265, 'belum selesai', '2025-01-15 02:17:06', '2025-01-15 14:57:51');
INSERT INTO `instrumen_audits` (`id`, `deskripsi_temuan`, `bukti`, `akar_penyebab`, `akibat`, `temuan_audit`, `rekomendasi_auditor`, `penanggung_jawab`, `rencana_perbaikan`, `tanggapan_auditee`, `jadwal_penyelesaian`, `link`, `id_status_tercapai`, `id_status_temuan`, `id_status_akhir`, `id_AMI`, `id_indikator`, `status_audit`, `created_at`, `updated_at`) VALUES
(437, 'Humpro sudah melakukan prosedur pelayanan protokoler bagi pimpinan maupun tamu melalui website humpro', 'https://docs.google.com/spreadsheets/d/1Ad6yzKsSSH3NlFpEHZu96N3GKideAkeo/edit?gid=1187120644#gid=1187120644', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan layanan keprotokolan terlaksana dengan cepat, tepat dan terdokumentasi dengan baik;', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 266, 'belum selesai', '2025-01-15 02:19:57', '2025-01-15 14:58:26'),
(438, 'Humpro sudah melaksanakan layanan keprotokolan bagi tamu dengan cepat, tepat dan terdokumentasi dengan baik melalui buku tamu digital', 'https://docs.google.com/spreadsheets/d/1Zze-4CWsusvYVS4dAK2oJZOuNcJz3_BFKNzsjZ5g8dg/edit?usp=sharing', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan layanan keprotokolan terlaksana dengan cepat, tepat dan terdokumentasi dengan baik;', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 267, 'belum selesai', '2025-01-15 02:21:54', '2025-01-15 14:59:01'),
(439, 'Pelayanan keprotokolan di humpro sudah memberikan form evaluasi layanan keprotokolan kepada civitas akademika pnj', 'https://docs.google.com/spreadsheets/d/1F12O4xFagYqirJC0QbaUnUAab9w4YPvqxYVjBL_p1vc/edit?usp=sharing', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan layanan keprotokolan terlaksana dengan cepat, tepat dan terdokumentasi dengan baik serta lakukan evaluasi secara berkala', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 268, 'belum selesai', '2025-01-15 02:24:46', '2025-01-15 14:59:43'),
(440, 'Humpro PNJ sebagai media promosi dan informasi PNJ memiliki saluran pengaduan publik mulai dari chat center, IG, TIktok, WEB, Telegram', 'https://docs.google.com/spreadsheets/d/1YnrHMCkBMjUIZc8HJtNoec8XwJh9I5jOgDwinq_NM50/edit?usp=sharing', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan ketersediaan saluran/wadah pengaduan publik yang mudah diakses, kredibel dan akuntabel, dievaluasi secara berkala serta didokumentasikan dengan baik.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 269, 'belum selesai', '2025-01-15 02:32:46', '2025-01-15 15:05:12'),
(441, 'Humpro memiliki chat center yg terintegrasi dengan unit akademik dan keuangan dimana seluruh pengaduan di sosialisasikan', 'https://www.instagram.com/p/Co6st_IrI9M/?igsh=MWw3OG9zMzcxMTRhcg==', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan ketersediaan saluran/wadah pengaduan publik yang mudah diakses, kredibel dan akuntabel, dievaluasi secara berkala serta didokumentasikan dengan baik.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 270, 'belum selesai', '2025-01-15 02:35:03', '2025-01-15 15:01:10'),
(442, 'Humpro memastikan layanan sesuai dengan yang dibutuhkan oleh publik melalui form evaluasi layanan', 'https://docs.google.com/spreadsheets/d/1ijnlLtZRLIe9vWpibZaE-3QevLslL9kb45jUg-5Rshc/edit?usp=sharing', 'Indikator Capaian', NULL, 'sudah tercapai', 'pastikan ketersediaan saluran/wadah pengaduan publik yang mudah diakses, kredibel dan akuntabel, dievaluasi secara berkala serta didokumentasikan dengan baik.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 271, 'belum selesai', '2025-01-15 02:43:33', '2025-01-15 15:01:31'),
(443, 'Humpro selalu memastikan informasi pada web pnj yang benar, lengkap, mutakhir dan dievaluasi secara berkala', 'https://www.pnj.ac.id/', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan ketersediaan informasi pada website PNJ yang benar, lengkap, mutakhir, dan disajikan dalam dua bahasa serta dievaluasi secara berkala', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 272, 'belum selesai', '2025-01-15 02:46:46', '2025-01-15 15:01:53'),
(444, 'Humpro memastikan kemutakhiran seluruh data informasi pada web pnj', 'https://www.pnj.ac.id/', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan ketersediaan informasi pada website PNJ yang benar, lengkap, mutakhir, dan disajikan dalam dua bahasa serta dievaluasi secara berkala', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 273, 'belum selesai', '2025-01-15 02:48:28', '2025-01-15 15:02:19'),
(445, 'Humpro selalu memastikan ketersediaan sarana prasarana yang mendukung pelayanan publik melalui data sarana prasarana', 'https://docs.google.com/spreadsheets/d/1hsZxSUUT59hG0BAx1c_KXuXUmde6-UjWsItFHiiVVj8/edit?gid=0#gid=0', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan ketersediaan sarana prasarana pendukung pelayanan publik yang memadai.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 274, 'belum selesai', '2025-01-15 02:49:46', '2025-01-15 15:02:39'),
(446, 'Humpro memastikan sarana prasarana di cek secara berkala dan dievaluasi untuk ditindaklanjuti', 'https://docs.google.com/spreadsheets/d/1hsZxSUUT59hG0BAx1c_KXuXUmde6-UjWsItFHiiVVj8/edit?gid=0#gid=0', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan ketersediaan sarana prasarana pendukung pelayanan publik yang memadai.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 275, 'belum selesai', '2025-01-15 02:50:39', '2025-01-15 15:02:51'),
(447, 'Humpro sudah mensosialisasikan survey pelayanan kepuasan pendidikan', 'https://docs.google.com/spreadsheets/d/1csJknO88AJzkqM-T-hV1r4CP8r5b8n0cC0JG1I71uRY/edit?usp=sharing', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan unit agar melakukan pengukuran kepuasan layanan terhadap seluruh pelaksanaan pelayanan yang dilakukan secara berkala, terukur, ditindaklanjuti, dan terdokumentasi dengan baik.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 276, 'belum selesai', '2025-01-15 03:05:14', '2025-01-15 15:03:11'),
(448, 'Humpro mempublikasikan kepuasan layanan yang nantinya laporan kepuasaan akan di buat oleh BLU', 'https://docs.google.com/spreadsheets/d/1csJknO88AJzkqM-T-hV1r4CP8r5b8n0cC0JG1I71uRY/edit?usp=sharing', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan unit melakukan pengukuran kepuasan layanan terhadap seluruh pelaksanaan pelayanan yang dilakukan secara berkala, terukur, ditindaklanjuti, dan terdokumentasi dengan baik.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 277, 'belum selesai', '2025-01-15 03:08:13', '2025-01-15 15:03:32'),
(449, 'Humpro masih menunggu laporan kepuasan layanan tahun 2024 dari BLU', 'https://drive.google.com/drive/folders/1Ak-XwftJYGOkI9uRxKAXf6M6sKKVaP_l?usp=drive_link', 'Indikator capaian', NULL, 'sudah tercapai', 'pastikan ketersedian bukti laporan pengukuran kepuasan pemangku kepentingan atas layanan publik dan telah diserahkan kepada pimpinan.', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, 7, 278, 'belum selesai', '2025-01-15 03:10:26', '2025-01-15 15:04:29');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_05_20_085458_create_units_table', 1),
(5, '2024_05_21_000000_create_users_table', 1),
(6, '2024_05_23_032549_create_permission_tables', 1),
(7, '2024_05_23_092013_create_tahun_akademiks_table', 1),
(8, '2024_05_24_024556_create_pernyataan_standars_table', 1),
(9, '2024_05_24_035219_create_indikators_table', 1),
(10, '2024_05_24_163029_create_status_tercapais_table', 1),
(11, '2024_05_24_163126_create_status_temuans_table', 1),
(12, '2024_05_24_163135_create_status_akhirs_table', 1),
(13, '2024_05_28_030838_create_audit_mutu_internals_table', 1),
(14, '2024_06_03_094257_create_instrumen_audits_table', 1),
(15, '2024_07_27_154325_create_record_logins_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(4, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(3, 'App\\Models\\User', 25),
(3, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 27),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 30),
(3, 'App\\Models\\User', 31),
(3, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 33),
(3, 'App\\Models\\User', 34),
(3, 'App\\Models\\User', 35),
(3, 'App\\Models\\User', 36),
(3, 'App\\Models\\User', 37),
(3, 'App\\Models\\User', 38),
(3, 'App\\Models\\User', 39),
(3, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 41),
(3, 'App\\Models\\User', 42),
(3, 'App\\Models\\User', 43),
(3, 'App\\Models\\User', 44),
(3, 'App\\Models\\User', 45),
(3, 'App\\Models\\User', 46),
(3, 'App\\Models\\User', 47);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pernyataan_standars`
--

CREATE TABLE `pernyataan_standars` (
  `id` bigint UNSIGNED NOT NULL,
  `no_ps` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pernyataan_standar` text COLLATE utf8mb4_unicode_ci,
  `id_unit` bigint UNSIGNED DEFAULT NULL,
  `id_TA` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pernyataan_standars`
--

INSERT INTO `pernyataan_standars` (`id`, `no_ps`, `pernyataan_standar`, `id_unit`, `id_TA`, `created_at`, `updated_at`) VALUES
(7, '1.', 'Bagian/Unit kerja memiliki rencana operasional (renop) sebagai penjabaran atau pelaksanaan renstra institusi', 7, 1, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(8, '2.', 'Unit kerja memiliki dokumen struktur organisasi dan tata kerja (SOTK) yang memuat tugas, fungsi, dan wewenang yang telah ditetapkan. ', 7, 1, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(9, '3.', 'UTD memiliki prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 7, 1, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(10, '4.', 'PNJ melalui UTD memiliki sistem informasi untuk pengumpulan data yang akurat dapat dipertanggungjawabkan dan terjaga kerahasiannya dan efektifitasnya dievaluasi secara berkala.', 7, 1, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(11, '5.', 'PNJ melalui UTD memiliki sistem informasi untuk mengelola dan menyebarkan ilmu pengetahuan untuk mendukung tri dharma perguruan tinggi yang mudah diakses dan dievaluasi secara berkala;', 7, 1, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(12, '6.', 'PNJ memiliki atau menyediakan sarana sistem informasi pembelajaran sesuai isi dan proses pembelajaran serta memenuhi persyaratan sarana pembelajaran yang berkualitas', 7, 1, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(13, '7.', 'Web PNJ memuat profil institusi dan data yang relevan untuk dikonsumsi publik yang lengkap dan dimutakhirkan secara berkala minimal tiap semester. ', 7, 1, '2024-12-24 00:10:59', '2024-12-24 00:10:59'),
(14, '1.', 'Bagian/Unit kerja memiliki rencana kerja sebagai penjabaran atau pelaksanaan renstra institusi.', 4, 1, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(15, '2.', 'Unit kerja memiliki dokumen struktur organisasi dan tata kerja (SOTK) yang memuat tugas, fungsi, dan wewenang yang telah ditetapkan. ', 4, 1, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(16, '3.', 'Unit wajib memastikan ketersediaan prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 4, 1, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(17, '4.', 'Unit wajib menyusun dan mengembangkan skema sertifikasi profesi yang relevan dengan kebutuhan kompetensi masing-masing program studi yang dievaluasi secara berkala dan terdokumentasi dengan baik.', 4, 1, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(18, '5', 'Unit wajib memastikan keterlaksanaan uji kompetensi dan sertifikasi bagi mahasiswa berdasarkan skema sertifikasi yang sesuai dengan kebutuhan kompetensi prodi yang dievaluasi secara berkala dan hasilnya ditindaklanjuti.', 4, 1, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(19, '6', 'Unit wajib memastikan keterlaksanaan pembinaan dan pengembangan dosen menjadi asesor kompetensi yang siap ditugaskan dalam setiap pelaksanaan uji kompetensi dan sertifikasi bagi mahasiswa.', 4, 1, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(20, '7.', 'Unit wajib memastikan ketersediaan, pengembangan, dan peningkatan Tempat Uji Kompetensi (YUK) yang sesuai kebutuhan uji kompetensi dan keberadaannya disosialisasikan kepada stakeholder.', 4, 1, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(21, '8', 'Unit wajib memastikan ketersediaan mekanisme pengukuran kepuasan pengguna yang dilakukan secara berkala dengan metode yang sahih, andal, mudah digunakan, terdokumentasi, dan hasilnya disosialisasikan', 4, 1, '2024-12-24 00:11:35', '2024-12-24 00:11:35'),
(22, '1.', 'Bagian/Unit kerja memiliki rencana operasional (renop) sebagai penjabaran atau pelaksanaan renstra institusi', 5, 1, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(23, '2.', 'Unit kerja memiliki dokumen struktur organisasi dan tata kerja (SOTK) yang memuat tugas, fungsi, dan wewenang yang telah ditetapkan. ', 5, 1, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(24, '3.', 'Unit memiliki prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 5, 1, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(25, '4.', 'PNJ melalui UPA Perawatan, perbaikan dan K3 mengembangkan dan mengimplementasikan K3 dan efektifitasnya dievaluasi secara berkala.', 5, 1, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(26, '5.', 'Pemeliharaan bangunan dan Gedung dilakukan secara periodik dengan menerapkan prinsip-prinsip keselamatan dan kesehatan kerja (K3).', 5, 1, '2024-12-24 00:11:48', '2024-12-24 00:11:48'),
(27, '1.', 'Bagian/Unit kerja memiliki rencana operasional sebagai penjabaran atau pelaksanaan renstra institusi.', 6, 1, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(28, '2.', 'Pelaksanaan tata pamong unit kerja sesuai dengan dokumen struktur organisasi dan tata kerja (SOTK) yang telah ditetapkan.', 6, 1, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(29, '3.', 'Unit memiliki prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 6, 1, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(30, '4.', 'Unit melaksanakan dan menyediakan data tracer study yang dilakukan secara berkala setahun sekali dan didokumentasikan dengan baik dan hasilnya disosialisasikan.', 6, 1, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(31, '5', 'Pelacakan alumni dan partisipasi alumni dalam mendukung pengembangan institusi.', 6, 1, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(32, '6.', 'PNJ/Unit kerjasama memiliki perencanaan perluasan akses bagi lulusan PNJ mendapat kesempatan kerja Dimitra kerjasama PNJ.', 6, 1, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(33, '7.', 'Layanan kepada mahasiswa dalam bidang bimbingan dan konseling, minat dan bakat, pembinaan soft skills, beasiswa, dan kesehatan, serta program layanan bimbingan karir dan informasi kerja bagi mahasiswa dan lulusan.', 6, 1, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(34, '8', 'Unit wajib melakukan pengukuran kepuasan layanan terhadap seluruh pelaksanaan pelayanan yang dilakukan secara berkala, terukur, ditindaklanjuti, dan terdokumentasi dengan baik.', 6, 1, '2024-12-24 00:12:09', '2024-12-24 00:12:09'),
(35, '1.', 'Bagian/Unit kerja memiliki rencana operasional sebagai penjabaran atau pelaksanaan renstra institusi.', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(36, '2.', 'Unit kerja memiliki dokumen struktur organisasi dan tata kerja (SOTK) yang memuat tugas, fungsi, dan wewenang yang telah ditetapkan. \n', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(37, '3.', 'Unit memiliki prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(38, '4.', 'Pengelolaan Perpustakaan: sumber daya, dan layanan.', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(39, '5', 'Unit perpustakaan wajib menyusun secara tertulis dan melaksanakan dokumen kebijakan yang dievaluasi secara berkala dan terdokumentasi dengan baik', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(40, '6', 'Unit perpustakaan wajib melaksanakan seleksi bahan perpustakaan dan melakukan survei kebutuhan koleksi yang dievaluasi dan dilakukan sertiap tahun serta terdokumentasi dengan baik. ', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(41, '7', 'Unit Perpustakaan wajib memastikan ketersediaan jenis dan jumlah koleksi buku teks, buku referensi, jurnal, jurnal ilmiah, surat kabar, majalah, koleksi khusus, koleksi audio visual, koleksi brosur/pamflet/poster, dan database yang dilanggan, baik secara terceta maupun digital. ', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(42, '8', 'Unit perpustakaan wajib memastikan melakukan pengorganisasian bahan perpustakaan melalui pengolahan buku/moograf dengan sistem pengolahan yang otoamatis dan/atau terintegrasi dan dievaluasi secara berkala', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(43, '9', 'Unit perpustakaan wajib memastikan ketersediaan kelengkapan fisik buku yang diolah sesuai standar baku perpustakaan dan dievaluasi secara berkala', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(44, '10', 'Unit perpustakaan wajib melakukan perawatan dan pelestarian koleksi perpustakaan dengan metode pencacahan dan penyiangan secara berkala minimal 2 tahun sekali (sampai tahun 2023) dan dievaluasi serta terdokumentasi dengan baik', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(45, '11', 'Unit perpustakaan wajib memastikan ketersediaan dan kelayakan sarana dan prasarana untuk memberikan pelayanan kepada pelanggan yang dievaluasi secara berkala. ', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(46, '12', 'Unit perpustakaan wajib memiliki jenis pelayanan, penelusuran, dan keanggotaan yang ditingkatkan dan dievaluasi secara berkala  ', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(47, '13', 'Unit perpustakaan wajib melakukan promosi, literasi informasi, dan peningkatan pengunjung yang dievaluasi secara berkala', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(48, '14', 'Unit perpustakaan bersama wakil direktur terkait wajib memastikan ketersediaan dan kecukupan SDM pengelola perpustakaan yang memiliki kualifikasi akademik, sertifikasi profesi, sertifikasi kompetensi, dan keanggotaan organisasi profesi yang dievaluasi secara berkala ', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(49, '15', 'Unit perpustakaan wajib memiliki program kerja dan laporan kegiatan yang dievaluasi secara berkala', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(50, '16', 'Unit perpustakaan wajib mengupayakan peningkatan jumlah dana partisipasi masyarakat/alumni/perusahaan berupa sumbangan yang tidak mengikat', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(51, '17', 'Unit perpustakaan wajib memiliki kerjasama internaldan kerjasama eksternal yang terdokumentasi dengan baik dan dievaluasi secara berkala', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(52, '18', 'Unit perpustakaan wajib memastikan keterlaksanaan kegiatan penguatan perpustakaan yang memiliki inovasi/kreatifitas, keunikan, dan dapat meningkatkan prestasi yang terprogram terjadwal dan dievaluasi secara berkala. ', 2, 1, '2024-12-24 00:13:23', '2024-12-24 00:13:23'),
(53, '1.', 'Bagian/Unit kerja memiliki rencana operasional sebagai penjabaran atau pelaksanaan renstra institusi.', 3, 1, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(54, '2.', 'Pelaksanaan tata pamong unit kerja sesuai dengan dokumen struktur organisasi dan tata kerja (SOTK) yang telah ditetapkan.', 3, 1, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(55, '3.', 'Unit memiliki prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 3, 1, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(56, '4', 'PNJ melalui UPA RTPU memiliki dokumentasi pelaksanaan produksi produk unggulan yang dapat dipertanggungjawabkan dan efektifitasnya dievaluasi secara berkala.', 3, 1, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(57, '5.', 'Unit wajib memastikan keterlaksanaan kegiatan mengembangkan, mengelola, dan mengkoordinir pelaksanaan kursus, pelatihan, uji kompetensi, sertifikasi profesi, layanan jasa, layanan produksi, dan layanan usaha lainnya.', 3, 1, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(58, '6.', 'Unit wajib memastikan kebermanfaatan dan pemberdayaan fasilitas, sarana dan prasarana yang dimiliki oleh PNJ untuk mendukung pengembangan bisnis;', 3, 1, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(59, '7', 'Unit wajib melakukan pengukuran kepuasan layanan terhadap seluruh pelaksanaan pelayanan yang dilakukan secara berkala, terukur, ditindaklanjuti, dan terdokumentasi dengan baik.', 3, 1, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(60, '8', 'Unit wajib memastikan keterlaksanaan kegiatan pengawasan mutu dan pemasaran produk unggulan.', 3, 1, '2024-12-24 00:14:35', '2024-12-24 00:14:35'),
(61, '1.', 'Bagian/Unit kerja memiliki rencana operasional sebagai penjabaran atau pelaksanaan renstra institusi.', 9, 1, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(62, '2.', 'Pelaksanaan tata pamong unit kerja sesuai dengan dokumen struktur organisasi dan tata kerja (SOTK) yang telah ditetapkan.', 9, 1, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(63, '3.', 'Unit memiliki prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 9, 1, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(64, '4.', 'Unit wajib memastikan layanan keprotokolan terlaksana dengan cepat, tepat dan terdokumentasi dengan baik;', 9, 1, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(65, '5.', 'Unit wajib memastikan ketersediaan saluran/wadah pengaduan publik yang mudah diakses, kredibel dan akuntabel, dievaluasi secara berkala serta didokumentasikan dengan baik.', 9, 1, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(66, '6.', 'Unit wajib memastikan ketersediaan informasi pada website PNJ yang benar, lengkap, mutakhir, dan disajikan dalam dua bahasa serta dievaluasi secara berkala; ', 9, 1, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(67, '7.', 'Unit wajib memastikan ketersediaan sarana prasarana pendukung pelayanan publik yang memadai.', 9, 1, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(68, '8', 'Unit wajib melakukan pengukuran kepuasan layanan terhadap seluruh pelaksanaan pelayanan yang dilakukan secara berkala, terukur, ditindaklanjuti, dan terdokumentasi dengan baik.', 9, 1, '2024-12-24 00:16:36', '2024-12-24 00:16:36'),
(69, '1.', 'Bagian/Unit kerja memiliki rencana operasional sebagai penjabaran atau pelaksanaan renstra institusi.', 10, 1, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(70, '2.', 'Unit kerja memiliki dokumen struktur organisasi dan tata kerja (SOTK) yang memuat tugas, fungsi, dan wewenang yang telah ditetapkan. ', 10, 1, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(71, '3.', 'Unit memiliki prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 10, 1, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(72, '4.', 'Unit memiliki dokumen formil pengelolaan informasi publik yang mutakhir dan dievaluasi secara berkala.', 10, 1, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(73, '5.', 'Unit mempromosikan program dan kegiatan yang dilaksanakan institusi dalam bidang Tri Dharma Perguruan Tinggi baik ke tingkat  internasional.', 10, 1, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(74, '6.', 'Unit wajib mengelola dan melaksanakan kerjasama tridharma perguruant inggi denga perguruan tinggi di luar negeri.', 10, 1, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(75, '7.', 'Unit wajib mengelola website PNJ berbahasa Inggris', 10, 1, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(76, '8.', 'Unit wajib membuat dan menyerahkan laporan kepada Pimpinan setiap akhir tahun;', 10, 1, '2024-12-24 00:16:57', '2024-12-24 00:16:57'),
(77, '1.', 'Bagian/Unit kerja memiliki rencana operasional sebagai penjabaran atau pelaksanaan renstra institusi yang dapat diukur setiap tahunnya.', 11, 1, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(78, '2.', 'Pelaksanaan tata pamong unit kerja sesuai dengan dokumen struktur organisasi dan tata kerja (SOTK) yang telah ditetapkan.', 11, 1, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(79, '3.', 'Unit memiliki prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 11, 1, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(80, '4.', 'Sistem pengelolaan prasarana dan sarana,  Kecukupan dan mutu yang digunakan dalam penyelenggaraan kegiatan akademik dan non-akademik untuk mencapai tujuan institusi, serta Rencana pengembangannya.', 11, 1, '2024-12-24 00:17:10', '2024-12-24 00:17:10'),
(81, '5.', 'PNJ memiliki dan/atau menyiapkan/menyediakan prasarana pembelajaran sesuai isi dan proses pembelajaran serta memenuhi persyaratan sebagai prasarana pembelajaran yang berkualitas', 11, 1, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(82, '6.', 'Pemeliharaan bangunan dan Gedung dilakukan secara periodik dengan menerapkan prinsip-prinsip keselamatan dan kesehatan kerja (K3).', 11, 1, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(83, '7.', 'PNJ memiliki dan/atau menyiapkan/meyediakan prasarana umum yang mendukung proses pembelajaran yang berkualitas', 11, 1, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(84, '8', 'PNJ melalui Koord. terkait wajib memastikan keterlaksanaan pengembangan Lahan Kampus yang aman, nyaman, dan sesuai fungsi.', 11, 1, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(85, '9', 'PNJ melalui unit terkait wajib memastikan keterlaksanaan pengembangan green campus yang terencana dengan baik dan dievaluasi secara berkala.', 11, 1, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(86, '10', 'PNJ melalui unit terkait wajib memastikan keterlaksanaan pengembangan smart building.', 11, 1, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(87, '11.', 'PNJ melalui unit terkait wajib memastikan ketersediaan dan keterlaksanaan pengembangan prasarana dan sarana untuk disabilitas dan atau Anak Berkebutuhan Khusus (ABK) yang dievaluasi secara berkala.', 11, 1, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(88, '12', 'PNJ melalui unit terkait wajib memastikan ketersediaan dan keterlaksanaan pengembangan prasarana dan sarana yang terintegrasi guna mendukung kemajuan teknologi komunikasi dan informasi.', 11, 1, '2024-12-24 00:17:11', '2024-12-24 00:17:11'),
(89, '1.', 'Unit wajib memiliki penetapan kebijakan pedoman/standar kearsipan untuk pengelolaan arsip dinamis dan pengelolaan arsip statis pada LKPT (Lembaga Kearsipan Perguruan Tinggi)', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(90, '2', 'Unit wajib melakukan pengelolaan asip dinamis yang meliputi penciptaan, penggunaan, dan pemeliharaan, penyusutan arsip, serta program arip vital dan arsip terjaga yang dilaksanakan setiap tahun dan terdokumentasi dengan baik', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(91, '3', 'Unit wajib memiliki program arsip vital dilaksanakan di lingkungan PT yang meliputi identifikasi, pelindungan dan pengamanan, penyelamatan dan pemulihan arsip yang dilaksanakan setiap tahun dan terdokumentasi dengan baik', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(92, '4', 'Unit wajib memiliki program arsip terjaga pemberkasan arsip terjaga yang dilaksanakan secara konsisten dan dievaluasi secara berkala.', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(93, '5', 'Unit wajib memiliki program arsip terjaga pelaporan arsip terjaga yang dilaksanakan secara konsiten dan dievaluasi secara berkala.', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(94, '6', 'Unit wajib memiliki program arsip terjaga Penyerahan Salinan Autentik Naskah Asli Arsip Terjaga', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(95, '7', 'Unit wajib memiliki pengelolaan arsip statis di lingkungan perguruan tinggi dilaksanakan oleh LKPT terhadap arsip statis yang diserahkan oleh satuan kerja di lingkungan perguruan tinggi dan civitas akademika ', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(96, '8', 'Unit wajib memiliki penyelenggaraan kearsipan di lingkungan perguruan tinggi dengan sumber daya pendukung yang meliputi organisasi kearsipan', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(97, '9', 'Unit wajib memiliki penyelenggaraan kearsipan di lingkungan perguruan tinggi dengan sumber daya pendukung yang memadai dan kompeten meliputi sumber daya manusia dan sarana prasarana yang dievaluasi secara berkala.', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(98, '10', 'Unit wajib memiliki penyelenggaraan kearsipan di lingkungan perguruan tinggi dengan sumber daya pendukung yang memadai mengenai pendanaan kearsipan yang dievaluasi secara berkala.', 15, 1, '2024-12-24 00:17:26', '2024-12-24 00:17:26'),
(99, '1.', 'Sumber Daya Manusia', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(100, '2.', 'Sarana dan Prasarana', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(101, '3.', 'Anggaran Kemitraan', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(102, '4.', 'Kepemimpinan :\n1. Kapasitas\n2. Komitmen\n3. Keterlibatan', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(103, '5.', 'Tatakelola & Organisasi\n1. Arah kemitraan\n2.  Dokumen kerjasama\n3. Rencana kerja kemitraan\n4. Keberadaan unit kemitraan\n', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(104, '6', 'Kebijakan Regulasi dan Petunjuk Pelaksanaan\n1. Aturan & Kebijakan\n2. Prosedur kemitraan', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(105, '7', 'Kapabilitas dan KompetensI\n1. Kompetensi berjejaring\n2. Jumlah prodi yang menjalin kemitraan', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(106, '8', 'Proses \n1. Rencana kerja\n2. Koordinasi dan Komunikasi\n3. Pelaksanaan Kemitraan\n4. Monitoring dan Evaluasi', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(107, '9', 'Kuantitas', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(108, '10', 'Kualitas', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(109, '11', 'keragaman', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(110, '12', 'valuasi kerja sama ', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(111, '13', 'Cakupan dampak kemitraan', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(112, '14', 'Keragaman dampak lainnya', 17, 1, '2024-12-24 02:39:42', '2024-12-24 02:39:42'),
(113, '1.', 'Sumber Daya Manusia', 18, 1, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(114, '2.', 'Sarana dan Prasarana', 18, 1, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(115, '3.', 'Anggaran Kemitraan', 18, 1, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(116, '4.', 'Kepemimpinan :\n1. Kapasitas\n2. Komitmen\n3. Keterlibatan', 18, 1, '2024-12-24 02:39:59', '2024-12-24 02:39:59'),
(117, '5.', 'Tatakelola & Organisasi\n1. Arah kemitraan\n2.  Dokumen kerjasama\n3. Rencana kerja kemitraan\n4. Keberadaan unit kemitraan\n', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(118, '6', 'Kebijakan Regulasi dan Petunjuk Pelaksanaan\n1. Aturan & Kebijakan\n2. Prosedur kemitraan', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(119, '7', 'Kapabilitas dan KompetensI\n1. Kompetensi berjejaring\n2. Jumlah prodi yang menjalin kemitraan', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(120, '8', 'Proses \n1. Rencana kerja\n2. Koordinasi dan Komunikasi\n3. Pelaksanaan Kemitraan\n4. Monitoring dan Evaluasi', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(121, '9', 'Kuantitas', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(122, '10', 'Kualitas', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(123, '11', 'keragaman', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(124, '12', 'valuasi kerja sama ', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(125, '13', 'Cakupan dampak kemitraan', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(126, '14', 'Keragaman dampak lainnya', 18, 1, '2024-12-24 02:40:00', '2024-12-24 02:40:00'),
(127, '1.', 'Bagian/Unit kerja wajib memiliki rencana operasional 5 tahunan sebagai penjabaran atau pelaksanaan renstra institusi dalam bentuk rumusan program yang rinci dan jelas serta dievaluasi secara berkala.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(128, '2.', 'Bagian/Unit bersama Wakil Direktur Bidang Administrasi Umum dan Keuangan wajib menyusun kebijakan yang lengkap dan akuntabel yang mencakup: perencanaan, rekrutmen, seleksi, dan pemberhentian pegawai,  orientasi dan penempatan pegawai,  pengembangan karir,  remunerasi, penghargaan, dan sanksi sesuai peraturan terbaru yang dievaluasi secara berkala.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(129, '3.', 'Pelaksanaan tata pamong unit kerja sesuai dengan dokumen struktur organisasi dan tata kerja (SOTK) yang telah ditetapkan.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(130, '4.', 'Bidang/Unit wajib memastikan ketersediaan dan keberlangsungan jumlah pegawai untuk periode 5 tahunan yang sesuai dengan kebutuhan berdasarkan analisis jabatan dan dievaluasi secara berkala.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(131, '5.', 'Unit wajib memiliki prosedur lengkap dalam memberikan layanan kepada civitas akademika yang disosialisasikan dan dievaluasi setiap tahun.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(132, '6.', 'Bagian/Unit bersama Wadir Bid. Adm Umum dan Keuangan wajib memastukan kecukupan, kompetensi, dan kualifikasi dosen dan tenaga kependidikan yang dievaluasi dan ditingkatkan secara berkala.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(133, '7.', 'Kepuasan dosen dan tenaga kependidikan (pustakawan, laboran, teknisi, tenaga administrasi) terhadap terhadap sistem pengelolaan sumber daya manusia.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(134, '8.', 'Bagian/Unit wajib memastikan pengembangan sistem informasi kepegawaian terintegrasi berbasis ICT.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(135, '9.', 'Prosess pengisian jabatan yang lowong  sesuai posisi formasinya terlihat di Peta Jabatan sesuai hasil Analisa Jabatan dan Analisa Beban Kerja Pegawai sehingga muncul kebutuhan SDM bidang kompetensinya sesuai dengan Usulan Formasi diusulkan oleh Direktur ke Kemeristekdikti', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(136, '10.', 'Ketetapan Usul Formasi sebagai sumber perencanaan SDM dan telah direvisi sesuai kebutuhan, selanjutnya diverifikasi Biro Kepegawaian disetujui oleh Menteri', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(137, '15.', 'Perekrutan CPNS dilaksanakan bebas KKN, transparan, terpusat, dan pendaftarannya secara online di web () yang dikoordinasi oleh Panselnas Kemenristekdikti dengan dukungan Panitia Pelaksana dari Institusi/Lembaga yang ditunjuk', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(138, '16.', 'PNS wajib mempunya Sertifikat Kompetensi Dasar yang diperoleh melaui Pelatihan AA dan Pekerti bagi Dosen, Tenaga Kependidikan mengikuti Pelatihan, Pelatihan Pelayanan Prima', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(139, '17.', 'Bagian/Unit wajib memastikan dosen mengikuti sertifikasi profesi sebagai pendidik dan telah memenuhi angka kredit untuk untuk Usulan Kenaikan Pangkat menjadi Asisten Ahli dengan jumlah Angka Kredit sesuai ketentuan yang berlaku.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(140, '18.', 'Surat Pemberitahuan kenaikan pangkat bagi Dosen/ PLP/ Fungsional Tertentu dan harus memenuhi ketiga unsur Tri Dharma Perguruan Tinggi untuk perhitungan Angka Kredit minimalnya dengan mengacu pada SOP dan sesuai pangkat yang diajukann PNS', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(141, '19.', 'Tim Penghitung Angka Kredit melaksanakan rapat kenaikan pangkat bersama Senat PNJ untuk menetapkan kelayakan kenaikan pangkat Dosen/Tenaga Kependidikan sesuai pangkat yang diajukann PNS. Khusus untuk kenaikan pangkat menjadi Lektor Kepala diusulkan ke Kemenristekdikti, keputusan kenaikan pangkatnya dengan SK Menteri', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(142, '20.', 'Bagian/Unit wajib melaksanakan kegiatan pembinaan Tenaga Kependidikan setiap tahunnya sesuai kompetensi /keterampilan sesuai bidang kerjanya di Bagian/ Jurusan/Unit sebagai bentuk pengembangan diri', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(143, '21.', 'Usulan Studi Lanjut S3 bagi Dosen dengan membuat Surat Tugas Belajar di dalam Negeri atau Luar Negeri bagi Dosen; dan studi lanjut D4/S1/S2 di dalam Negeri bagi Tenaga Kependidikan; sesuai SOP dan peminatan bidang studi Dosen/Tenaga kependidikan dengan pemberian nominal dana bantuan tertentu setelah mendapat persetujuan/instruksi pimpinan, serta sesuai jenjang pendidikan pengusul ', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(144, '22.', 'PNJ melalui unit kepegawaian memberi penghargaan bagi PNS yang berprestasi sesuai tugas dan fungsinya dengan diberi kesempatan yang sama untuk berkompetsisi menjadi Dosen atau Tenaga Kependidikan berprestasi untuk tiap tahun penyelenggaraan di tingkat Institudi atau tingkat Nasional', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(145, '23.', 'Penghitungan tunjangan kinerja bagi setiap Tenaga Kependidikan sesuai SOP, nominalnya memperhatikan faktor presentase kehadiran dan capaian kinerja per bulan sesuai level beban kerjanya, selain honor/ tunjangan kesehatan, hari tua, pension,  selain honor', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(146, '24.', 'Pemberian sanksi atau hukuman ringan/sedang/berat pelanggaran larangan/kewajiban PNS setelah dirapatkan oleh Lembaga/Tim Kode Etik Pegawai dan mengacu pada Kode Etik.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(147, '25', 'PNJ memberlakukan cuti bagi pegawai sesuai SOP dan jenis cuti yang diambil oleh Tenaga kependidikan sepanjang total dari akumulasi cuti pertahunnya masih memenuhi ketentuan yang berlaku, kecuali bagi PNS yang sedang studi lanjut atau terkena kasus tindak pidana ', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(148, '26.', 'PNJ menerbitkan Surat Mutasi Dosen/ Tenaga atas usul pegawai yang berangkutan, mutasi', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(149, '27.', 'PNJ difasilitasi oleh BKN untuk menggunakan Aplikasi Sistem Layanan Purnabakti Pegawai (https://sapk.bkn.go.id) untuk input data pegawai yang akan pensiun', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29'),
(150, '28', 'Bagian/Unit wajib memastikan keterlaksanaan layanan bagi pegawai yang akan memasuki masa pensiun sesuai dengan ketentuan yang berlaku serta pelaksanaannya disosialisasikan secara menyeluruh.', 19, 1, '2024-12-24 03:05:29', '2024-12-24 03:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `record_logins`
--

CREATE TABLE `record_logins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `waktu_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `record_logins`
--

INSERT INTO `record_logins` (`id`, `user_id`, `waktu_login`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-10-04 11:27:55', '2024-10-04 03:27:55', '2024-10-04 03:27:55'),
(2, 1, '2024-10-04 16:28:57', '2024-10-04 08:28:57', '2024-10-04 08:28:57'),
(3, 1, '2024-10-04 23:44:02', '2024-10-04 15:44:02', '2024-10-04 15:44:02'),
(4, 1, '2024-10-06 08:17:51', '2024-10-06 00:17:51', '2024-10-06 00:17:51'),
(5, 1, '2024-10-06 23:26:50', '2024-10-06 15:26:50', '2024-10-06 15:26:50'),
(6, 1, '2024-10-09 11:35:33', '2024-10-09 03:35:33', '2024-10-09 03:35:33'),
(7, 1, '2024-10-11 13:40:57', '2024-10-11 05:40:57', '2024-10-11 05:40:57'),
(8, 1, '2024-10-13 10:41:58', '2024-10-13 02:41:58', '2024-10-13 02:41:58'),
(9, 1, '2024-10-15 22:48:26', '2024-10-15 14:48:26', '2024-10-15 14:48:26'),
(10, 1, '2024-11-04 14:04:52', '2024-11-04 06:04:52', '2024-11-04 06:04:52'),
(11, 1, '2024-11-08 17:48:35', '2024-11-08 09:48:35', '2024-11-08 09:48:35'),
(12, 1, '2024-11-09 09:04:18', '2024-11-09 01:04:18', '2024-11-09 01:04:18'),
(13, 1, '2024-11-10 23:39:49', '2024-11-10 15:39:49', '2024-11-10 15:39:49'),
(14, 1, '2024-11-10 23:47:49', '2024-11-10 15:47:49', '2024-11-10 15:47:49'),
(15, 7, '2024-11-10 23:57:00', '2024-11-10 15:57:00', '2024-11-10 15:57:00'),
(16, 1, '2024-11-11 10:07:17', '2024-11-11 02:07:17', '2024-11-11 02:07:17'),
(17, 1, '2024-11-11 13:28:28', '2024-11-11 05:28:28', '2024-11-11 05:28:28'),
(18, 1, '2024-11-11 13:29:25', '2024-11-11 05:29:25', '2024-11-11 05:29:25'),
(19, 1, '2024-11-11 17:47:30', '2024-11-11 09:47:30', '2024-11-11 09:47:30'),
(20, 1, '2024-11-12 11:01:48', '2024-11-12 03:01:48', '2024-11-12 03:01:48'),
(21, 1, '2024-11-12 16:16:53', '2024-11-12 08:16:53', '2024-11-12 08:16:53'),
(22, 1, '2024-11-14 10:20:35', '2024-11-14 02:20:35', '2024-11-14 02:20:35'),
(23, 1, '2024-11-17 19:34:26', '2024-11-17 11:34:26', '2024-11-17 11:34:26'),
(24, 1, '2024-11-20 09:44:04', '2024-11-20 01:44:04', '2024-11-20 01:44:04'),
(25, 1, '2024-11-26 14:25:42', '2024-11-26 06:25:42', '2024-11-26 06:25:42'),
(26, 1, '2024-12-02 17:54:43', '2024-12-02 09:54:43', '2024-12-02 09:54:43'),
(27, 1, '2024-12-03 11:22:54', '2024-12-03 03:22:54', '2024-12-03 03:22:54'),
(28, 1, '2024-12-06 09:21:36', '2024-12-06 01:21:36', '2024-12-06 01:21:36'),
(29, 1, '2024-12-18 10:01:23', '2024-12-18 02:01:23', '2024-12-18 02:01:23'),
(30, 1, '2024-12-18 13:57:05', '2024-12-18 05:57:05', '2024-12-18 05:57:05'),
(31, 1, '2024-12-19 11:22:12', '2024-12-19 03:22:12', '2024-12-19 03:22:12'),
(32, 1, '2024-12-20 17:08:05', '2024-12-20 09:08:05', '2024-12-20 09:08:05'),
(33, 1, '2024-12-23 22:35:47', '2024-12-23 14:35:47', '2024-12-23 14:35:47'),
(34, 1, '2024-12-23 22:36:41', '2024-12-23 14:36:41', '2024-12-23 14:36:41'),
(35, 1, '2024-12-24 06:15:37', '2024-12-23 22:15:37', '2024-12-23 22:15:37'),
(36, 1, '2024-12-24 07:54:14', '2024-12-23 23:54:14', '2024-12-23 23:54:14'),
(37, 8, '2024-12-24 08:33:18', '2024-12-24 00:33:18', '2024-12-24 00:33:18'),
(38, 1, '2024-12-24 08:33:45', '2024-12-24 00:33:45', '2024-12-24 00:33:45'),
(39, 8, '2024-12-24 08:45:40', '2024-12-24 00:45:40', '2024-12-24 00:45:40'),
(40, 8, '2024-12-24 09:11:14', '2024-12-24 01:11:14', '2024-12-24 01:11:14'),
(41, 1, '2024-12-24 09:13:04', '2024-12-24 01:13:04', '2024-12-24 01:13:04'),
(42, 1, '2024-12-24 09:58:07', '2024-12-24 01:58:07', '2024-12-24 01:58:07'),
(43, 1, '2024-12-24 10:03:56', '2024-12-24 02:03:56', '2024-12-24 02:03:56'),
(44, 1, '2024-12-24 10:37:33', '2024-12-24 02:37:33', '2024-12-24 02:37:33'),
(45, 1, '2024-12-24 11:04:30', '2024-12-24 03:04:30', '2024-12-24 03:04:30'),
(46, 8, '2024-12-24 11:16:40', '2024-12-24 03:16:40', '2024-12-24 03:16:40'),
(47, 1, '2024-12-25 00:21:43', '2024-12-24 16:21:43', '2024-12-24 16:21:43'),
(48, 1, '2024-12-26 15:02:42', '2024-12-26 07:02:42', '2024-12-26 07:02:42'),
(49, 1, '2024-12-26 20:36:07', '2024-12-26 12:36:07', '2024-12-26 12:36:07'),
(50, 17, '2024-12-27 05:17:09', '2024-12-26 21:17:09', '2024-12-26 21:17:09'),
(51, 11, '2024-12-27 05:28:41', '2024-12-26 21:28:41', '2024-12-26 21:28:41'),
(52, 11, '2024-12-27 07:18:58', '2024-12-26 23:18:58', '2024-12-26 23:18:58'),
(53, 1, '2024-12-27 09:30:20', '2024-12-27 01:30:20', '2024-12-27 01:30:20'),
(54, 17, '2024-12-27 10:07:37', '2024-12-27 02:07:37', '2024-12-27 02:07:37'),
(55, 12, '2024-12-27 11:35:20', '2024-12-27 03:35:20', '2024-12-27 03:35:20'),
(56, 12, '2024-12-27 11:35:21', '2024-12-27 03:35:21', '2024-12-27 03:35:21'),
(57, 24, '2024-12-27 13:49:17', '2024-12-27 05:49:17', '2024-12-27 05:49:17'),
(58, 17, '2024-12-27 13:58:55', '2024-12-27 05:58:55', '2024-12-27 05:58:55'),
(59, 1, '2024-12-27 14:51:12', '2024-12-27 06:51:12', '2024-12-27 06:51:12'),
(60, 24, '2024-12-27 15:07:28', '2024-12-27 07:07:28', '2024-12-27 07:07:28'),
(61, 1, '2024-12-27 15:14:01', '2024-12-27 07:14:01', '2024-12-27 07:14:01'),
(62, 12, '2024-12-27 15:21:21', '2024-12-27 07:21:21', '2024-12-27 07:21:21'),
(63, 1, '2024-12-27 15:28:59', '2024-12-27 07:28:59', '2024-12-27 07:28:59'),
(64, 24, '2024-12-27 15:32:25', '2024-12-27 07:32:25', '2024-12-27 07:32:25'),
(65, 12, '2024-12-27 15:46:22', '2024-12-27 07:46:22', '2024-12-27 07:46:22'),
(66, 8, '2024-12-27 16:37:27', '2024-12-27 08:37:27', '2024-12-27 08:37:27'),
(67, 24, '2024-12-27 17:03:56', '2024-12-27 09:03:56', '2024-12-27 09:03:56'),
(68, 11, '2024-12-27 17:29:45', '2024-12-27 09:29:45', '2024-12-27 09:29:45'),
(69, 9, '2024-12-27 17:41:11', '2024-12-27 09:41:11', '2024-12-27 09:41:11'),
(70, 24, '2024-12-27 17:47:40', '2024-12-27 09:47:40', '2024-12-27 09:47:40'),
(71, 11, '2024-12-27 17:59:41', '2024-12-27 09:59:41', '2024-12-27 09:59:41'),
(72, 24, '2024-12-27 19:18:37', '2024-12-27 11:18:37', '2024-12-27 11:18:37'),
(73, 24, '2024-12-27 20:43:22', '2024-12-27 12:43:22', '2024-12-27 12:43:22'),
(74, 24, '2024-12-27 20:45:02', '2024-12-27 12:45:02', '2024-12-27 12:45:02'),
(75, 11, '2024-12-28 07:00:38', '2024-12-27 23:00:38', '2024-12-27 23:00:38'),
(76, 16, '2024-12-28 07:51:33', '2024-12-27 23:51:33', '2024-12-27 23:51:33'),
(77, 9, '2024-12-28 19:21:35', '2024-12-28 11:21:35', '2024-12-28 11:21:35'),
(78, 9, '2024-12-28 20:17:20', '2024-12-28 12:17:20', '2024-12-28 12:17:20'),
(79, 11, '2024-12-29 03:58:06', '2024-12-28 19:58:06', '2024-12-28 19:58:06'),
(80, 11, '2024-12-29 05:57:55', '2024-12-28 21:57:55', '2024-12-28 21:57:55'),
(81, 11, '2024-12-29 06:16:44', '2024-12-28 22:16:44', '2024-12-28 22:16:44'),
(82, 11, '2024-12-29 06:36:22', '2024-12-28 22:36:22', '2024-12-28 22:36:22'),
(83, 11, '2024-12-29 06:55:46', '2024-12-28 22:55:46', '2024-12-28 22:55:46'),
(84, 11, '2024-12-29 07:32:30', '2024-12-28 23:32:30', '2024-12-28 23:32:30'),
(85, 11, '2024-12-29 09:33:19', '2024-12-29 01:33:19', '2024-12-29 01:33:19'),
(86, 11, '2024-12-29 09:49:47', '2024-12-29 01:49:47', '2024-12-29 01:49:47'),
(87, 11, '2024-12-29 10:13:28', '2024-12-29 02:13:28', '2024-12-29 02:13:28'),
(88, 10, '2024-12-29 11:09:39', '2024-12-29 03:09:39', '2024-12-29 03:09:39'),
(89, 10, '2024-12-29 11:28:44', '2024-12-29 03:28:44', '2024-12-29 03:28:44'),
(90, 38, '2024-12-29 15:49:46', '2024-12-29 07:49:46', '2024-12-29 07:49:46'),
(91, 15, '2024-12-30 01:10:25', '2024-12-29 17:10:25', '2024-12-29 17:10:25'),
(92, 11, '2024-12-30 06:17:08', '2024-12-29 22:17:08', '2024-12-29 22:17:08'),
(93, 16, '2024-12-30 07:50:37', '2024-12-29 23:50:37', '2024-12-29 23:50:37'),
(94, 16, '2024-12-30 08:01:06', '2024-12-30 00:01:06', '2024-12-30 00:01:06'),
(95, 16, '2024-12-30 08:39:10', '2024-12-30 00:39:10', '2024-12-30 00:39:10'),
(96, 12, '2024-12-30 08:40:59', '2024-12-30 00:40:59', '2024-12-30 00:40:59'),
(97, 12, '2024-12-30 08:41:44', '2024-12-30 00:41:44', '2024-12-30 00:41:44'),
(98, 1, '2024-12-30 08:42:03', '2024-12-30 00:42:03', '2024-12-30 00:42:03'),
(99, 30, '2024-12-30 08:43:34', '2024-12-30 00:43:34', '2024-12-30 00:43:34'),
(100, 12, '2024-12-30 08:56:19', '2024-12-30 00:56:19', '2024-12-30 00:56:19'),
(101, 12, '2024-12-30 09:01:14', '2024-12-30 01:01:14', '2024-12-30 01:01:14'),
(102, 34, '2024-12-30 09:14:45', '2024-12-30 01:14:45', '2024-12-30 01:14:45'),
(103, 11, '2024-12-30 09:27:05', '2024-12-30 01:27:05', '2024-12-30 01:27:05'),
(104, 1, '2024-12-30 11:24:27', '2024-12-30 03:24:27', '2024-12-30 03:24:27'),
(105, 42, '2024-12-30 14:03:19', '2024-12-30 06:03:19', '2024-12-30 06:03:19'),
(106, 45, '2024-12-30 14:11:16', '2024-12-30 06:11:16', '2024-12-30 06:11:16'),
(107, 22, '2024-12-30 14:11:43', '2024-12-30 06:11:43', '2024-12-30 06:11:43'),
(108, 9, '2024-12-30 14:20:27', '2024-12-30 06:20:27', '2024-12-30 06:20:27'),
(109, 9, '2024-12-30 14:36:09', '2024-12-30 06:36:09', '2024-12-30 06:36:09'),
(110, 9, '2024-12-30 14:36:52', '2024-12-30 06:36:52', '2024-12-30 06:36:52'),
(111, 22, '2024-12-30 14:41:17', '2024-12-30 06:41:17', '2024-12-30 06:41:17'),
(112, 22, '2024-12-30 14:42:25', '2024-12-30 06:42:25', '2024-12-30 06:42:25'),
(113, 45, '2024-12-30 14:57:49', '2024-12-30 06:57:49', '2024-12-30 06:57:49'),
(114, 9, '2024-12-30 15:01:42', '2024-12-30 07:01:42', '2024-12-30 07:01:42'),
(115, 9, '2024-12-30 15:05:14', '2024-12-30 07:05:14', '2024-12-30 07:05:14'),
(116, 45, '2024-12-30 15:09:03', '2024-12-30 07:09:03', '2024-12-30 07:09:03'),
(117, 45, '2024-12-30 15:20:05', '2024-12-30 07:20:05', '2024-12-30 07:20:05'),
(118, 22, '2024-12-30 15:21:28', '2024-12-30 07:21:28', '2024-12-30 07:21:28'),
(119, 22, '2024-12-30 15:35:58', '2024-12-30 07:35:58', '2024-12-30 07:35:58'),
(120, 22, '2024-12-30 15:55:41', '2024-12-30 07:55:41', '2024-12-30 07:55:41'),
(121, 45, '2024-12-30 15:58:53', '2024-12-30 07:58:53', '2024-12-30 07:58:53'),
(122, 42, '2024-12-30 15:59:25', '2024-12-30 07:59:25', '2024-12-30 07:59:25'),
(123, 1, '2024-12-30 16:02:52', '2024-12-30 08:02:52', '2024-12-30 08:02:52'),
(124, 45, '2024-12-30 16:16:46', '2024-12-30 08:16:46', '2024-12-30 08:16:46'),
(125, 22, '2024-12-30 16:18:23', '2024-12-30 08:18:23', '2024-12-30 08:18:23'),
(126, 1, '2024-12-30 16:29:59', '2024-12-30 08:29:59', '2024-12-30 08:29:59'),
(127, 45, '2024-12-30 16:34:04', '2024-12-30 08:34:04', '2024-12-30 08:34:04'),
(128, 22, '2024-12-30 16:37:16', '2024-12-30 08:37:16', '2024-12-30 08:37:16'),
(129, 45, '2024-12-31 06:11:57', '2024-12-30 22:11:57', '2024-12-30 22:11:57'),
(130, 42, '2024-12-31 08:21:09', '2024-12-31 00:21:09', '2024-12-31 00:21:09'),
(131, 9, '2024-12-31 09:38:20', '2024-12-31 01:38:20', '2024-12-31 01:38:20'),
(132, 9, '2024-12-31 09:50:25', '2024-12-31 01:50:25', '2024-12-31 01:50:25'),
(133, 9, '2024-12-31 09:55:59', '2024-12-31 01:55:59', '2024-12-31 01:55:59'),
(134, 9, '2024-12-31 10:27:14', '2024-12-31 02:27:14', '2024-12-31 02:27:14'),
(135, 41, '2024-12-31 11:47:30', '2024-12-31 03:47:30', '2024-12-31 03:47:30'),
(136, 41, '2024-12-31 13:16:41', '2024-12-31 05:16:41', '2024-12-31 05:16:41'),
(137, 42, '2024-12-31 13:36:07', '2024-12-31 05:36:07', '2024-12-31 05:36:07'),
(138, 15, '2024-12-31 15:16:35', '2024-12-31 07:16:35', '2024-12-31 07:16:35'),
(139, 24, '2025-01-01 08:22:05', '2025-01-01 00:22:05', '2025-01-01 00:22:05'),
(140, 24, '2025-01-01 08:51:38', '2025-01-01 00:51:38', '2025-01-01 00:51:38'),
(141, 14, '2025-01-01 18:47:53', '2025-01-01 10:47:53', '2025-01-01 10:47:53'),
(142, 1, '2025-01-01 21:56:27', '2025-01-01 13:56:27', '2025-01-01 13:56:27'),
(143, 11, '2025-01-02 03:28:05', '2025-01-01 19:28:05', '2025-01-01 19:28:05'),
(144, 11, '2025-01-02 03:43:08', '2025-01-01 19:43:08', '2025-01-01 19:43:08'),
(145, 45, '2025-01-02 06:55:20', '2025-01-01 22:55:20', '2025-01-01 22:55:20'),
(146, 14, '2025-01-02 08:21:31', '2025-01-02 00:21:31', '2025-01-02 00:21:31'),
(147, 24, '2025-01-02 08:49:08', '2025-01-02 00:49:08', '2025-01-02 00:49:08'),
(148, 8, '2025-01-02 09:16:57', '2025-01-02 01:16:57', '2025-01-02 01:16:57'),
(149, 12, '2025-01-02 09:49:11', '2025-01-02 01:49:11', '2025-01-02 01:49:11'),
(150, 12, '2025-01-02 10:08:03', '2025-01-02 02:08:03', '2025-01-02 02:08:03'),
(151, 17, '2025-01-02 10:08:12', '2025-01-02 02:08:12', '2025-01-02 02:08:12'),
(152, 12, '2025-01-02 10:10:50', '2025-01-02 02:10:50', '2025-01-02 02:10:50'),
(153, 12, '2025-01-02 10:12:36', '2025-01-02 02:12:36', '2025-01-02 02:12:36'),
(154, 36, '2025-01-02 10:12:36', '2025-01-02 02:12:36', '2025-01-02 02:12:36'),
(155, 38, '2025-01-02 10:13:11', '2025-01-02 02:13:11', '2025-01-02 02:13:11'),
(156, 12, '2025-01-02 10:15:42', '2025-01-02 02:15:42', '2025-01-02 02:15:42'),
(157, 36, '2025-01-02 10:25:42', '2025-01-02 02:25:42', '2025-01-02 02:25:42'),
(158, 38, '2025-01-02 10:38:12', '2025-01-02 02:38:12', '2025-01-02 02:38:12'),
(159, 12, '2025-01-02 10:38:54', '2025-01-02 02:38:54', '2025-01-02 02:38:54'),
(160, 12, '2025-01-02 10:39:14', '2025-01-02 02:39:14', '2025-01-02 02:39:14'),
(161, 12, '2025-01-02 10:40:48', '2025-01-02 02:40:48', '2025-01-02 02:40:48'),
(162, 36, '2025-01-02 10:45:20', '2025-01-02 02:45:20', '2025-01-02 02:45:20'),
(163, 17, '2025-01-02 11:07:34', '2025-01-02 03:07:34', '2025-01-02 03:07:34'),
(164, 12, '2025-01-02 11:07:37', '2025-01-02 03:07:37', '2025-01-02 03:07:37'),
(165, 38, '2025-01-02 11:08:38', '2025-01-02 03:08:38', '2025-01-02 03:08:38'),
(166, 1, '2025-01-02 11:10:28', '2025-01-02 03:10:28', '2025-01-02 03:10:28'),
(167, 12, '2025-01-02 11:11:24', '2025-01-02 03:11:24', '2025-01-02 03:11:24'),
(168, 12, '2025-01-02 11:11:34', '2025-01-02 03:11:34', '2025-01-02 03:11:34'),
(169, 1, '2025-01-02 11:28:00', '2025-01-02 03:28:00', '2025-01-02 03:28:00'),
(170, 12, '2025-01-02 11:37:54', '2025-01-02 03:37:54', '2025-01-02 03:37:54'),
(171, 12, '2025-01-02 11:38:17', '2025-01-02 03:38:17', '2025-01-02 03:38:17'),
(172, 11, '2025-01-02 11:41:51', '2025-01-02 03:41:51', '2025-01-02 03:41:51'),
(173, 38, '2025-01-02 11:51:34', '2025-01-02 03:51:34', '2025-01-02 03:51:34'),
(174, 36, '2025-01-02 11:52:01', '2025-01-02 03:52:01', '2025-01-02 03:52:01'),
(175, 17, '2025-01-02 13:24:29', '2025-01-02 05:24:29', '2025-01-02 05:24:29'),
(176, 36, '2025-01-02 13:25:31', '2025-01-02 05:25:31', '2025-01-02 05:25:31'),
(177, 36, '2025-01-02 13:38:57', '2025-01-02 05:38:57', '2025-01-02 05:38:57'),
(178, 11, '2025-01-02 13:44:28', '2025-01-02 05:44:28', '2025-01-02 05:44:28'),
(179, 17, '2025-01-02 14:15:30', '2025-01-02 06:15:30', '2025-01-02 06:15:30'),
(180, 17, '2025-01-02 14:44:15', '2025-01-02 06:44:15', '2025-01-02 06:44:15'),
(181, 17, '2025-01-02 15:08:50', '2025-01-02 07:08:50', '2025-01-02 07:08:50'),
(182, 38, '2025-01-02 16:55:08', '2025-01-02 08:55:08', '2025-01-02 08:55:08'),
(183, 38, '2025-01-02 17:25:04', '2025-01-02 09:25:04', '2025-01-02 09:25:04'),
(184, 1, '2025-01-02 18:17:47', '2025-01-02 10:17:47', '2025-01-02 10:17:47'),
(185, 1, '2025-01-02 19:07:04', '2025-01-02 11:07:04', '2025-01-02 11:07:04'),
(186, 1, '2025-01-03 10:13:36', '2025-01-03 02:13:36', '2025-01-03 02:13:36'),
(187, 1, '2025-01-03 10:59:36', '2025-01-03 02:59:36', '2025-01-03 02:59:36'),
(188, 1, '2025-01-03 11:07:37', '2025-01-03 03:07:37', '2025-01-03 03:07:37'),
(189, 1, '2025-01-03 11:23:47', '2025-01-03 03:23:47', '2025-01-03 03:23:47'),
(190, 1, '2025-01-03 12:50:21', '2025-01-03 04:50:21', '2025-01-03 04:50:21'),
(191, 22, '2025-01-03 14:04:38', '2025-01-03 06:04:38', '2025-01-03 06:04:38'),
(192, 22, '2025-01-03 14:09:49', '2025-01-03 06:09:49', '2025-01-03 06:09:49'),
(193, 36, '2025-01-03 14:42:27', '2025-01-03 06:42:27', '2025-01-03 06:42:27'),
(194, 43, '2025-01-03 14:44:02', '2025-01-03 06:44:02', '2025-01-03 06:44:02'),
(195, 1, '2025-01-03 14:48:04', '2025-01-03 06:48:04', '2025-01-03 06:48:04'),
(196, 17, '2025-01-03 15:08:04', '2025-01-03 07:08:04', '2025-01-03 07:08:04'),
(197, 1, '2025-01-03 19:27:52', '2025-01-03 11:27:52', '2025-01-03 11:27:52'),
(198, 1, '2025-01-04 18:48:33', '2025-01-04 10:48:33', '2025-01-04 10:48:33'),
(199, 34, '2025-01-05 21:12:35', '2025-01-05 13:12:35', '2025-01-05 13:12:35'),
(200, 1, '2025-01-06 07:58:09', '2025-01-05 23:58:09', '2025-01-05 23:58:09'),
(201, 46, '2025-01-06 08:03:02', '2025-01-06 00:03:02', '2025-01-06 00:03:02'),
(202, 1, '2025-01-06 09:11:44', '2025-01-06 01:11:44', '2025-01-06 01:11:44'),
(203, 1, '2025-01-06 09:25:58', '2025-01-06 01:25:58', '2025-01-06 01:25:58'),
(204, 1, '2025-01-06 09:59:08', '2025-01-06 01:59:08', '2025-01-06 01:59:08'),
(205, 46, '2025-01-06 13:07:14', '2025-01-06 05:07:14', '2025-01-06 05:07:14'),
(206, 24, '2025-01-06 13:17:15', '2025-01-06 05:17:15', '2025-01-06 05:17:15'),
(207, 17, '2025-01-06 13:25:32', '2025-01-06 05:25:32', '2025-01-06 05:25:32'),
(208, 24, '2025-01-06 13:28:05', '2025-01-06 05:28:05', '2025-01-06 05:28:05'),
(209, 34, '2025-01-06 13:31:47', '2025-01-06 05:31:47', '2025-01-06 05:31:47'),
(210, 22, '2025-01-06 15:21:06', '2025-01-06 07:21:06', '2025-01-06 07:21:06'),
(211, 1, '2025-01-06 15:38:19', '2025-01-06 07:38:19', '2025-01-06 07:38:19'),
(212, 8, '2025-01-07 06:05:12', '2025-01-06 22:05:12', '2025-01-06 22:05:12'),
(213, 8, '2025-01-07 08:36:17', '2025-01-07 00:36:17', '2025-01-07 00:36:17'),
(214, 17, '2025-01-07 08:45:37', '2025-01-07 00:45:37', '2025-01-07 00:45:37'),
(215, 8, '2025-01-07 08:53:34', '2025-01-07 00:53:34', '2025-01-07 00:53:34'),
(216, 15, '2025-01-07 09:39:53', '2025-01-07 01:39:53', '2025-01-07 01:39:53'),
(217, 15, '2025-01-07 09:49:21', '2025-01-07 01:49:21', '2025-01-07 01:49:21'),
(218, 23, '2025-01-07 10:21:59', '2025-01-07 02:21:59', '2025-01-07 02:21:59'),
(219, 45, '2025-01-07 12:32:27', '2025-01-07 04:32:27', '2025-01-07 04:32:27'),
(220, 22, '2025-01-07 13:15:59', '2025-01-07 05:15:59', '2025-01-07 05:15:59'),
(221, 16, '2025-01-07 13:19:39', '2025-01-07 05:19:39', '2025-01-07 05:19:39'),
(222, 42, '2025-01-07 14:20:49', '2025-01-07 06:20:49', '2025-01-07 06:20:49'),
(223, 17, '2025-01-07 14:32:44', '2025-01-07 06:32:44', '2025-01-07 06:32:44'),
(224, 8, '2025-01-07 14:44:44', '2025-01-07 06:44:44', '2025-01-07 06:44:44'),
(225, 23, '2025-01-07 14:54:43', '2025-01-07 06:54:43', '2025-01-07 06:54:43'),
(226, 1, '2025-01-07 17:57:37', '2025-01-07 09:57:37', '2025-01-07 09:57:37'),
(227, 1, '2025-01-07 18:15:15', '2025-01-07 10:15:15', '2025-01-07 10:15:15'),
(228, 8, '2025-01-07 19:59:25', '2025-01-07 11:59:25', '2025-01-07 11:59:25'),
(229, 8, '2025-01-08 09:05:22', '2025-01-08 01:05:22', '2025-01-08 01:05:22'),
(230, 16, '2025-01-08 09:50:25', '2025-01-08 01:50:25', '2025-01-08 01:50:25'),
(231, 15, '2025-01-08 10:07:59', '2025-01-08 02:07:59', '2025-01-08 02:07:59'),
(232, 23, '2025-01-08 11:05:20', '2025-01-08 03:05:20', '2025-01-08 03:05:20'),
(233, 1, '2025-01-08 11:49:24', '2025-01-08 03:49:24', '2025-01-08 03:49:24'),
(234, 1, '2025-01-08 14:14:36', '2025-01-08 06:14:36', '2025-01-08 06:14:36'),
(235, 15, '2025-01-08 14:18:46', '2025-01-08 06:18:46', '2025-01-08 06:18:46'),
(236, 16, '2025-01-08 14:54:40', '2025-01-08 06:54:40', '2025-01-08 06:54:40'),
(237, 23, '2025-01-08 16:33:46', '2025-01-08 08:33:46', '2025-01-08 08:33:46'),
(238, 46, '2025-01-08 19:41:47', '2025-01-08 11:41:47', '2025-01-08 11:41:47'),
(239, 8, '2025-01-09 07:06:02', '2025-01-08 23:06:02', '2025-01-08 23:06:02'),
(240, 17, '2025-01-09 08:18:02', '2025-01-09 00:18:02', '2025-01-09 00:18:02'),
(241, 16, '2025-01-09 08:37:25', '2025-01-09 00:37:25', '2025-01-09 00:37:25'),
(242, 27, '2025-01-09 08:53:55', '2025-01-09 00:53:55', '2025-01-09 00:53:55'),
(243, 46, '2025-01-09 09:05:36', '2025-01-09 01:05:36', '2025-01-09 01:05:36'),
(244, 17, '2025-01-09 11:47:37', '2025-01-09 03:47:37', '2025-01-09 03:47:37'),
(245, 17, '2025-01-09 11:49:36', '2025-01-09 03:49:36', '2025-01-09 03:49:36'),
(246, 8, '2025-01-09 13:10:36', '2025-01-09 05:10:36', '2025-01-09 05:10:36'),
(247, 27, '2025-01-09 13:14:00', '2025-01-09 05:14:00', '2025-01-09 05:14:00'),
(248, 26, '2025-01-09 13:14:53', '2025-01-09 05:14:53', '2025-01-09 05:14:53'),
(249, 17, '2025-01-09 14:06:09', '2025-01-09 06:06:09', '2025-01-09 06:06:09'),
(250, 1, '2025-01-10 09:57:58', '2025-01-10 01:57:58', '2025-01-10 01:57:58'),
(251, 15, '2025-01-12 10:52:51', '2025-01-12 02:52:51', '2025-01-12 02:52:51'),
(252, 16, '2025-01-13 08:46:03', '2025-01-13 00:46:03', '2025-01-13 00:46:03'),
(253, 15, '2025-01-13 08:54:21', '2025-01-13 00:54:21', '2025-01-13 00:54:21'),
(254, 1, '2025-01-13 09:54:26', '2025-01-13 01:54:26', '2025-01-13 01:54:26'),
(255, 15, '2025-01-13 11:40:06', '2025-01-13 03:40:06', '2025-01-13 03:40:06'),
(256, 26, '2025-01-13 13:11:21', '2025-01-13 05:11:21', '2025-01-13 05:11:21'),
(257, 9, '2025-01-13 13:18:10', '2025-01-13 05:18:10', '2025-01-13 05:18:10'),
(258, 9, '2025-01-13 13:18:58', '2025-01-13 05:18:58', '2025-01-13 05:18:58'),
(259, 44, '2025-01-13 13:31:38', '2025-01-13 05:31:38', '2025-01-13 05:31:38'),
(260, 1, '2025-01-13 13:31:56', '2025-01-13 05:31:56', '2025-01-13 05:31:56'),
(261, 16, '2025-01-13 13:49:18', '2025-01-13 05:49:18', '2025-01-13 05:49:18'),
(262, 30, '2025-01-13 14:25:12', '2025-01-13 06:25:12', '2025-01-13 06:25:12'),
(263, 20, '2025-01-13 14:37:58', '2025-01-13 06:37:58', '2025-01-13 06:37:58'),
(264, 1, '2025-01-13 19:33:00', '2025-01-13 11:33:00', '2025-01-13 11:33:00'),
(265, 43, '2025-01-14 15:11:05', '2025-01-14 07:11:05', '2025-01-14 07:11:05'),
(266, 1, '2025-01-14 16:02:11', '2025-01-14 08:02:11', '2025-01-14 08:02:11'),
(267, 25, '2025-01-15 08:55:05', '2025-01-15 00:55:05', '2025-01-15 00:55:05'),
(268, 13, '2025-01-15 09:19:13', '2025-01-15 01:19:13', '2025-01-15 01:19:13'),
(269, 1, '2025-01-15 10:30:48', '2025-01-15 02:30:48', '2025-01-15 02:30:48'),
(270, 16, '2025-01-15 10:47:37', '2025-01-15 02:47:37', '2025-01-15 02:47:37'),
(271, 25, '2025-01-15 13:18:55', '2025-01-15 05:18:55', '2025-01-15 05:18:55'),
(272, 43, '2025-01-15 13:19:17', '2025-01-15 05:19:17', '2025-01-15 05:19:17'),
(273, 13, '2025-01-15 13:37:13', '2025-01-15 05:37:13', '2025-01-15 05:37:13'),
(274, 25, '2025-01-15 22:53:33', '2025-01-15 14:53:33', '2025-01-15 14:53:33'),
(275, 1, '2025-01-16 06:23:55', '2025-01-15 22:23:55', '2025-01-15 22:23:55'),
(276, 1, '2025-01-16 09:45:49', '2025-01-16 01:45:49', '2025-01-16 01:45:49'),
(277, 1, '2025-01-16 13:41:08', '2025-01-16 05:41:08', '2025-01-16 05:41:08'),
(278, 1, '2025-01-16 13:57:44', '2025-01-16 05:57:44', '2025-01-16 05:57:44'),
(279, 1, '2025-01-17 10:28:13', '2025-01-17 02:28:13', '2025-01-17 02:28:13'),
(280, 1, '2025-01-17 12:44:27', '2025-01-17 04:44:27', '2025-01-17 04:44:27'),
(281, 1, '2025-01-17 17:32:06', '2025-01-17 09:32:06', '2025-01-17 09:32:06'),
(282, 1, '2025-01-20 11:03:19', '2025-01-20 03:03:19', '2025-01-20 03:03:19'),
(283, 1, '2025-01-20 17:23:27', '2025-01-20 09:23:27', '2025-01-20 09:23:27'),
(284, 1, '2025-01-21 09:27:56', '2025-01-21 01:27:56', '2025-01-21 01:27:56'),
(285, 1, '2025-01-21 10:14:04', '2025-01-21 02:14:04', '2025-01-21 02:14:04'),
(286, 1, '2025-01-21 14:28:01', '2025-01-21 06:28:01', '2025-01-21 06:28:01'),
(287, 1, '2025-01-22 10:05:03', '2025-01-22 02:05:03', '2025-01-22 02:05:03'),
(288, 1, '2025-01-22 17:31:29', '2025-01-22 09:31:29', '2025-01-22 09:31:29'),
(289, 1, '2025-01-24 09:46:08', '2025-01-24 01:46:08', '2025-01-24 01:46:08'),
(290, 1, '2025-01-24 16:45:37', '2025-01-24 08:45:37', '2025-01-24 08:45:37'),
(291, 1, '2025-01-30 09:42:07', '2025-01-30 01:42:07', '2025-01-30 01:42:07'),
(292, 1, '2025-01-30 17:34:52', '2025-01-30 09:34:52', '2025-01-30 09:34:52'),
(293, 1, '2025-02-04 20:05:30', '2025-02-04 12:05:30', '2025-02-04 12:05:30'),
(294, 1, '2025-02-10 16:10:32', '2025-02-10 08:10:32', '2025-02-10 08:10:32'),
(295, 1, '2025-02-11 12:16:16', '2025-02-11 04:16:16', '2025-02-11 04:16:16'),
(296, 1, '2025-02-11 14:36:35', '2025-02-11 06:36:35', '2025-02-11 06:36:35'),
(297, 1, '2025-02-17 14:26:44', '2025-02-17 06:26:44', '2025-02-17 06:26:44'),
(298, 1, '2025-02-18 15:19:48', '2025-02-18 07:19:48', '2025-02-18 07:19:48'),
(299, 1, '2025-02-19 15:47:36', '2025-02-19 07:47:36', '2025-02-19 07:47:36'),
(300, 1, '2025-02-24 11:06:26', '2025-02-24 03:06:26', '2025-02-24 03:06:26'),
(301, 1, '2025-02-24 16:24:16', '2025-02-24 08:24:16', '2025-02-24 08:24:16'),
(302, 1, '2025-02-25 10:31:13', '2025-02-25 02:31:13', '2025-02-25 02:31:13'),
(303, 1, '2025-03-03 09:31:27', '2025-03-03 01:31:27', '2025-03-03 01:31:27'),
(304, 1, '2025-03-04 10:00:22', '2025-03-04 02:00:22', '2025-03-04 02:00:22'),
(305, 1, '2025-03-04 13:17:35', '2025-03-04 05:17:35', '2025-03-04 05:17:35'),
(306, 1, '2025-03-04 22:13:55', '2025-03-04 14:13:55', '2025-03-04 14:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-10-03 14:48:57', '2024-10-03 14:48:57'),
(2, 'auditee', 'web', '2024-10-03 14:48:57', '2024-10-03 14:48:57'),
(3, 'auditor', 'web', '2024-10-03 14:48:57', '2024-10-03 14:48:57'),
(4, 'manajemen', 'web', '2024-10-03 14:48:57', '2024-10-03 14:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_akhirs`
--

CREATE TABLE `status_akhirs` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_akhirs`
--

INSERT INTO `status_akhirs` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'selesai', '2024-10-03 14:48:58', '2024-10-03 14:48:58'),
(2, 'belum selesai', '2024-10-03 14:48:58', '2024-10-03 14:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `status_temuans`
--

CREATE TABLE `status_temuans` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_temuans`
--

INSERT INTO `status_temuans` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'belum mencapai', '2024-10-03 14:48:58', '2024-10-03 14:48:58'),
(2, 'tercapai', '2024-10-03 14:48:58', '2024-10-03 14:48:58'),
(3, 'melampaui', '2024-10-03 14:48:58', '2024-10-03 14:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `status_tercapais`
--

CREATE TABLE `status_tercapais` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_tercapais`
--

INSERT INTO `status_tercapais` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'belum mencapai', '2024-10-03 14:48:58', '2024-10-03 14:48:58'),
(2, 'tercapai', '2024-10-03 14:48:58', '2024-10-03 14:48:58'),
(3, 'melampaui', '2024-10-03 14:48:58', '2024-10-03 14:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_akademiks`
--

CREATE TABLE `tahun_akademiks` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tahun_akademiks`
--

INSERT INTO `tahun_akademiks` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, '2024', '2024-10-03 14:48:58', '2024-10-03 14:48:58'),
(2, '2025', '2024-10-03 14:48:58', '2024-10-03 14:48:58'),
(3, '2026', '2024-10-03 14:48:58', '2024-10-03 14:48:58'),
(4, '2027', '2024-10-03 14:48:58', '2024-10-03 14:48:58'),
(5, '2028', '2024-10-03 14:48:58', '2024-10-03 14:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `created_at`, `updated_at`, `nama`, `gambar`) VALUES
(2, '2024-10-03 14:48:58', '2024-10-03 14:48:58', 'UPA Perpustakaan', NULL),
(3, '2024-10-03 14:48:58', '2024-10-03 14:48:58', 'UPA Rekaya Teknologi dan Produk Unggulan', NULL),
(4, '2024-10-03 14:48:58', '2024-10-03 14:48:58', 'UPA Layanan Uji Kompetensi', NULL),
(5, '2024-10-03 14:48:58', '2024-10-03 14:48:58', 'UPA Perawatan dan Perbaikan', NULL),
(6, '2024-10-03 14:48:58', '2024-10-03 14:48:58', 'UPA Pengembangan Karier dan Kewirausahaan', NULL),
(7, '2024-10-03 14:48:58', '2024-10-03 14:48:58', 'UPA Teknologi Informasi dan Komunikasi', NULL),
(8, '2024-11-10 15:55:29', '2024-11-10 15:55:29', 'PPMPP', NULL),
(9, '2024-12-23 17:17:58', '2024-12-23 17:17:58', 'Hubungan Masyarakat (HUMAS)', NULL),
(10, '2024-12-23 17:18:30', '2024-12-23 17:18:30', 'Kantor Urusan Internasional (KUI)', NULL),
(11, '2024-12-23 17:19:01', '2024-12-23 17:25:51', 'Rumah Tangga dan Aset', NULL),
(15, '2024-12-23 17:26:04', '2024-12-23 17:26:04', 'Kearsiapan', NULL),
(17, '2024-12-24 02:38:02', '2024-12-24 02:38:02', 'Bidang Kemahasiswaan', NULL),
(18, '2024-12-24 02:38:09', '2024-12-24 02:38:09', 'Bidang Kerjasama', NULL),
(19, '2024-12-24 03:05:03', '2024-12-24 03:05:03', 'Sumber Daya Manusia (SDM)', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_unit` bigint UNSIGNED DEFAULT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tidak aktif',
  `ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'tidak',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `id_unit`, `nip`, `status`, `ttd`, `foto`, `forgot_password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@pnj.ac.id', NULL, '$2y$10$tkqYwC.ZeLEQaRHlC7cCze1ydz/2SrVFLkynxjcBcO9eA1cQH5PAS', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-10-03 14:48:58', '2024-11-10 15:56:03'),
(7, 'Safitri Latifah', 'safitri.latifah@pnj.ac.id', NULL, '$2y$10$.wfktIOL1MonXtE6CwBhkuoK10XoD5hYIfWgEaLq21sklm2q5h2v6', 8, '198705282009122004', 'aktif', NULL, NULL, 'tidak', NULL, '2024-11-10 15:54:38', '2024-11-10 15:58:00'),
(8, 'UPA Rekayasa Teknologi dan Produk Unggulan', 'upartpu@pnj.ac.id', NULL, '$2y$10$.8LxwOxqZEHtW7XP6PP12umdAD4WZFKrZ4jV0FUyozB2.UdsHzd/m', 3, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:28:42', '2024-12-24 00:38:35'),
(9, 'UPA Layanan Uji Kompetensi', 'lsp@pnj.ac.id', NULL, '$2y$10$LgMGUziOYNzU6tJcMYPQFu5jOPfM1aLvbJUsdXUqrlobRs8hjVSV2', 4, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:28:42', '2024-12-24 00:38:50'),
(10, 'UPA Perawatan dan Perbaikan', 'upa-ppk3@pnj.ac.id', NULL, '$2y$10$M/MMEpJCZMm/lg0PDFrk4.JDpek8RRBZWiVaTIusmR9M5xSLKApcW', 5, NULL, 'aktif', 'tanda-tangan/dKW4F7jqefzYOE97WZp7bfh0WymTpYy9WH0r238i.png', NULL, 'tidak', NULL, '2024-12-24 00:28:42', '2024-12-29 03:11:13'),
(11, 'UPA Pengembangan Karier dan Kewirausahaan', 'cdc@pnj.ac.id', NULL, '$2y$10$siBnypVEM4qWm2qkJTmM8uGhPXOuiLtwKrDlMJOYdvTf.NJn0ZRme', 6, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:28:42', '2024-12-24 00:39:59'),
(12, 'UPA Teknologi Informasi dan Komunikasi', 'transformasi.digital@pnj.ac.id', NULL, '$2y$10$SBEoo4kiRrcgwuUA4Oy.BOf/Z5k0pX18VOS7TYQu8.7vrodvlO0XC', 7, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:28:42', '2024-12-24 00:40:11'),
(13, 'Hubungan Masyarakat (HUMAS)', 'humas@pnj.ac.id', NULL, '$2y$10$WRtTRcWSXJpXoeqU5.SqUe0c9ld.Qv6s7R1/nWaEh8FDd6CofBbPC', 9, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:28:42', '2024-12-24 00:40:27'),
(14, 'Kantor Urusan Internasional (KUI)', 'international.office@pnj.ac.id', NULL, '$2y$10$k2TLq9OuMC.n4K04u09FXuJz.6prc4zsij8kyW62kdwHQHL8PsLZu', 10, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:28:42', '2024-12-24 00:40:48'),
(15, 'Rumah Tangga dan Aset', 'rumahtangga@pnj.ac.id', NULL, '$2y$10$keShMUHSGjktRXOEVsbcY.HsPBuOwc1JZZGWi4Q2Hfa8nt9sZ9iIq', 11, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:28:42', '2024-12-24 00:40:59'),
(16, 'Kearsiapan', 'kearsipan@pnj.ac.id', NULL, '$2y$10$4kMuwHWaQ1s3NTnbET1VROXO6vUPQ.CTtIIw618gkUq5SccuJqHfG', 15, NULL, 'aktif', 'tanda-tangan/a3ZgZMR8sPNiviNGwlYr85vcfdl6XcOFmttapVCe.jpg', NULL, 'tidak', NULL, '2024-12-24 00:28:43', '2024-12-30 00:09:40'),
(17, 'UPA Perpustakaan', 'perpustakaan@pnj.ac.id', NULL, '$2y$10$EFEZlQ3p7BVBjdREdsULH.FvI1Nn1MMbT.2T5A37nGwNMOcvBvKB2', 2, NULL, 'aktif', NULL, NULL, 'ya', NULL, '2024-12-24 00:31:59', '2025-01-01 02:02:12'),
(18, 'PPMPP', 'ppmpp@pnj.ac.id', NULL, '$2y$10$68.bWNmgMva6X4J5RHtB2uYUiDNGlZKvFKhMp.t/XBfRZrzg4jE0q', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:35:18', '2024-12-24 00:41:43'),
(19, 'Auditor Ketua', 'auditor.ketua@pnj.ac.id', NULL, '$2y$10$sH/wkgk8TsaG1LekLiD9K.1MfnIVKooTLB5LWdefqLCI35wsLNWBS', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:36:14', '2024-12-24 00:36:14'),
(20, 'Auditor Anggota 1', 'auditor.anggota1@pnj.ac.id', NULL, '$2y$10$eOL4XXydtmW5OkmKzRm/PO/qRHC.LQOnVo1ir/5RvlzFJmF8Rf1Qm', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:36:49', '2025-01-13 06:34:16'),
(21, 'Auditor Anggota 2', 'auditor.anggota2@pnj.ac.id', NULL, '$2y$10$BdXFBUGdSZqowpCQLbcJlO54gCsMocXUGlao.HVcbzNXxG7v3vW.m', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 00:37:20', '2024-12-24 00:37:20'),
(22, 'Bidang Kerjasama', 'bidangkerjasama@pnj.ac.id', NULL, '$2y$10$MOQJYoK7P4zhuZ3eYoQtn.GVLXRY2KoFMccADaldtkazGcTDAUxf6', 18, '0000', 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 02:41:22', '2024-12-24 02:41:22'),
(23, 'Bidang Kemahasiswaan', 'kemahasiswaan@pnj.ac.id', NULL, '$2y$10$rK/9dmkiglZkAYf2Y9ZmyeVmAC0R8/m062h.6VWLMI1xq7CRIPL5u', 17, NULL, 'aktif', 'tanda-tangan/hB5AenZwajgO6H9OvDqhpqUsWr6XaxOeSPm0DiJx.jpg', NULL, 'tidak', NULL, '2024-12-24 02:42:08', '2025-01-07 07:45:46'),
(24, 'Kepegawaian SDM', 'kepegawaian@pnj.ac.id', NULL, '$2y$10$KCxbVVewe5mu0/lQbL8hZeVMR1DyjppKhXZcT7FI8WbMZPNhe.IdC', 19, '0000', 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-24 03:06:47', '2024-12-24 03:06:47'),
(25, 'Arizal Putra Pratama , B.O.M., M.A.B', 'arizal.putra.pratama@bisnis.pnj.ac.id', NULL, '$2y$10$i2Ar0OMuHyuYxgHd9t9a2eLdDT5GMKIDD0.iFn7En7FmBWJn2I1Mm', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:16', '2024-12-26 08:12:16'),
(26, 'Ihsan Auditia Akhinov, S.T., M.T.', 'ihsan.akhinov@elektro.pnj.ac.id', NULL, '$2y$10$J0hDbqxW0Bwydknpn0s0GuSVtQ/NXpQA1C08XQ7XXkR4/iE2zXbQG', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:16', '2024-12-26 08:12:16'),
(27, 'Euis Oktavianti, S.S.I., M.T.I.', 'euis.oktavianti@tik.pnj.ac.id', NULL, '$2y$10$HM7Wby1mKO1C5hEjiTTUnOQzvYmD7mr7M/H9Ah8hvkanM.ljWXPqy', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(28, 'Mitsaq Addina Nisa, S.T., M.Eng.', 'mitsaq.addina.nisa@sipil.pnj.ac.id', NULL, '$2y$10$TmsgttA.4uwgdb7g.95nG.C972ZYjKNhC/kKq5ib.p/rsnNNOYPx.', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(29, 'Vina Nanda Garjati, S.T., M.T.', 'vina.nanda@mesin.pnj.ac.id', NULL, '$2y$10$P1qUctQbHglGtLiUmSFBfuP6r5YwaujcpP2LQMFI/K3MPObzP7fHW', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(30, 'Jonathan Saputra, S.Pd., M.Si.', 'jonathan.saputra@sipil.pnj.ac.id', NULL, '$2y$10$mX7AHop5.9elBwG/CfSVoO4O.CXvpknVxEWMGlSqIBBJjjrmZ0zmi', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(31, 'Ratri Kurniasari, S.E., M.Ak.', 'ratri.kurniasari@bisnis.pnj.ac.id', NULL, '$2y$10$RiYIRYvhBe9RBQYFKyv2y.Z7fgCoaEmlzDC8WUq7PF0ahpqua0fcS', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(32, 'Dinda Kadarwati, M.Pd.', 'dinda.kadarwati@tik.pnj.ac.id', NULL, '$2y$10$1gkDeTWP7wo4L8oi4KOFTu.otE2yDZ6UK.uJAmSeg3dMjxRLRNVrS', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(33, 'Farizka Humolungo, S.Pd., M.A.', 'farizka.humolungo@bispro.pnj.ac.id', NULL, '$2y$10$qNsdR3CEZIfHmTC9NJQW3O5JrFjs1Ckrz72dQ1H1lAF9fhxbKGbBy', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(34, 'Restu Jati Saputro , S.Si., M.Sc.', 'restujati.saputro@bisnis.pnj.ac.id', NULL, '$2y$10$USOupPFqj.afCU905llyHeb0kjSZdkXSiMQLTF0BFKC/iWoVC8bpq', 8, NULL, 'aktif', 'tanda-tangan/qRQj2G37BhwNA3DeAXKlvFdlgzVOS8Sdr4Sd07ua.png', NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2025-01-06 07:37:46'),
(35, 'Sandhika Cipta Bidhari, S.M.B., M.M.', 'sandhika.ciptabidhari@akuntansi.pnj.ac.id', NULL, '$2y$10$jnTdbkvPcqE9sX5wQSVZ5.erVbOj/mjCcQUGbwndhYnukwILNHE.q', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(36, 'Malisa Huzaifa , S.Kom., M.T.', 'malisa.huzaifa@tik.pnj.ac.id', NULL, '$2y$10$HyRfXodWw2qVwydDi.RNZeLZCzj/vhQOTtgiVSwfuwasq1ETNDAFK', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(37, 'Nuraeni Hadiati Farhani, S.S.T., MBA.', 'nuraeni.hadiatifarhani@akuntansi.pnj.ac.id', NULL, '$2y$10$uC4hfW.xFdOV7eI6lY4f8uwTK.nStwNs9eTBNuQy9MxXR1M99SwUK', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(38, 'Risna Sari, S.Kom., M.T.I.', 'risna.sari@tik.pnj.ac.id', NULL, '$2y$10$JBrYWFDBS2W97Yw84pGLdubJnQIwDGw7WFL3yNNegLB0KzUMm/vf.', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:17', '2024-12-26 08:12:17'),
(39, 'Tika Dwi Ariyanti, S.Psi., M.Psi.', 'tika.dwiariyanti@akuntansi.pnj.ac.id', NULL, '$2y$10$sQdvqWo.X6F/oGIjzoYd6ObNkMREAQhHutgYaLdTYy9vSIaMTCgwC', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:18', '2024-12-26 08:12:18'),
(40, 'Hendrian Budi Bagus Kuncoro, S.T., M.Eng.', 'hendrian.budi.bagus.kuncoro@sipil.pnj.ac.id', NULL, '$2y$10$mZsoug1K9yLkVDGGRO9hJuA0zQkaJRanOXthntb/tVTJHP/kpN3eO', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:18', '2024-12-26 08:12:18'),
(41, 'Mohamad Fathurahman, S.T., M.T.', 'mohamad.fathurahman@elektro.pnj.ac.id', NULL, '$2y$10$6QMWgZeCLe9h6PCFod4D7e6bqFFlXLdowYPHylHb7L1cbHdxdvm1y', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:18', '2024-12-26 08:12:18'),
(42, 'Arifia Ekayuliana, S.T., M.T.', 'arifia.ekayuliana@mesin.pnj.ac.id', NULL, '$2y$10$OM57KhSmk59oNDNLPbWn9.F/HVShmzwfL4hZCs7/b3VgkLkQWkOO.', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:18', '2024-12-26 08:12:18'),
(43, 'Maria Agustin, S.Kom., M.Kom.', 'maria.agustin@tik.pnj.ac.id', NULL, '$2y$10$Nms/kcLMcRTgtpzZmfTjP.sqyIikNL5VlNA/CCyI.oyM1zQldaax6', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:18', '2024-12-26 08:12:18'),
(44, 'Dezetty Monika, S.T., M.T.', 'dezetty.monika@elektro.pnj.ac.id', NULL, '$2y$10$GtapPZYb.Q7g/OhMVZreuOOKDWewipOXD95uH2eU5xeSW1xUFaNfy', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:12:18', '2024-12-26 08:12:18'),
(45, 'Ni Made Sri Wardani, S.E., M.Ak.', 'nimade.sriwardani@akuntansi.pnj.ac.id', NULL, '$2y$10$vAcPcusoohH1jBgaQE.4wO2fOoM3PKuoT.yq8o2Y.4RpbgN6CdPLa', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2024-12-26 08:19:22', '2024-12-26 08:19:22'),
(46, 'Maria Septian Riasanti Mola', 'maria.septian.riasanti.mola@grafika.pnj.ac.id', NULL, '$2y$10$mjdIBR8vDY.SjEs9GnlrkOvSRmXJYsieayJ/SKpid0vbb3z0X9Z0S', 8, '199209232022032000', 'aktif', 'tanda-tangan/GXts8gK75VmjBlWJjMhiwuI0BTItNktaf77nn0ig.jpg', NULL, 'tidak', NULL, '2025-01-05 23:59:10', '2025-01-06 07:38:19'),
(47, 'Eky Erlanda Edel, S.Pd., M.Pd.', 'eky.erlandaedel@akuntansi.pnj.ac.id', NULL, '$2y$10$xvseUtfMPK77rWA5aT/y8..r1xAZfHoRLmI7GE.ayZf80S.q4DiQq', 8, NULL, 'aktif', NULL, NULL, 'tidak', NULL, '2025-01-13 06:41:38', '2025-01-13 06:41:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_mutu_internals`
--
ALTER TABLE `audit_mutu_internals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_mutu_internals_id_unit_foreign` (`id_unit`),
  ADD KEY `audit_mutu_internals_id_user_auditee_foreign` (`id_user_auditee`),
  ADD KEY `audit_mutu_internals_id_user_auditor_ketua_foreign` (`id_user_auditor_ketua`),
  ADD KEY `audit_mutu_internals_id_user_auditor_anggota1_foreign` (`id_user_auditor_anggota1`),
  ADD KEY `audit_mutu_internals_id_user_auditor_anggota2_foreign` (`id_user_auditor_anggota2`),
  ADD KEY `audit_mutu_internals_id_user_manajemen_foreign` (`id_user_manajemen`),
  ADD KEY `audit_mutu_internals_id_user_admin_foreign` (`id_user_admin`),
  ADD KEY `audit_mutu_internals_id_ta_foreign` (`id_TA`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `indikators`
--
ALTER TABLE `indikators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indikators_id_pernyataan_foreign` (`id_pernyataan`);

--
-- Indexes for table `instrumen_audits`
--
ALTER TABLE `instrumen_audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instrumen_audits_id_status_tercapai_foreign` (`id_status_tercapai`),
  ADD KEY `instrumen_audits_id_status_temuan_foreign` (`id_status_temuan`),
  ADD KEY `instrumen_audits_id_status_akhir_foreign` (`id_status_akhir`),
  ADD KEY `instrumen_audits_id_ami_foreign` (`id_AMI`),
  ADD KEY `instrumen_audits_id_indikator_foreign` (`id_indikator`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `pernyataan_standars`
--
ALTER TABLE `pernyataan_standars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pernyataan_standars_id_ta_foreign` (`id_TA`),
  ADD KEY `pernyataan_standars_id_unit_foreign` (`id_unit`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `record_logins`
--
ALTER TABLE `record_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_logins_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `status_akhirs`
--
ALTER TABLE `status_akhirs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_temuans`
--
ALTER TABLE `status_temuans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_tercapais`
--
ALTER TABLE `status_tercapais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tahun_akademiks`
--
ALTER TABLE `tahun_akademiks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_id_unit_foreign` (`id_unit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_mutu_internals`
--
ALTER TABLE `audit_mutu_internals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indikators`
--
ALTER TABLE `indikators`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=563;

--
-- AUTO_INCREMENT for table `instrumen_audits`
--
ALTER TABLE `instrumen_audits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pernyataan_standars`
--
ALTER TABLE `pernyataan_standars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `record_logins`
--
ALTER TABLE `record_logins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status_akhirs`
--
ALTER TABLE `status_akhirs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_temuans`
--
ALTER TABLE `status_temuans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status_tercapais`
--
ALTER TABLE `status_tercapais`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tahun_akademiks`
--
ALTER TABLE `tahun_akademiks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_mutu_internals`
--
ALTER TABLE `audit_mutu_internals`
  ADD CONSTRAINT `audit_mutu_internals_id_ta_foreign` FOREIGN KEY (`id_TA`) REFERENCES `tahun_akademiks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `audit_mutu_internals_id_unit_foreign` FOREIGN KEY (`id_unit`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `audit_mutu_internals_id_user_admin_foreign` FOREIGN KEY (`id_user_admin`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `audit_mutu_internals_id_user_auditee_foreign` FOREIGN KEY (`id_user_auditee`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `audit_mutu_internals_id_user_auditor_anggota1_foreign` FOREIGN KEY (`id_user_auditor_anggota1`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `audit_mutu_internals_id_user_auditor_anggota2_foreign` FOREIGN KEY (`id_user_auditor_anggota2`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `audit_mutu_internals_id_user_auditor_ketua_foreign` FOREIGN KEY (`id_user_auditor_ketua`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `audit_mutu_internals_id_user_manajemen_foreign` FOREIGN KEY (`id_user_manajemen`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `indikators`
--
ALTER TABLE `indikators`
  ADD CONSTRAINT `indikators_id_pernyataan_foreign` FOREIGN KEY (`id_pernyataan`) REFERENCES `pernyataan_standars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `instrumen_audits`
--
ALTER TABLE `instrumen_audits`
  ADD CONSTRAINT `instrumen_audits_id_ami_foreign` FOREIGN KEY (`id_AMI`) REFERENCES `audit_mutu_internals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `instrumen_audits_id_indikator_foreign` FOREIGN KEY (`id_indikator`) REFERENCES `indikators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `instrumen_audits_id_status_akhir_foreign` FOREIGN KEY (`id_status_akhir`) REFERENCES `status_akhirs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `instrumen_audits_id_status_temuan_foreign` FOREIGN KEY (`id_status_temuan`) REFERENCES `status_temuans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `instrumen_audits_id_status_tercapai_foreign` FOREIGN KEY (`id_status_tercapai`) REFERENCES `status_tercapais` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pernyataan_standars`
--
ALTER TABLE `pernyataan_standars`
  ADD CONSTRAINT `pernyataan_standars_id_ta_foreign` FOREIGN KEY (`id_TA`) REFERENCES `tahun_akademiks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pernyataan_standars_id_unit_foreign` FOREIGN KEY (`id_unit`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `record_logins`
--
ALTER TABLE `record_logins`
  ADD CONSTRAINT `record_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_unit_foreign` FOREIGN KEY (`id_unit`) REFERENCES `units` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
