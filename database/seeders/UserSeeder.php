<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // for ($i = 5; $i <= 10; $i++) {
        //     $user_auditor = User::create([
        //         'name' => 'auditor ' . $i,
        //         'email' => 'auditor' . $i . '@gmail.com',
        //         'id_unit' => rand(1, 7), // Menggunakan fungsi rand untuk mendapatkan ID unit acak
        //         'password' => Hash::make('password123'),
        //         'status' => 'aktif'
        //     ]);

        //     $user_auditor->assignRole('auditor');
        // }

        $admin = User::create([
            'name' => 'admin ',
            'email' => 'admin@pnj.ac.id ',
            'id_unit' => null,
            'password' => Hash::make('password123'),
            'status' => 'aktif'

        ]);
        $admin->assignRole('admin');
    }
}
