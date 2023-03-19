<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::resource('post',App\Http\Controllers\api\PostController::class)->only(['index','show']);
Route::get('post/{category}/category','api\PostController@category');
Route::get('category','api\CategoryController@index');
Route::get('category/all','api\CategoryController@all');
Route::get('post/{description}/description','api\PostController@description');
