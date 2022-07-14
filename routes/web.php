<?php

use App\Http\Controllers\AuthorPostController;
use App\Http\Controllers\PostCommentsController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\SessionsController;
use Illuminate\Support\Facades\Route;


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

Route::get('/', [PostController::class, 'index']);

Route::get('posts/{post:slug}', [PostController::class, 'show']);

Route::post('posts/{post:slug}/comments', [PostCommentsController::class, 'store']); 


Route::get('register', [RegisterController::class, 'create'])->middleware('guest');
Route::post('register', [RegisterController::class, 'store'])->middleware('guest');

Route::get('login', [SessionsController::class, 'create'])->middleware('guest');
Route::post('login', [SessionsController::class, 'store'])->middleware('guest');
Route::post('logout', [SessionsController::class, 'destroy'])->middleware('auth');


Route::get('categories/{category:slug}', [PostController::class, 'categoryArchive']);
Route::get('authors/{author:username}', [PostController::class, 'authorArchive']);

Route::get('author/posts/create', [AuthorPostController::class, 'create']);
Route::post('author/posts/create', [AuthorPostController::class, 'store']);

Route::get('author/posts', [AuthorPostController::class, 'index']);
Route::get('author/posts/{post}/edit', [AuthorPostController::class, 'edit']);
Route::patch('author/posts/{post}', [AuthorPostController::class, 'update']);
Route::delete('author/posts/{post}', [AuthorPostController::class, 'destroy']);


