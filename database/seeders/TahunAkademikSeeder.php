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
            '2023/2024 Genap',
            '2024/2025 Ganjil',
            '2024/2025 Genap',
            '2025/2026 Ganjil',
            '2025/2026 Genap',
        ];
        foreach ($TA as $T) {
            tahunAkademik::create([
                'nama' => $T
            ]);
        }
    }
}
