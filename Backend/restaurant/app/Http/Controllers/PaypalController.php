<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Srmklive\PayPal\Services\PayPal as PayPalClient;
use App\Models\Order;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Models\TrackOrder;

class PaypalController extends Controller
{

    // The Payment starts here: http://127.0.1.1:8000/payment-mobile?customer_id=1&order_id=100001
    public function startPayment(Request $request)
    {
        session()->put('customer_id', $request['customer_id']);
       
        session()->put('order_id', $request->order_id);

        $customer = User::find($request['customer_id']);
        session()->put('name', $customer['name']);
        
        $order = Order::where(['id' => $request->order_id, 'user_id' => $request['customer_id']])->first();
        
        if (isset($customer) && isset($order)) {
            $data = [
                'name' => $customer['f_name'],
                'email' => $customer['email'],
                'phone' => $customer['phone'],
            ];
            session()->put('data', $data);
            return view('paypal-payment-view');
        }

        return response()->json(['errors' => ['code' => 'order-payment', 'message' => 'Data not found']], 403);
    }


    // The view starts here
    public function payment(Request $request)
    {
        
        $order = Order::with(['details'])->where(['id' => session('order_id')])->first();
 
        $transaction_reference = Str::random(6) . '-' . rand(1, 1000); // For number rand(1000000, 9999999);

        $provider = new PayPalClient;

        $paypalToken = $provider->getAccessToken();
        
        $provider->setApiCredentials(config('paypal'));

        $response = [
            "intent"=> "CAPTURE",
            "application_context"=> [
                "return_url"=> route('paypal_success'),
                "cancel_url"=> route('paypal_cancel')
            ],

            "purchase_units"=> [
                [
                    "amount"=> [
                    "currency_code"=> "USD",
                    "value"=> $order->order_amount,
                    ]
                ]
            ]           
        ];

        $response = $provider->createOrder($response);

        if(isset($response['id']) && $response['id'] != null){
            try {
    
                foreach ($response['links'] as $link) {
                
                    if ($link['rel'] == 'approve') {
                    
                        $redirectUrl = $link['href'];
                    
                        break;
                    }
        
                }
        
                DB::table('orders')
                    ->where('id', $order->id)
                    ->update([
                        'transaction_reference' => $transaction_reference,
                        'payment_method' => 'paypal',
                        'order_status' => 'success',
                        'failed' => now(),
                        'updated_at' => now()
                ]);
       
                Session::put('paypal_payment_id', $transaction_reference);
             
                if (isset($redirectUrl)) {
                    return redirect()->away($redirectUrl);
                }else{
                    dd("bye");
                }

            } catch (\Exception $ex) {
                return back();
            }

            return back();
        } else{
            return redirect()->route('paypal_cancel');
        }
        
    }


    // On success payment
    public function success(Request $request)
    {
        $provider = new PayPalClient;
        $provider->setApiCredentials(config('paypal'));
        $paypalToken = $provider->getAccessToken();
        
        $userToken = $request->token;
        $response = $provider->capturePaymentOrder($userToken);

        //dd($response);
        if(isset($response['status']) && $response['status'] == 'COMPLETED'){

            $payment_id = Session::get('paypal_payment_id');

            
            $order = Order::where('transaction_reference', $payment_id)->first();
        

            $order->transaction_reference = $payment_id;
            $order->payment_method = 'paypal';
            $order->payment_status = 'paid';
            $order->order_status = 'confirmed';
            $order->confirmed = now();
            $order->save();
            

            // Track Order

            $track_order = [
                'order_id'=> $order->id,
                'order_placed'=>true,
                'order_confirmed'=>true,
                'order_shipped'=>false,
                'order_delivered'=>false
            ];

            DB::table('track_orders')->insert($track_order);
            
            $data = [
                'status' => 'SUCCESS',
                'message' => 'Order success !'
            ];

            return response()->json($data);

        } else{
            $order->order_status = 'failed';
            $order->failed = now();
            $order->save();

            $data = [
                'status' => 'FAIL',
                'message' => 'Order failed !'
            ];

            return response()->json($data);
        }
   
    }


    // On payment failure
    public function cancel()
    {
        $data = [
            'status' => 'FAIL',
            'message' => 'Order failed !'
        ];

        return response()->json($data);
    }

}
