<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <title>LHA PDF</title>
    <style>
        .page-break {
            page-break-before: always;
            margin-top: 0;
        }

        /* Gaya untuk halaman cover */
        .cover-page {
            margin-top: 2.5cm auto;
            text-align: center;
        }

        .cover-page table {
            margin: 0 auto;
            width: 100%;
            border-collapse: collapse;
        }

        .cover-page th,
        .cover-page td {
            padding: 10px;
            border: none;
            /* Menghapus border yang ada */
            border-bottom: 2px solid black;
            /* Menambahkan border-bottom saja */
            font-size: 14pt;
        }

        .cover-page h2 {
            font-size: 18pt;
            line-height: 1.5;
            margin-bottom: 40px;
        }

        .cover-page p {
            font-size: 14pt;
            line-height: 1.5;
            margin-bottom: 10px;
        }

        /* Gaya untuk halaman pengantar */
        .pengantar-page {
            padding: 20px;
            margin: 2.5 auto;
        }

        .pengantar-page h2 {
            text-align: center;
        }

        .pengantar-page .isi {
            text-align: justify;
            line-height: 1.5;
        }

        .pengantar-page .penutup {
            text-align: right;
            line-height: 1.5;
        }

        /* Gaya untuk halaman pendahuluan */
        .pendahuluan-page {
            padding: 20px;
            margin-top: 0;
        }

        .pendahuluan-page h2 {
            text-align: center;
            margin: 20px 0;
            /* Kurangi margin bottom */
        }

        .pendahuluan-page h3 {
            margin-top: 0.5cm;
            font-size: 14px
                /* Kurangi margin top */
        }

        .pendahuluan-page ul li {
            line-height: 1.5rem;
            list-style-type: decimal;
        }

        .pendahuluan-page .list-alpha li {
            line-height: 1.5rem;
            list-style-type: lower-alpha;

        }

        .pendahuluan-page table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
            page-break-inside: auto;
        }

        .pendahuluan-page th,
        .pendahuluan-page td {

            padding: 20px;
            text-align: left;
            border-collapse: collapse;
            border: 1px solid blue;
        }

        .pendahuluan-page .table-temuan th,
        .pendahuluan-page .table-temuan td {

            padding: 8px;
            text-align: left;
            border-collapse: collapse;
            border: 1px solid blue;
        }

        /* Gaya untuk halaman konten */
        .content-page {
            padding: 20px;
            border: 1px solid #ccc;
            margin-top: 20px;
        }

        .content-page table {
            width: 100%;
            border-collapse: collapse;
        }

        .content-page th,
        .content-page td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
            font-size: 12pt;
        }
    </style>
</head>

