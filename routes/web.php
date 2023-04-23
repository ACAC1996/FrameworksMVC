<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;

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
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home'); 

Route::resource('categories', App\Http\Controllers\CategoryController::class);
Route::resource('posts', App\Http\Controllers\PostController::class);
Route::resource('users', App\Http\Controllers\UserController::class);
Route::resource('replies', App\Http\Controllers\ReplyController::class);
Route::post('post/{post}/image',[App\Http\Controllers\PostController::class,'image'])->name('post.image');

Route::get('/','frontend\webController@index')->name('index');
Route::get('/detail/{id}','web\WebController@detail');
Route::get('/post-category/{id}','web\WebController@post-category');

Route::get('/post/{id}', 'PostController@show')->name('posts.show');
