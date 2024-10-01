<?php

namespace App\Imports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Collection;

class UsersImport implements ToModel
{
    public $errors = []; // Simpan pesan error di sini

    public function model(array $row)
    {
        // Mengabaikan baris header
        if ($row[0] === 'nama') {
            return null; // Abaikan baris header
        }

        // Definisikan validasi untuk setiap kolom
        $validator = Validator::make([
            'name' => $row[0],
            'email' => $row[1],
            'password' => $row[2],
            'status' => $row[3],
            'unit' => $row[4],
            'nip' => $row[5],
            'role' => $row[6],
        ], [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6',
            'status' => 'required|string|in:aktif,tidak aktif',
            'unit' => 'required|integer|exists:units,id',
            'nip' => 'nullable|integer',
            'role' => 'required|string|exists:roles,name',
        ]);

        // Jika ada kesalahan validasi, simpan pesan error dan lempar pengecualian
        if ($validator->fails()) {
            // Simpan pesan error dengan informasi baris
            $this->errors[] = [
                'row' => $row, // Simpan baris yang salah
                'errors' => $validator->errors()->all(), // Simpan pesan error
            ];

            // Tidak perlu melempar pengecualian di sini, hanya catat kesalahan
            return null; // Lanjutkan tanpa menyimpan user
        }

        // Jika validasi berhasil, buat user baru
        $user = new User([
            'name' => $row[0],
            'email' => $row[1],
            'password' => Hash::make($row[2]),
            'status' => $row[3],
            'id_unit' => $row[4],
            'nip' => $row[5],
        ]);

        // Cek apakah role ada dan berikan role
        $role = Role::findByName($row[6]); // Menggunakan nama peran dari Excel
        if ($role) {
            $user->assignRole($role->name);
        }

        return $user;
    }
}
