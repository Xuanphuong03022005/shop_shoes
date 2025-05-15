<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use  App\Http\Controllers\LoginController;
use  App\Http\Controllers\UserController;
use  App\Http\Controllers\Admin\AdminCategoryController;
use  App\Http\Controllers\Admin\AdminOriginController;
use  App\Http\Controllers\Admin\AdminColorController;
use  App\Http\Controllers\Admin\AdminBrandController;
use  App\Http\Controllers\Admin\AdminGenderController;
use  App\Http\Controllers\Admin\AdminProductController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\Clients\ProductController;
use App\Http\Controllers\Clients\SizeController;
use PHPUnit\TextUI\XmlConfiguration\Group;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::resource('user', UserController::class);
Route::prefix('admin')->group(function(){
    Route::resource('category', AdminCategoryController::class);
    Route::resource('origin', AdminOriginController::class);
    Route::resource('color', AdminColorController::class);
    Route::resource('brand', AdminBrandController::class);
    Route::resource('gender', AdminGenderController::class);
    Route::resource('product', AdminProductController::class);
    Route::post('update/product/{id}', [AdminProductController::class, 'update']);
});
Route::group(['middleware' => 'api','prefix' => 'auth'], function ($router) {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('me', [AuthController::class, 'me']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', 'AuthController@refresh');

});
Route::get('products', [ProductController::class, 'index']);
Route::get('products/{id}', [ProductController::class, 'show']);
Route::get('brands-home', [BrandController::class, 'index']);
Route::get('size-color/{id}', [SizeController::class, 'show']);