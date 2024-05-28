<?php

namespace Database\Seeders;

use App\Models\StatusTercapai;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StatusTercapaiSeeder extends Seeder
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
        ];

        foreach ($statuses as $status) {
            StatusTercapai::create([
                'nama' => $status
            ]);
        };
    }
}
