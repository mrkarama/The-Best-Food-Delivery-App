<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class StripeController extends Controller
{
    public function payment(Request $request)
    {
        // Set your secret key. Remember to switch to your live secret key in production.
        // See your keys here: https://dashboard.stripe.com/apikeys
        $stripe = new \Stripe\StripeClient(config('stripe_test_sk'));

        $response = $stripe->checkout->sessions->create([
            'line_items' => [
                [
                'price_data' => [
                    'currency' => 'usd',
                    'product_data' => ['name' => 'T-shirt'],
                    'unit_amount' => 2000,
                ],
                'quantity' => 1,
                ],
            ],
            'automatic_tax' => ['enabled' => true],
            'mode' => 'payment',
            'success_url' => route('stripe_success'),
            'cancel_url' =>  route('stripe_cancel'),
        ]);

        dd($response);
    }

     public function success(Request $request)
    {
        
    }

     public function cancel()
    {
        
    }


}
