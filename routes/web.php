<?php

use App\Http\Controllers\admin\AdminController;
use App\Http\Controllers\admin\ProgrammingsController;
use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return redirect('admin');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});

Route::middleware(['checkAdmin'])->group(function () {
    Route::get('', [AdminController::class, 'index'])->middleware('auth:sanctum');
});

// Ruta de acceso denegado para usuarios no autorizados
Route::get('/access-denied', function () {
    return view('access-denied');
})->name('accessDenied');

Route::get('/new-profile', function () {
    return view('new-Profile');
})->name('newProfile');


//Route::get('searchprogramming', [ProgrammingsController::class, 'searchprogramming'])->name('admin.searchprogramming');