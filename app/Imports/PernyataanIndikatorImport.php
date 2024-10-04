<?php

namespace App\Imports;

use App\Models\PernyataanStandar;
use App\Models\Indikator;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;

class PernyataanIndikatorImport implements ToCollection
{
    protected $id_unit;
    protected $id_TA;

    public function __construct($id_unit, $id_TA)
    {
        $this->id_unit = $id_unit;
        $this->id_TA = $id_TA;
    }
    public function collection(Collection $rows)
    {
        DB::transaction(function () use ($rows) {
            $pernyataan = null; // Menyimpan pernyataan standar terakhir

            // Ambil baris pertama sebagai header
            $header = $rows->first();

            // Validasi header (pastikan header sesuai)
            if ($header[0] !== 'No. PS' && $header[1] !== 'Pernyataan Standar' && $header[2] !== 'No. Butir Standar/Kriteria' && $header[3] !== 'Indikator') {
                throw new \Exception('Format file tidak sesuai, harap cek kembali header kolom.');
            }


            // Lewati baris pertama (header) dan lanjutkan pemrosesan baris berikutnya
            $rows->forget(0);

            foreach ($rows as $row) {
                // Abaikan baris yang kosong
                if ($row[0] === null && $row[2] === null) {
                    continue;
                }

                // Jika ada nilai di kolom No. PS, buat pernyataan baru
                if ($row[0] !== null) {
                    $no_ps = $row[0];

                    // Validasi no_ps harus berupa integer
                    if (!is_numeric($no_ps) || (int) $no_ps != $no_ps) {
                        throw new \Exception('No. PS harus berupa angka integer.');
                    }

                    $unit = request()->input('id_unit');
                    $TA = request()->input('id_TA');

                    $existsPernyataan = PernyataanStandar::where('no_ps', $no_ps)
                        ->where('id_unit', $unit)
                        ->where('id_TA', $TA)
                        ->exists();

                    if ($existsPernyataan) {
                        throw new \Exception('Pernyataan standar pada unit ini sudah tersedia.');
                    }

                    // Buat pernyataan standar baru
                    $pernyataan = PernyataanStandar::create([
                        'no_ps' => $row[0],
                        'pernyataan_standar' => $row[1],
                        'id_unit' => $unit,
                        'id_TA' => $TA,
                    ]);
                }

                // Buat indikator jika No Butir Standar/Kriteria tidak kosong
                if ($pernyataan && $row[2] !== null) {
                    Indikator::create([
                        'no' => $row[2],
                        'indikator' => $row[3],
                        'id_pernyataan' => $pernyataan->id,
                    ]);
                }
            }
        });
    }
}
