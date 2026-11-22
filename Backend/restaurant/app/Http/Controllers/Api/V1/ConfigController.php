<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Http;

class ConfigController extends Controller
{
    public function getGeocodeApi(Request $request){
        $validators = Validator::make($request -> all(), [
            'lat' => 'required',
            'lng' => 'required'
        ]);

        if($validators -> fails()){
            return response() -> json(['error' => 'The latitude or longitude field is required.']);
        }

        $response = Http::get('https://maps.googleapis.com/maps/api/geocode/json?latlng='.$request->lat.', '.$request->lng.'&key=AIzaSyBUqbbPVlTTiTqKcmhTWTGWD46tatW-UJM');
        

        return $response -> json();
    }
}
