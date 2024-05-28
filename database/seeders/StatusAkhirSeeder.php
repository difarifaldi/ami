<?php

namespace Database\Seeders;

use App\Models\StatusAkhir;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StatusAkhirSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $statuses = [
            'selesai',
            'belum selesai',

        ];

        foreach ($statuses as $status) {
            StatusAkhir::create([
                'nama' => $status
            ]);
        };
    }
}
