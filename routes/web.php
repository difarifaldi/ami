<?php

use App\Http\Controllers\AuditMutuInternalController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\KetercapaianStandarController;
use App\Http\Controllers\KuiController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UnitController;
use Illuminate\Support\Facades\Auth;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
// Login
Route::get('/login', function () {
    if (Auth::check()) {
        return redirect('/')->with('warning', 'Anda sudah login. Harap logout terlebih dahulu.');
    }
    return view('login');
})->name('login');
Route::post('/login', [UserController::class, 'check_login'])->name('login');

// Logout
Route::get('/logout', [UserController::class, 'logout'])->name('logout');
// Register
Route::get('/register', [UserController::class, 'index'])->name('register.index');
Route::post('/register', [UserController::class, 'store'])->name('register.store');

Route::middleware(['auth'])->group(function () {
    // Rute-rute yang memerlukan otentikasi di sini
    Route::get('/', [DashboardController::class, 'index']);
    // standar
    Route::resource('/standar', KetercapaianStandarController::class);
    Route::resource('/audit', AuditMutuInternalController::class);
    Route::resource('/unit', UnitController::class);

    // superadmin
    Route::group(['middleware' => ['role:superadmin']], function () {
        // User Management
        Route::get('/admin', [UserController::class, 'umanagement'])->name('umanagement.index');
        Route::post('/admin/toggle-user-status', [UserController::class, 'toggleUserStatus'])->name('admin.toggle-user-status');
        Route::delete('/admin/delete-user/{id}', [UserController::class, 'deleteUser'])->name('admin.delete-user');
        Route::get('/admin/edit-user/{id}', [UserController::class, 'editUser'])->name('admin.edit-user');
        Route::post('/admin/update-user', [UserController::class, 'updateUser'])->name('admin.update-user');

        // Level
        Route::get('/roles', [RoleController::class, 'index'])->name('roles.index');
        Route::post('/roles', [RoleController::class, 'store'])->name('roles.store');
        Route::delete('/roles/{id}', [RoleController::class, 'destroy'])->name('roles.destroy');

        // Reset Password
        Route::post('/reset-password', [UserController::class, 'resetPassword'])->name('user.reset-password');
        Route::get('/reset-password', [UserController::class, 'showResetPasswordForm'])->name('user.show-reset-password-form');
    });
});
