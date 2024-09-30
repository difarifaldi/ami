<?php

namespace App\Imports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Log;

class UsersImport implements ToModel
{
    public function model(array $row)
    {
        // Mengabaikan baris header
        if ($row[0] === 'nama') {
            return null; // Abaikan baris header
        }
        // Buat instance User baru
        $importData = new User([
            'name' => $row[0],
            'email' => $row[1],
            'password' => Hash::make($row[2]),
            'status' => $row[3],
            'id_unit' => $row[4],
            'nip' => $row[5],
        ]);

        // Simpan model User
        $importData->save();

        // Assign role setelah model disimpan
        try {
            $importData->assignRole($row[6]); // Pastikan $row[6] adalah nama role yang valid
        } catch (\Exception $e) {
            // Tangani exception jika role tidak valid
            Log::error('Role tidak valid untuk user ' . $importData->email . ': ' . $e->getMessage());
        }

        return $importData;
    }
}
