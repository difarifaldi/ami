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

            foreach ($rows as $row) {
                // Abaikan baris header jika ada
                if ($row[0] === 'No. PS' || $row[0] === null && $row[2] === null) {
                    continue;
                }

                // Jika ada nilai di kolom No. PS, buat pernyataan baru
                if ($row[0] !== null) {
                    $no_ps =  $row[0];
                    $unit = request()->input('id_unit');
                    $TA = request()->input('id_TA');

                    $existsPernyataan = PernyataanStandar::where('no_ps', $no_ps)->where('id_unit', $unit)->where('id_TA', $TA)->exists();

                    if ($existsPernyataan) {
                        throw new \Exception('Pernyataan standar pada unit ini sudah tersedia ');
                    }
                    $pernyataan = PernyataanStandar::create([
                        'no_ps' => $row[0],
                        'pernyataan_standar' => $row[1],
                        'id_unit' => request()->input('id_unit'), // Dari form
                        'id_TA' => request()->input('id_TA'), // Dari form
                    ]);
                }

                // Pastikan kita punya pernyataan standar yang valid dan No Butir Standar tidak kosong
                if ($pernyataan && $row[2] !== null) {
                    Indikator::create([
                        'no' => $row[2],
                        'indikator' => $row[3],
                        'id_pernyataan' => $pernyataan->id, //ambil pernyataan standar terakhir
                    ]);
                }
            }
        });
    }
}
