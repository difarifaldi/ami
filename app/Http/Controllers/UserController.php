<?php

namespace App\Http\Controllers;

use App\Imports\UsersImport;
use App\Models\AuditMutuInternal;
use App\Models\RecordLogin;
use App\Models\Unit;
use Illuminate\Http\Request;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    public function index()
    {
        $roles = Role::all();
        $units = Unit::all();

        return view('register', compact('roles', 'units'));
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {

        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'roles' => 'required|string|exists:roles,name',
            'status' => 'required',
            'id_unit' => 'required|integer',
            'nip' => 'numeric|nullable',
            'ttd' => 'nullable|image|file|max:1024',
        ]);

        if ($request->file('ttd')) {
            $validatedData['ttd'] = $request->file('ttd')->store('tanda-tangan', 'public');
        }

        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
            'status' => $validatedData['status'],
            'id_unit' => $validatedData['id_unit'],
            'nip' => $validatedData['nip'],
            'ttd' => $validatedData['ttd'] ?? null,
        ]);

        $user->assignRole($validatedData['roles']);

        // Mengirim email ke user baru
        // $this->sendAccountDetails($validatedData['email'], $validatedData['name'], $validatedData['password']);

        return redirect()->route('umanagement.index')->with('success', 'Berhasil menambahkan akun baru');
    }

    protected function sendAccountDetails($email, $name, $password)
    {
        $details = [
            'title' => 'Detail Akun SIAMI',
            'body' => "Halo $name,\n\nAkun anda berhasil dibuat. Berikut merupakan detail akun anda:\n\nEmail: $email\nPassword: $password\n\nSilahkan ubah password anda ketika anda sudah melakukan login.",
        ];

        Mail::raw($details['body'], function ($message) use ($email, $details) {
            $message->to($email)
                ->subject($details['title']);
        });
    }


    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function showLoginForm()
    {
        return view('login');
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function check_login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            if ($user->status === 'aktif') {
                RecordLogin::create([
                    'user_id' => $user->id,
                    'waktu_login' => now('Asia/Jakarta'),  // atau bisa juga dengan date('Y-m-d H:i:s')
                ]);
                return redirect('/')->with('success', 'Login berhasil!');
            } else {
                Auth::logout();
                return redirect('login')->with('failed', 'Akun Anda tidak aktif. Harap hubungi administrator.');
            }
        } else {
            return redirect('login')->with('failed', 'Username atau Password Salah');
        }
    }

    public function logout(Request $request)
    {
        Auth::logout();

        // Menambahkan header untuk mengatur cache agar tidak disimpan
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login')->with('success', 'Kamu telah logout');;
    }

    public function deleteUser($userId)
    {
        DB::beginTransaction();

        try {
            $user = User::findOrFail($userId);

            // Cek apakah ada relasi dengan tabel AuditMutuInternal
            $relatedAudit = AuditMutuInternal::where(function ($query) use ($userId) {
                $query->where('id_user_auditee', $userId)
                    ->orWhere('id_user_auditor_ketua', $userId)
                    ->orWhere('id_user_auditor_anggota1', $userId)
                    ->orWhere('id_user_auditor_anggota2', $userId)
                    ->orWhere('id_user_manajemen', $userId)
                    ->orWhere('id_user_admin', $userId);
            })->first();

            if ($relatedAudit) {
                DB::rollBack(); // Batalkan transaksi
                return response()->json(['message' => 'Tidak dapat menghapus pengguna karena masih terkait dengan entitas lain.'], 400);
            }

            // Lanjutkan penghapusan jika tidak ada relasi
            if ($user->ttd) {
                Storage::delete('public/' . $user->ttd);
            }

            $user->delete();
            $record = RecordLogin::where('user_id', $userId);
            $record->delete();


            DB::commit();

            return response()->json(['message' => 'Akun pengguna berhasil dihapus!'], 200);
        } catch (Exception $e) {
            DB::rollBack();

            return response()->json(['message' => 'Terjadi kesalahan!'], 500);
        }
    }


    public function umanagement()
    {
        $users = User::all();
        $roles = Role::all();
        $units = Unit::all();


        // $user = User::find(1);
        // $unitName = $user->unit ? $user->unit->nama : 'tidak memiliki unit';
        // dd($unitName);


        return view('umanagement.index', ['users' => $users, 'roles' => $roles, 'units' => $units]);
    }


    public function editUser($id)
    {
        $currentUser = Auth::user();


        $user = User::findOrFail($id);
        $roles = Role::all();
        $units = Unit::all();

        return view('umanagement.edit', compact('user', 'roles', 'units'));
    }

    public function updateUser(Request $request)
    {
        try {
            $user = User::findOrFail($request->user_id);

            // Validasi data input
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
                'password' => 'nullable|string|min:8',
                'roles' => 'required|string|exists:roles,name',
                'id_unit' => 'required|exists:units,id',
                'nip' => 'numeric|nullable',
                'ttd' => 'nullable|image|file|max:1024',
                'foto' => 'nullable|image|file|max:1024',
            ]);

            // Cek jika ada file 'ttd' yang diunggah
            if ($request->file('ttd')) {
                if ($user->ttd) {
                    Storage::disk('public')->delete($user->ttd);
                }
                $validatedData['ttd'] = $request->file('ttd')->store('tanda-tangan', 'public');
            }

            // Cek jika ada file 'foto' yang diunggah
            if ($request->file('foto')) {
                if ($user->foto) {
                    Storage::disk('public')->delete($user->foto);
                }
                $validatedData['foto'] = $request->file('foto')->store('foto-profile', 'public');
            }

            // Persiapkan data untuk diupdate
            $dataToUpdate = [
                'name' => $validatedData['name'],
                'email' => $validatedData['email'],
                'nip' => $validatedData['nip'],
                'id_unit' => $validatedData['id_unit'],
            ];

            // Tambahkan 'ttd' dan 'foto' jika ada di $validatedData
            if (isset($validatedData['ttd'])) {
                $dataToUpdate['ttd'] = $validatedData['ttd'];
            }
            if (isset($validatedData['foto'])) {
                $dataToUpdate['foto'] = $validatedData['foto'];
            }

            // Update user
            $user->update($dataToUpdate);

            // Update password jika diisi
            if ($request->filled('password')) {
                $user->update([
                    'password' => Hash::make($validatedData['password']),
                    'forgot_password' => 'tidak'
                ]);
                $this->changePasswordAccount($validatedData['email'], $validatedData['name'], $validatedData['password']);
            }

            // Hapus peran sebelumnya jika ada dan tambahkan peran baru
            $user->syncRoles([$validatedData['roles']]);

            return redirect()->route('umanagement.index')->with('success', 'Berhasil Update User.');
        } catch (Exception $e) {
            return redirect()->back()->with(['failed' => $e->getMessage()])->withInput();
        }
    }
    protected function changePasswordAccount($email, $name, $password)
    {
        $details = [
            'title' => 'Password Baru Akun SIAMI',
            'body' => "Halo $name,\n\nBerikut merupakan password baru anda:\n\nEmail: $email\nPassword: $password\n\nSilahkan ubah password anda ketika anda sudah melakukan login.",
        ];

        Mail::raw($details['body'], function ($message) use ($email, $details) {
            $message->to($email)
                ->subject($details['title']);
        });
    }


    public function editProfile($id)
    {
        $currentUser = Auth::user();


        $user = User::findOrFail($id);
        $roles = Role::all();
        $units = Unit::all();

        return view('profile', compact('user', 'roles', 'units'));
    }
    public function updateProfile(Request $request)
    {
        try {
            $user = User::findOrFail($request->user_id);

            // Validasi data input
            $validatedData = $request->validate([
                'ttd' => 'nullable|image|file|max:1024',
                'foto' => 'nullable|image|file|max:1024',
            ]);

            // Cek jika ada file 'ttd' yang diunggah
            if ($request->file('ttd')) {
                if ($user->ttd) {
                    Storage::disk('public')->delete($user->ttd);
                }
                $validatedData['ttd'] = $request->file('ttd')->store('tanda-tangan', 'public');
            }

            // Cek jika ada file 'foto' yang diunggah
            if ($request->file('foto')) {
                if ($user->foto) {
                    Storage::disk('public')->delete($user->foto);
                }
                $validatedData['foto'] = $request->file('foto')->store('foto-profile', 'public');
            }


            // Tambahkan 'ttd' dan 'foto' jika ada di $validatedData
            if (isset($validatedData['ttd'])) {
                $dataToUpdate['ttd'] = $validatedData['ttd'];
            }
            if (isset($validatedData['foto'])) {
                $dataToUpdate['foto'] = $validatedData['foto'];
            }

            // Update user
            $user->update($dataToUpdate);

            return redirect('/')->with('success', 'Berhasil Update User.');
        } catch (Exception $e) {
            return redirect()->back()->with(['failed' => $e->getMessage()])->withInput();
        }
    }
    public function changePassword(Request $request)
    {

        Log::info('Fungsi changePassword dipanggil');
        $request->validate([
            'old_password' => 'required|string',
            'new_password' => 'required|string|min:8|confirmed',
            'user_id' => 'required|integer|exists:users,id',
        ]);

        $user = User::findOrFail($request->user_id);

        // Validasi password lama
        if (!Hash::check($request->old_password, $user->password)) {
            return response()->json(['message' => 'Password lama salah'], 422);
        }

        // Jika password lama cocok, update password baru
        $user->password = Hash::make($request->new_password);
        $user->save();

        return response()->json(['message' => 'Berhasil ubah password'], 200);
    }


    public function forgotPassword()
    {
        if (Auth::check()) {
            return redirect('/')->with('failed', 'Anda sudah login. Harap logout terlebih dahulu.');
        }
        return view('forgotPassword');
    }
    public function requestPassword(Request $request)
    {

        $validatedData = $request->validate([
            'email' => 'required|email'
        ]);
        $user = User::where('email', $validatedData['email'])->first();

        if (!$user) {
            return redirect()->back()->with('failed', 'Email Anda Tidak Terdaftar');
        }
        $user->update(['forgot_password' => 'ya']);

        return redirect('/forgot-password')->with('success', 'Permintaan Anda Akan Diproses');
    }


    public function toggleUserStatus(Request $request)
    {
        try {
            $user = User::findOrFail($request->userId);

            // Toggle status pengguna antara 'aktif' dan 'tidak aktif'
            $user->status = $user->status === 'aktif' ? 'tidak aktif' : 'aktif';

            // Simpan perubahan status ke dalam database
            $user->save();

            return response()->json(['message' => 'success'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function importExcel(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xls,xlsx'
        ]);

        $import = new UsersImport();

        try {
            Excel::import($import, $request->file('file'));

            // Cek jika ada error setelah import
            if (!empty($import->errors)) {
                // Buat pesan error dalam bentuk string
                $errorMessages = [];
                foreach ($import->errors as $index => $error) {
                    // Menampilkan index baris (1-based index) dan kesalahan

                    //tampilin data pada excel
                    // $errorMessages[] = 'Baris: ' . implode(', ', $error['row']) . ' - ' . implode(', ', $error['errors']);

                    //sebutin baris
                    $errorMessages[] = 'Baris ' . ($index + 2) . ': ' . implode(', ', $error['errors']);
                }

                // Kembalikan pesan error ke view
                return back()->withErrors($errorMessages);
            }

            return back()->with('success', 'Data berhasil diimpor.');
        } catch (\Exception $e) {
            // Tangani pengecualian dan kirim pesan error
            return back()->withErrors(['error' => 'Error importing users: ' . $e->getMessage()]);
        }
    }
}
