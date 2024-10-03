<?php

namespace Database\Seeders;

use App\Models\tahunAkademik;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TahunAkademikSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $TA = [
            '2024',
            '2025',
            '2026',
            '2027',
            '2028',

        ];
        foreach ($TA as $T) {
            tahunAkademik::create([
                'nama' => $T
            ]);
        }
    }
}
