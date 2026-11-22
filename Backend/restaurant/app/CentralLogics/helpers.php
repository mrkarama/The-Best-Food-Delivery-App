<?php

namespace App\CentralLogics;

use Illuminate\Support\Carbon;
use Illuminate\Support\Facages\Storage;
use App\Models\BusinessSetting;
use Illuminate\Support\Facages\DB;

class Helpers{
    public static function get_business_settings($name){
        $config = null;

        $paymentMethod =  'paypal' ;  //BusinessSetting::where('key', $name)->first();

        if($paymentMethod == 'paypal'){
            $config = ["status"=> "1",
                "paypal_client_id"=> "Ad-ebXtpZkNdfj2eG0dKErO54YIPtoGbjBuFcU3ISdd2qHTuFWX6BbbCfSC0LaYb8lWl3fKOMzc0zpXh",
                "paypal_secret_id" => "ENxgoEe07ZLXJ6OCimFZjAMqkJrm4PbpJF_3TDoyG8p6KbF_4lEkVJscA_45lSI7XQA6xrsJSko8LxCy"];
        }

        return $config;
    }

    public static function currency_code(){
        //return BusinessSetings::where(['key' => 'currency'])->first()->value;
        return 'USD';
    }
}