<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\FoodController;
use App\Http\Controllers\Auth\UserController;
use App\Http\Controllers\Api\V1\ConfigController;
use App\Http\Controllers\Api\V1\OrderController;
use App\Http\Controllers\Api\V1\FoodCategory;
use App\Http\Controllers\TrackOrderController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// Version 1

Route::group(['prefix' => 'products', 'namespace' => 'App\Http\Controllers\Api\V1'], function(){
    
    Route::apiResource('foods', FoodController::class);
    Route::post('foods/bulk', [FoodController::class, 'bulkStore']); 
    Route::get('pizza', [FoodCategory::class, 'pizza_category']);
    Route::get('drinks', [FoodCategory::class, 'drink_category']);
    Route::get('biryani', [FoodCategory::class, 'biryani_category']);
    Route::get('burgers', [FoodCategory::class, 'burgers_category']);
    Route::get('rolls', [FoodCategory::class, 'rolls_category']);
    Route::get('chicken', [FoodCategory::class, 'chicken_category']);
    Route::get('thali', [FoodCategory::class, 'thali_category']);
    Route::get('cake', [FoodCategory::class, 'cake_category']);
    Route::get('noodles', [FoodCategory::class, 'noodles_category']);
    Route::get('momos', [FoodCategory::class, 'momos_category']);
    Route::get('dosa', [FoodCategory::class, 'dosa_category']);
    Route::get('sandwich', [FoodCategory::class, 'sandwich_category']);
    Route::get('idli', [FoodCategory::class, 'idli_category']);
    Route::get('all', [FoodCategory::class, 'all_foods']);
});

// Registration and Login
Route::group(['prefix' => 'auth', 'namespace' => 'App\Http\Controllers\Auth'], function(){
    Route::post('register', [UserController::class, 'register']);
    Route::post('login', [UserController::class, 'login']);
});

// User Information
Route::group(['prefix' => 'customer', 'namespace' => 'App\Http\Controllers\Auth', 'middleware' => 'auth:sanctum'], function(){
    Route::get('info', [UserController::class, 'userEntities']);
    Route::post('address', [UserController::class, 'UserAddress']);
    Route::get('address-data', [UserController::class, 'UserAddressData']);
    Route::group(['prefix' => 'order', 'namespace' => 'App\Http\Controllers\Api\V1'], function(){
        Route::post('place', [OrderController::class, 'place_order']);
        Route::get('data', [OrderController::class, 'get_order_data']);
        Route::get('track-order', [TrackOrderController::class, 'track_order']);
    });
});


// Configurations
Route::group(['prefix' => 'config', 'namespace' => 'App\Http\Controllers\Api\V1'], function(){

    Route::get('geocode-api', [ConfigController::class, 'getGeocodeApi']);
});
