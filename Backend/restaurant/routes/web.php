<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\PaymentController;
use App\Http\Controllers\Api\V1\PaypalPaymentController;
use App\Http\Controllers\PaypalController;
use App\Http\Controllers\StripeController;

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
    return view('welcome');
});

Route::get('paypal-payment', function () {
    return view('paypal-payment-view');
});


Route::get('payment-mobile', [PaypalController::class, 'startPayment'])->name('payment-mobile');

// For PayPal Payment routes

Route::post('paypal/payment', [PaypalController::class, 'payment'])->name('paypal');
Route::get('paypal/success', [PaypalController::class, 'success'])->name('paypal_success');
Route::get('paypal/cancel', [PaypalController::class, 'cancel'])->name('paypal_cancel');


// For Stripe Payment routes

Route::post('stripe/payment', [StripeController::class, 'payment'])->name('stripe');
Route::get('stripe/success', [StripeController::class, 'success'])->name('stripe_success');
Route::get('stripe/cancel', [StripeController::class, 'cancel'])->name('stripe_cancel');





