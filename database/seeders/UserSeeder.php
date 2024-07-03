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

        $user_super_admin = User::create([
            'name' => 'Muhammad Difa Rifaldi',
            'email' => 'difa@gmail.com',
            'id_unit' => null,
            'password' => Hash::make('password123'),
            'status' => 'active'
        ]);

        $user_super_admin->assignRole('admin');
    }
}
