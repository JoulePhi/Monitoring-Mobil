<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\VehicleController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Admin\ReservationController;
use App\Http\Controllers\Approval\ApprovalController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('dashboard.index');
});



Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');




    Route::controller(ReservationController::class)->group(function () {
        Route::get('/reservation', 'index')->name('reservation.index');
        Route::post('/add/reservation', 'reserve')->name('reservation.reserve');
        Route::post('/reservation/done', 'done')->name('reservation.done');
        Route::post('/reservation/export', 'export')->name('reservation.export');
    });
    Route::controller(ApprovalController::class)->group(function () {
        Route::get('/approval', 'index')->name('approval.index');
        Route::post('/approval', 'approve')->name('approval.approve');
    });

    Route::controller(DashboardController::class)->group(function () {
        Route::get('/dashboard', 'index')->name('dashboard.index');
        Route::get('/usage-data/{week}', 'getData')->name('dashboard.getdata');
    });
    Route::controller(VehicleController::class)->group(function () {
        Route::get('/vehicles', 'index')->name('vehicles.index');
    });
});

require __DIR__ . '/auth.php';
