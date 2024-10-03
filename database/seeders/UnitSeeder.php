<?php

namespace Database\Seeders;

use App\Models\Unit;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use PhpParser\Node\Stmt\Foreach_;

class UnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $units = [
            'UPT Urusan Internasional (KUI)',
            'UPA Perpustakaan',
            'UPA Rekaya Teknologi dan Produk Unggulan',
            'UPA Layanan Uji Kompetensi',
            'UPA Perawatan dan Perbaikan',
            'UPA Pengembangan Karier dan Kewirausahaan',
            'UPA Teknologi Informasi dan Komunikasi',
        ];

        foreach ($units as $unit) {

            Unit::create([
                'nama' => $unit

            ]);
        }
    }
}
