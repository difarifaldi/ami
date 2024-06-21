<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LHA PDF</title>
    <style>
        /* CSS untuk halaman baru */
        .page-break {
            page-break-after: always;
        }

        /* Gaya untuk halaman cover */
        .cover-page {
            margin: 2.5cm auto;
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
            margin: 2.5cm auto;
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
                <th colspan="2">AUDIT MUTU INTERNAL <br> UNIT/BAGIAN <br> {{ $instruments->first()->ami->unit->nama }}
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

    <!-- Halaman Konten -->
    <div class="content-page">
        <h2>Daftar Laporan Hasil Akhir</h2>
        <table border="1" width="100%" style="border-collapse: collapse;">
            <thead>
                <tr>
                    <th>Unit</th>
                    <th>No PS</th>
                    <th>No Indikator</th>
                    <th>Bukti</th>
                    <th>Status Ketercapaian</th>
                    <th>Temuan</th>
                    <th>Link tindak Lanjut</th>
                    <th>Status Temuan</th>
                    <th>Jadwal</th>
                    <th>Status Akhir</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($instruments as $instrument)
                    <tr>
                        <td>{{ $instrument->ami->unit->nama }}</td>
                        <td>{{ $instrument->indikator->pernyataan->no_ps }}</td>
                        <td>{{ $instrument->indikator->no }}</td>
                        <td>{{ $instrument->bukti }}</td>
                        <td>{{ $instrument->statusTercapai->nama }}</td>
                        <td>{{ $instrument->temuan_audit }}</td>
                        <td>{{ $instrument->link }}</td>
                        <td>{{ $instrument->statusTemuan->nama }}</td>
                        <td>{{ $instrument->jadwal }}</td>
                        <td>{{ $instrument->statusAkhir->nama }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>

</html>
