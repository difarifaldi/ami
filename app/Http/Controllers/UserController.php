<?php

namespace App\Http\Controllers;

use App\Models\Unit;
use Illuminate\Http\Request;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
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

        $request->validate([

            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
            'roles' => 'required',
            'status' => 'required',
            'id_unit' => 'required',
            'nip' => 'numeric|nullable',

        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'status' => $request->status,
            'id_unit' => $request->id_unit,
            'nip' => $request->nip,
        ]);
        $user->assignRole($request->roles);
        return redirect()->route('umanagement.index')->with('success', 'Berhasil menambahkan akun baru');
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
        try {
            $user = User::findOrFail($userId);
            $user->delete();

            return response()->json(['message' => 'success'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function umanagement()
    {
        $users = User::paginate(10);
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
                'id_unit' => 'required',
                'nip' => 'numeric|nullable',
            ]);

            // Update nama dan email
            $user->update([
                'name' => $validatedData['name'],
                'email' => $validatedData['email'],
                'nip' => $validatedData['nip'],
                'id_unit' => $validatedData['id_unit'],
            ]);

            // Update password jika diisi
            if ($request->filled('password')) {
                $user->update([
                    'password' => Hash::make($validatedData['password'])
                ]);
            }

            // Hapus peran sebelumnya jika ada dan tambahkan peran baru
            $user->syncRoles([$validatedData['roles']]);

            return redirect()->route('umanagement.index')->with('success', 'User updated successfully.');
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
