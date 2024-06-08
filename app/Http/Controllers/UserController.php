<?php

namespace App\Http\Controllers;

use App\Models\AuditMutuInternal;
use App\Models\Unit;
use Illuminate\Http\Request;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
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
        try {

            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:8',
                'roles' => 'required|string|exists:roles,name',
                'status' => 'required',
                'id_unit' => 'required|integer',
                'nip' => 'numeric|nullable',
                'ttd' => 'nullable|image|file|max:1024', // Menambahkan ukuran maksimal file
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


            return redirect()->route('umanagement.index')->with('success', 'Berhasil menambahkan akun baru');
        } catch (Exception $e) {
            dd([
                'Message' => $e->getMessage(),
                'File' => $e->getFile(),
                'Line' => $e->getLine(),
            ]);
        }
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
            if ($user->status === 'active') {
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
                    'password' => Hash::make($validatedData['password'])
                ]);
            }

            // Hapus peran sebelumnya jika ada dan tambahkan peran baru
            $user->syncRoles([$validatedData['roles']]);

            return redirect()->route('umanagement.index')->with('success', 'Berhasil Update User.');
        } catch (Exception $e) {
            return redirect()->back()->with(['failed' => $e->getMessage()])->withInput();
        }
    }




    public function toggleUserStatus(Request $request)
    {
        try {
            $user = User::findOrFail($request->userId);

            // Toggle status pengguna antara 'active' dan 'inactive'
            $user->status = $user->status === 'active' ? 'inactive' : 'active';

            // Simpan perubahan status ke dalam database
            $user->save();

            return response()->json(['message' => 'success'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function showResetPasswordForm()
    {
        return view('reset-password');
    }

    public function resetPassword(Request $request)
    {
        $user = Auth::user();

        // Validasi input password
        $request->validate([
            'password' => 'required|string|min:8|confirmed',
        ]);

        // Update password pengguna
        $user->password = Hash::make($request->password);
        $user->save();

        return redirect('/')->with('success', 'Password berhasil direset.');
    }
}
