<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use App\Models\Api\V1\Food;
use App\Models\OrderDetail;
use App\Models\Order;
use Illuminate\Support\Facades\Validator;
use App\Models\TrackOrder;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function place_order(Request $request){
        $validator = Validator::make($request->all(), [
            'order_amount'=> 'required',
            'address'=> 'required_if:payment_method, cash_on_delivery',
            'cart' => 'required',
            'payment_method' => 'required',
            'delivery_options' => 'required',
            'delivery_charge' => 'required',
        ],
        // [
        //     'order_amount.required' => 'order_amount',
        //     'address.required' => 'address',
        //     'cart.required' => 'cart',
        //     'order_note.required' => 'order_note',
        //     'payment_method.required' => 'payment_method',
        //     'delivery_options.required' => 'delivery_options',
        //     'delivery_charge.required' => 'delivery_charge,'
        // ]
    );

        if($validator->fails()){
            $error = [
                'error'=> 'Invalid field entry',
                'message'=> 'Enter valid field values'
            ];
            return response()->json($error);
        }

        $address = [
            'contact_person_name' => $request->contact_person_name ? $request->contact_person_name : $request->user()->name,
            'contact_person_number' => $request->contact_person_number ?  $request->contact_person_number :$request->user()->phone,
            'address' => $request->address,
            'longitude' => $request->longitude,
            'latitude' => $request->latitude,
        ];

        $product_price = 0;

        $order = new Order();
        $order->id = 100000 + Order::all()->count()+1; // transaction ID
        $order->user_id = $request->user()->id;
        $order->order_amount = $request['order_amount'];
        $order->order_note = $request['order_note'];
        $order->delivery_address = json_encode($address);
        $order->delivered = $request->delivered;
        $order->otp = rand(1000, 9999);
        $order->pending = now();
        $order->created_at = now();
        $order->updated_at = now();
        $order->delivery_options = $request->delivery_options;
        $order->delivery_charge = $request->delivery_charge;

        if ($request->payment_method == 'cash_on_delivery'){
            $order->payment_method = 'cash_on_delivery';
            $order->order_status = 'accepted';
            $order->payment_status = 'unpaid';
            $order->failed = now();
            $order->updated_at = now();


            
            // Track Order

            $track_order = [
                'order_id'=> $order->id,
                'order_placed'=>true,
                'order_confirmed'=>false,
                'order_shipped'=>false,
                'order_delivered'=>false,
                'created_at'=>now(),
                'updated_at'=>now()
            ];

            DB::table('track_orders')->insert($track_order);
        }

        foreach($request['cart'] as $cart){
            $product =  Food::find($cart['id']);   //Food::where(array("id" => $cart['id']))->get();

            if($product){
                $price = $product['price'];

                $order_det = [
                    'food_id' => $cart['id'],
                    'food_details' => json_encode($product),
                    'quantity' => $cart['quantity'],
                    'price' => $price,
                    'created_at' => now(),
                    'updated_at' => now(),
                    'tax_amount' => 10.0,
                ];

                $product_price = $price * $order_det['quantity'];
                $order_details[] = $order_det;
            } else{
                $error = [
                    'errors' => [
                        'code' => 'food',
                        'message' => 'not found !',
                    ],
                ];
                return response() -> json($error, 402);
            }
        }

        try{
            
            $order_id = $order->id;
            $order_amount = $product_price;
            $order->save();

            foreach($order_details as $key => $item){
                $order_details[$key]['order_id'] = $order_id;
            }



            OrderDetail::insert($order_details);

            $data = [
                'message' => 'Order placed successfully !',
                'order_id' => $order_id,
                'total_amount' => $product_price,
            ];

            return response() -> json($data, 200);
        } catch(\Exception $e){
            return response()->json([$e], 403);
        }

        $data = [
            'errors'=> [
                'code' => 'order_time',
                'message' => 'Failed to place the order !',
            ],
        ];

        return response() -> json($data, 403);
    }

    public function get_order_data(Request $request){
        $orders = Order::withCount('details')
        ->where(['user_id' => $request->user()->id])
        ->get()->map(function($data){
            $data['delevery_address'] = $data['delivery_address'] ? 
            json_decode($data['delivery_address']) : 
            $data['delivery_address'];

            return $data;
        });

        return response()->json($orders, 200);
    }
}
