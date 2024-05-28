<!DOCTYPE html>
<html>
<head>
    <title>Data Permintaan Makan Lembur - PDF</title>
    <style>
        /* Tambahkan gaya CSS sesuai kebutuhan untuk format PDF */
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%; /* Gunakan lebar tabel 100% */
            border-collapse: collapse;
            padding: 8px;
        }
        th, td {
            width: auto; /* Menggunakan lebar kolom otomatis */
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header-row img {
            width: 140px;
            height: 60px;
        }
        .title {
            text-align: center;
            flex-grow: 1; /* Biarkan judul mengambil sisa ruang */
        }
        .date {
            text-align: right;
        }
    </style>
</head>
<body>
    
    <table style="border: 0;">
        <tr>
            <td style="width:17%">
                <div style="position:relative;float:left;"><img src="{{ public_path('assets/images/isuzu2.png') }}"
                        width="140" height="60" class="" alt="Logo MII"></div>
            </td>
            <td style="width:70%">
                <h3 style="text-align: center; visibility: hidden;">Data Permintaan Makan Lembur</h3>
            </td>
            <td style="width:20%">
                {{ $waktu_permintaan }}
            </td>
        </tr>
    </table>
    <h3 style="text-align: center;">Data Permintaan Makan Lembur</h3>
    <table>
        <thead>
            <th rowspan="2" scope="col" style="width: 10%; border: 1px solid #dddddd; text-align: center;">Departemen</th>
            <th rowspan="2" scope="col" style="width: 10%; border: 1px solid #dddddd; text-align: center;">Line</th>
            <th rowspan="2" scope="col" style="width: 10%; border: 1px solid #dddddd; text-align: center;">Pemohon</th>
            <th colspan="2" scope="col" style="width: 10%; border: 1px solid #dddddd; text-align: center;">Jumlah Permintaan</th>
            <th rowspan="2" scope="col" style="width: 20%; text-align: center;">Karyawan</th>
            <th rowspan="2" scope="col" style="width: 10%; border: 1px solid #dddddd; text-align: center;">Area</th>
            <th rowspan="2" scope="col" style="width: 10%; border: 1px solid #dddddd; text-align: center;">Waktu Permintaan</th>
            <tr>
                <th>(>18.00)</th>
                <th>(&lt;18.00)</th>
            </tr>
        </thead>
        <tbody>
            @foreach($data as $requestfood)
            <tr>
                <td style="border: 1px solid #dddddd; text-align: center;">{{ optional($requestfood->employee)->department ?? 'Data tidak tersedia' }}</td>
                <td style="border: 1px solid #dddddd; text-align: center;">{{ optional($requestfood->employee)->line ?? 'Data tidak tersedia' }}</td>
                <td style="border: 1px solid #dddddd; text-align: center;">{{ optional($requestfood->employee)->name ?? 'Data tidak tersedia' }}</td>
                <td style="border: 1px solid #dddddd; text-align: center;">{{ $requestfood->overtime }}</td>
                <td style="border: 1px solid #dddddd; text-align: center;">{{ $requestfood->undertime }}</td>
                <td style="border: 1px solid #dddddd; text-align: center;">
                    @php
                        // Pisahkan nama karyawan dengan baris baru
                        $karyawan = explode(', ', $requestfood->karyawan);
                    @endphp
                    @foreach ($karyawan as $index => $nama)
                        {{ ' ' . $nama }} <br> <!-- Tambahkan baris baru -->
                    @endforeach
                </td>
                <td style="border: 1px solid #dddddd; text-align: center;">{{ $requestfood->area }}</td>
                <td style="border: 1px solid #dddddd; text-align: center;">{{ $requestfood->waktu_permintaan }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
    <div class="mb-3">
        <table>
            <thead>
                <th style="width: 10%; border: 1px solid #dddddd; text-align: center;">Total (>18.00)</th>
                <th style="width: 10%; border: 1px solid #dddddd; text-align: center;">Total (&lt;18.00)</th>
                <th style="width: 10%; border: 1px solid #dddddd; text-align: center;">Total Nasi Office</th>
            </thead>
            <tbody>
                <td style="width: 10%; border: 1px solid #dddddd; text-align: center;">{{ $totalOvertime }}</td>
                <td style="width: 10%; border: 1px solid #dddddd; text-align: center;">{{ $totalUndertime }}</td>
                <td style="width: 10%; border: 1px solid #dddddd; text-align: center;">{{ $officeTotalOvertime }}</td>
            </tbody>
        </table>
        <small>*Total nasi yang dipesan = <b>{{ $totalOvertime }}</b></small>
    </div>
    <div class="mt-5" style="float: right;">
        <table>
            <tr>
                <td style="float: right;">Tanda Tangan</td>
                <!-- <td>Dicek</td>
                <td>Diverifikasi</td>
                <td colspan="4">Disetujui</td> -->
            </tr>
            <tr>
                </br>
                </br>
            </tr>
            <tr>
                <td></td>

                <!-- Dicek -->
                <!-- <td></td> -->

                <!-- Diverifikasi -->
                <!-- <td></td>

                <td></td>

                <td></td>

                <td></td> -->
            </tr>
            <tr>
                </br>
                </br>
            </tr>
            <tr >
                <td style="float: right;">Admin GA</td>
                <!-- <td>Atasan Penilai</td>
                <td>Komite</td>
                <td>Manager</td>
                <td>General Manager</td>
                <td>Direktur</td> -->
            </tr>
        </table>
    </div>
</body>
</html>
