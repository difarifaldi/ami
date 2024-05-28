<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Role;

class RoleController extends Controller
{
    public function __construct()
    {
        // Terapkan middleware langsung di dalam constructor
        $this->middleware(function ($request, $next) {
            // Periksa apakah pengguna adalah superadmin
            if (Auth::user() && Auth::user()->role === 'superadmin') {
                return $next($request);
            }
            
            // Jika bukan superadmin, redirect atau berikan respon yang sesuai
            return redirect('/')->with('failed', 'Anda tidak memiliki izin untuk mengakses halaman ini.');
        });
    }

    public function index()
    {
        $roles = Role::all();
        return view('role.index', compact('roles'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'role' => 'required|unique:roles|max:255',
        ]);

        Role::create([
            'role' => $request->role,
        ]);

        return redirect()->route('roles.index')
                        ->with('success','Role berhasil dibuat.');
    }

    public function destroy($id)
    {
        $role = Role::find($id);
        $role->delete();

        return redirect()->route('roles.index')
                        ->with('success','Role berhasil dihapus.');
    }
}
