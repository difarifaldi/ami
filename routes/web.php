<?php

use App\Http\Controllers\AuditMutuInternalController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\IndikatorController;
use App\Http\Controllers\InstrumenAuditController;
use App\Http\Controllers\KetercapaianStandarController;
use App\Http\Controllers\KuiController;
use App\Http\Controllers\LhaController;
use App\Http\Controllers\PernyataanStandarController;
use App\Http\Controllers\RecordLoginController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\StatusTemuanController;
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
        return redirect('/')->with('failed', 'Anda sudah login. Harap logout terlebih dahulu.');
    }
    return view('login');
})->name('login');

Route::post('/login', [UserController::class, 'check_login'])->name('login.post');

// Logout
Route::get('/logout', [UserController::class, 'logout'])->name('logout');


Route::get('/forgot-password', [UserController::class, 'forgotPassword'])->name('forgot-password');
Route::post('/password-post', [UserController::class, 'requestPassword'])->name('password-post');


Route::middleware(['auth'])->group(function () {

    Route::get('/', [DashboardController::class, 'index'])->name('dashboard.index');

    Route::resource('/instrument', InstrumenAuditController::class);
    Route::post('/instrument/selesaikan-audit', [InstrumenAuditController::class, 'selesaikanAudit'])->name('instrument.selesaikan-audit');

    Route::resource('/audit', AuditMutuInternalController::class);
    Route::resource('/unit', UnitController::class);

    Route::resource('/pernyataan', PernyataanStandarController::class);
    Route::resource('/indikator', IndikatorController::class);
    Route::resource('/lha', LhaController::class);
    Route::get('/riwayat', [LhaController::class, 'riwayat'])->name('riwayat');


    // export pdf
    Route::get('/export-pdf', [LhaController::class, 'exportPDF'])->name('lha.export-pdf');

    // chart
    Route::get('/fetch-status-temuan-data', [DashboardController::class, 'fetchStatusTemuanData']);
    Route::get('/fetch-line-chart-data', [DashboardController::class, 'fetchLineChartData'])->name('fetch-line-chart-data');


    Route::get('/statusAudit', [StatusTemuanController::class, 'index'])->name('statusAudit.index');
    Route::get('/statusAudit/filter', [StatusTemuanController::class, 'filter'])->name('statusAudit.filter');


    Route::get('/pernyataan/by-unit/{unitId}/{taId}', [IndikatorController::class, 'getPernyataanByUnit'])->name('pernyataan.byUnit');

    Route::get('/auditee/by-unit/{unitId}', [AuditMutuInternalController::class, 'getAuditeeByUnit']);

    // status pernyataan
    Route::post('/pernyataan/toggle-pernyataan-status', [PernyataanStandarController::class, 'togglePernyataanStatus'])->name('pernyataan.toggle-pernyataan-status');

    // Profile
    Route::get('/profile/edit-profile/{id}', [UserController::class, 'editProfile'])->name('profile.edit-profile');
    Route::post('/profile/update-profile', [UserController::class, 'updateProfile'])->name('profile.update-profile');
    Route::post('/profile/change-password', [UserController::class, 'changePassword'])->name('profile.change-password');



    // admin
    Route::group(['middleware' => ['role:admin']], function () {
        // User Management
        Route::resource('/aktivitas', RecordLoginController::class);
        Route::get('/admin', [UserController::class, 'umanagement'])->name('umanagement.index');
        Route::post('/admin/toggle-user-status', [UserController::class, 'toggleUserStatus'])->name('admin.toggle-user-status');
        Route::delete('/admin/delete-user/{id}', [UserController::class, 'deleteUser'])->name('admin.delete-user');
        Route::get('/admin/edit-user/{id}', [UserController::class, 'editUser'])->name('admin.edit-user');
        Route::post('/admin/update-user', [UserController::class, 'updateUser'])->name('admin.update-user');

        // Import Excel User
        Route::post('/import-excel', [UserController::class, 'importExcel'])->name('import-excel');

        // Import Excel User
        Route::get('/importDataPernyataan', [PernyataanStandarController::class, 'formImportData'])->name('formImportData');
        Route::post('/importDataPernyataan', [PernyataanStandarController::class, 'importData'])->name('importDataPernyataan');



        // Register
        Route::get('/register', [UserController::class, 'index'])->name('register.index');
        Route::post('/register', [UserController::class, 'store'])->name('register.store');
    });
});
