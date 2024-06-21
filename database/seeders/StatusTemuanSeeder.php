<?php

namespace Database\Seeders;

use App\Models\StatusTemuan;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StatusTemuanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $statuses = [
            'belum mencapai',
            'tercapai',
            'melampaui',
            'menyimpang'
        ];

        foreach ($statuses as $status) {
            StatusTemuan::create([
                'nama' => $status
            ]);
        };
    }
}