<body>
    <!-- Halaman Cover -->
    <div class="cover-page">
        <table>
            <tr>
                <th colspan="2" style="font-weight: 500">LAPORAN HASIL AUDIT <br> TAHUN 2024</th>
                <th colspan="2">AUDIT MUTU INTERNAL <br> UNIT/BAGIAN <br>
                    {{ $instruments->first()->ami->unit->nama }}
                </th>
            </tr>
        </table>
        <h2>
            Auditor: <br>
            {{ $instruments->first()->ami->auditorKetua->name }} <br>
            {{ $instruments->first()->ami->auditorAnggota1->name }} <br>
            {{ $instruments->first()->ami->auditorAnggota2 ? $instruments->first()->ami->auditorAnggota2->name : '' }}
        </h2>
        <!-- Gunakan base64 untuk gambar -->
        <?php
        $path = public_path('assets/images/PNJ.png');
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $data = file_get_contents($path);
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
        ?>
        <img src="{{ $base64 }}" class="logo-icon-2" alt="Logo PNJ" style="width: auto; height: 10cm;">
        <h2>
            SATUAN PENJAMINAN MUTU <br>
            POLITEKNIK NEGERI JAKARTA
        </h2>
        <p>
            Jln. Prof. Dr. G. A. Siwabessy, Kampus UI Depok <br>
            Telepon : 021-7270036, ext. 289, e-mail : <a href="spmi@pnj.ac.id">spmi@pnj.ac.id</a>
        </p>
    </div>

    <!-- Halaman Pengantar -->
    <div class="page-break"></div>
    <div class="pengantar-page">
        <h2>Kata Pengantar</h2>
        <div class="isi">
            <p>
                Puji syukur kami panjatkan kehadirat Allah SWT sehingga
                ”Laporan Hasil Audit Mutu Internal unit kerja
                <span style="font-weight: bold">{{ $instruments->first()->ami->unit->nama }}
                </span>
                PNJ Tahun 2024” ini dapat diselesaikan. Laporan ini disusun
                sebagai laporan hasil audit oleh Tim Audit Internal
                berdasarkan Surat Tugas Direktur PNJ Nomor
                1317/PL3/JM.01.00/2022 tanggal 8 Desember 2021 tentang
                Pelaksanaan Audit Mutu Internal. <br />
                Berdasarkan hasil audit terdapat beberapa temuan yang
                keseluruhannya sudah mendapat tanggapan dari pihak unit
                kerja Kantor <span style="font-weight: bold">{{ $instruments->first()->ami->unit->nama }}
                </span> PNJ. Harapan kami temuan
                tersebut dapat segera ditindaklanjuti sehingga dapat
                meningkatkan kualitas dan kinerja Proses pembelajaran di
                masa akan datang.
                <br />
                Apresiasi kami sampaikan kepada auditi yang telah kooperatif
                dalam pelaksanaan kegiatan audit ini. Ucapan terima kasih
                kami berikan bagi semua pihak yang telah membantu
                terlaksananya kegiatan
            </p>
        </div>
        <div class="penutup">
            <p>
                Depok,
                {{ \Carbon\Carbon::parse($instruments->first()->ami->tanggal)->format('d, M Y') }} <br />
                Auditor <br />
                <br /><br />
                {{ $instruments->first()->ami->auditorKetua->name }} <br>
                {{ $instruments->first()->ami->auditorAnggota1->name }} <br>
                {{ $instruments->first()->ami->auditorAnggota2 ? $instruments->first()->ami->auditorAnggota2->name : '' }}
            </p>
        </div>
    </div>

    <!-- Pisahkan halaman -->
    <div class="page-break"></div>

    <!-- Halaman Pendahuluan -->
    <div class="pendahuluan-page">
        <h2>LAPORAN AUDIT MUTU INTERNAL UNIT KERJA</h2>
        <h3>I. PENDAHULUAN</h3>
        <table>
            <tr>
                <td style="background-color: #d9d9d9">Bagian</td>
                <td colspan="2">{{ $instruments->first()->ami->unit->nama }}</td>
            </tr>
            <tr>
                <td style="background-color: #d9d9d9">Unit Kerja</td>
                <td colspan="2">{{ $instruments->first()->ami->unit->nama }}</td>
            </tr>
            <tr>
                <td style="background-color: #d9d9d9">Alamat</td>
                <td colspan="2">
                    Jl. Prof. DR. G.A. Siwabessy, Kampus Universitas
                    Indonesia Depok 16425
                </td>
            </tr>
            <tr>
                <td style="background-color: #d9d9d9">Tanggal Audit</td>
                <td colspan="2"> {{ \Carbon\Carbon::parse($instruments->first()->ami->tanggal)->format('d, M Y') }}
                </td>
            </tr>
            <tr>
                <td style="background-color: #d9d9d9">Ka Unit Kerja</td>
                <td>{{ $instruments->first()->ami->auditee->name }}</td>
                <td>Telp:</td>
            </tr>
            <tr>
                <td style="background-color: #d9d9d9">Ketua Auditor</td>
                <td>{{ $instruments->first()->ami->auditorKetua->name }}</td>
                <td>Tanda tangan <br>
                    <?php
                    $pathttd1 = public_path('storage/' . $instruments->first()->ami->auditorKetua->ttd);
                    $typettd1 = pathinfo($pathttd1, PATHINFO_EXTENSION);
                    $datattd1 = file_get_contents($pathttd1);
                    $base64ttd1 = 'data:image/' . $typettd1 . ';base64,' . base64_encode($datattd1);
                    ?>
                    <img src="{{ $base64ttd1 }}" class="logo-icon-2" style="width: auto; height: 1cm;">
                </td>
            </tr>
            <tr>
                <td style="background-color: #d9d9d9">Anggota Auditor</td>
                <td>{{ $instruments->first()->ami->auditorAnggota1->name }}</td>
                <td>Tanda tangan <br>
                    <?php
                    $pathttd2 = public_path('storage/' . $instruments->first()->ami->auditorAnggota1->ttd);
                    $typettd2 = pathinfo($pathttd2, PATHINFO_EXTENSION);
                    $datattd2 = file_get_contents($pathttd2);
                    $base64ttd2 = 'data:image/' . $typettd2 . ';base64,' . base64_encode($datattd2);
                    ?>
                    <img src="{{ $base64ttd2 }}" class="logo-icon-2" style="width: auto; height: 1cm;">
                </td>
            </tr>



        </table>
        <h3>II. TUJUAN DAN RUANG LINGKUP AUDIT</h3>
        <ul>
            <li>
                Ketercapaian sasaran mutu dan indikator kinerja yang
                terdapat dalam standar UPT KUI.
            </li>
            <li>Ketersediaan prosedur dan konsistensi pelaksanaannya</li>
            <li>
                Efektivitas sistem pengawasan pelaksanaan kegiatan di
                unitnya
            </li>
        </ul>
        <h3>
            III. TEMUAN POSITIF
            <span style="font-style: italic; font-weight: lighter">
                (tuliskan temuan audit yang masuk dalam klasifikasi TP,
                kesesuaian atau prestasi yang ditemukan pada unit)</span>
        </h3>
        <table>
            <tr style="text-align: center">
                <th>No</th>
                <th>Deskripsi / Uraian Temuan</th>
            </tr>
            @foreach ($instruments as $instrument)
                <tr>
                    <td>{{ $instrument->indikator->no }}</td>
                    <td> {!! $instrument->indikator->indikator !!}</td>
                </tr>
            @endforeach
        </table>

        <h3>
            IV. RINGKASAN TEMUAN AUDIT
            <span style="font-style: italic; font-weight: lighter">
                (tuliskan temuan audit yang masuk dalam klasifikasi TP,
                kesesuaian atau prestasi yang ditemukan pada unit)</span>
        </h3>
        <table class="table-temuan">
            <thead>
                <tr>
                    <th rowspan="2">No</th>
                    <th rowspan="2">Deskripsi/ Uraian Temuan</th>
                    <th colspan="4" style="text-align: center">
                        Kategori Temuan <br />
                        (beri tanda <span style="font-family: ZapfDingbats, sans-serif;">4</span> yang sesuai)
                    </th>
                </tr>
                <tr>
                    <th>Melampaui</th>
                    <th>Mencapai</th>
                    <th>Belum Mencapai</th>
                    <th>Menyimpang</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($instruments as $instrument)
                    <tr>
                        <td>{{ $instrument->indikator->no }}</td>
                        <td style="text-align: justify; padding: 12px">{!! $instrument->indikator->indikator !!}</td>
                        <td style="font-family: ZapfDingbats, sans-serif; text-align: center">{!! $instrument->statusTemuan->nama == 'melampaui' ? '4' : '' !!}
                        </td>
                        <td style="font-family: ZapfDingbats, sans-serif; text-align: center">{!! $instrument->statusTemuan->nama == 'tercapai' ? '4' : '' !!}
                        </td>
                        <td style="font-family: ZapfDingbats, sans-serif; text-align: center">{!! $instrument->statusTemuan->nama == 'belum mencapai' ? '4' : '' !!}
                        </td>
                        <td style="font-family: ZapfDingbats, sans-serif; text-align: center">{!! $instrument->statusTemuan->nama == 'menyimpang' ? '4' : '' !!}
                        </td>

                    </tr>
                @endforeach
            </tbody>
        </table>



        <h3>V. KESIMPULAN AUDIT</h3>
        <p style="margin-left: 20px;">Dari hasil temuan di atas:</p>
        <ul>
            <li>Faktor Penyebab Keberhasilan Ketercapaian</li>
            <ul class="list-alpha">
                @foreach ($instruments as $instrument)
                    @if ($instrument->statusTemuan->id == 2)
                        <li>{{ $instrument->akar_penyebab ? $instrument->akar_penyebab : '' }}</li>
                    @endif
                @endforeach
            </ul>
            <li>Akar Masalah Ketidak Tercapaian Standar</li>
            <ul class="list-alpha">
                @foreach ($instruments as $instrument)
                    @if ($instrument->statusTemuan->id == 1)
                        <li>{{ $instrument->akar_penyebab ? $instrument->akar_penyebab : '' }}</li>
                    @endif
                @endforeach
            </ul>
        </ul>
        <h3>
            VI. REKOMENDASI TERKAIT KETERCAPAIAN DAN BELUM/KETIDAKTERCAPAIAN
        </h3>
        <ul>
            <li>Rekomendasi Ketercapaian</li>
            <ul class="list-alpha">
                @foreach ($instruments as $instrument)
                    @if ($instrument->statusTemuan->id == 2)
                        <li>{{ $instrument->rekomendasi_auditor ? $instrument->rekomendasi_auditor : '' }}</li>
                    @endif
                @endforeach
            </ul>
            <li>Rekomendasi Ketidaktercapaian</li>
            <ul class="list-alpha">
                @foreach ($instruments as $instrument)
                    @if ($instrument->statusTemuan->id == 1)
                        <li>{{ $instrument->rekomendasi_auditor ? $instrument->rekomendasi_auditor : '' }}</li>
                    @endif
                @endforeach
            </ul>
        </ul>
    </div>


</body>

</html>
