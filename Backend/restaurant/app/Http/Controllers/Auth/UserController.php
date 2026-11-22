<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\UserRegisterRequest;
use App\Http\Requests\UserLoginRequest;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\DeliveryAddress;

class UserController extends Controller
{
    public function register(UserRegisterRequest $request){

        $user = User::create([
            'name' => $request->name,
            'email'=> $request->email,
            'password'=> Hash::make($request->password),
            'phone'=> $request->phone,
        ]);

        $token = $user->createToken('userToken')->plainTextToken;

        $data = [
            'user'=> $user,
            'token' => $token,
        ];

        return response()->json($data, 200);
    }

    public function login(UserLoginRequest $request){
        $data = [
            'email' => $request->email,
            'password' => $request->password,
        ];

        if(auth()->attempt($data)){
            $token = auth()->user()->createToken('UserToken')->plainTextToken;
            return response()->json(['token'=>$token], 200);
        } else{
            return response()->json(['error'=>'Unauthorized'], 403);
        }
    }

    public function userEntities(Request $request){
        $data = $request->user();
        $data['order_count'] = 0;

        return response()->json($data, 200);
    }

    public function UserAddress(Request $request){
        $validator = Validator::make($request->all(),
        [
            "address"=>'required',
            "address_type"=>"required",
            "contact_person_name"=>"required",
            "contact_person_number"=>"required"
        ]);

        if ($validator->fails()){
            return response()->json([
                "error"=> "Field(s) missing. address, address_type, contact_person_name and contact_person_number are required.",
            ], 403);
        }

        $address =  [
            'user_id'=> $request->user()->id,
            'contact_person_name'=>$request['contact_person_name'],
            'contact_person_number'=>$request['contact_person_number'],
            'address'=>$request['address'],
            'address_type'=>$request['address_type'],
            'latitude'=>$request['latitude'],
            'longitude'=>$request['longitude'],
            'created_at'=>now(),
            'updated_at'=>now()
        ];

        DB::table('delivery_addresses')->insert($address);

        return response()->json([
            'message'=>"Address saved successfully"
        ], 200);
    }

    public function UserAddressData(Request $request)
    {
        $address = DeliveryAddress::where(['user_id'=>$request->user()->id])->orderBy('created_at', 'desc')->first();

        return response()->json([
            "address" => $address
        ], 200);
    }
    
}
