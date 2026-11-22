<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Controller;
use App\Models\Api\V1\Food;

use Illuminate\Http\Request;

class FoodCategory extends Controller
{
    public function pizza_category(Request $request)
    {
        $food = new Food;

        $pizza = $food::where(["category" => "Pizza"])->get();

        $data = [
            'totalCount' => count($pizza),
            'products' => $pizza
        ];

        return response()->json($data, 200);
    }

    public function drink_category(Request $requets)
    {
        $foods = new Food;

        $drinks = $foods::where(['category'=>'drinks'])->get();

        $data = [
            'totalCount' => count($drinks),
            'products' => $drinks
        ];

        return response()->json($data, 200);
    }

    public function biryani_category(Request $request)
    {
        $food = new Food;

        $biryani = $food::where(['category'=>'biryani'])->get();

        $data = [
            'totalCount' => count($biryani),
            'products' => $biryani
        ];

        return response()->json($data, 200);
    }

    public  function burgers_category(Request $request)
    {
        $food = new Food;

        $burgers = $food::where(['category'=>'burger'])->get();

        $data = [
            'totalCount' => count($burgers),
            'products' => $burgers
        ];

        return response()->json($data, 200);
    }

    public function rolls_category(Request $request)
    {
        $food = new Food;

        $rolls = $food::where(['category'=>'Rolls'])->get();

        $data = [
            'totalCount' => count($rolls),
            'products' => $rolls
        ];

        return response()->json($data, 200);
    }

    public function chicken_category(Request $request)
    {
        $food = new Food;

        $chicken = $food::where(['category'=>'chicken'])->get();

        $data = [
            'totalCount'=>count($chicken),
            'products'=>$chicken
        ];

        return response()->json($data, 200);
    }
    public function thali_category(Request $request)
    {
        $food = new Food;

        $thali = $food::where(['category'=>'Thali'])->get();

        $data = [
            'totalCount'=>count($thali),
            'products'=>$thali
        ];

        return response()->json($data, 200);
    }

    public function momos_category(Request $requets)
    {
        $food = new Food;

        $momos = $food::where(['category'=>'Momos'])->get();

        $data = [
            'totalCount'=>count($momos),
            'products'=>$momos
        ];

        return response()->json($data, 200);
    }

    
    public function cake_category(Request $requets)
    {
        $food = new Food;

        $cake = $food::where(['category'=>'Cake'])->get();

        $data = [
            'totalCount'=>count($cake),
            'products'=>$cake
        ];

        return response()->json($data, 200);
    }

    
    public function noodles_category(Request $requets)
    {
        $food = new Food;

        $noodles = $food::where(['category'=>'Noodles'])->get();

        $data = [
            'totalCount'=>count($noodles),
            'products'=>$noodles
        ];

        return response()->json($data, 200);
    }

    public function dosa_category(Request $request)
    {
        $food = new Food;

        $dosa = $food::where(['category'=>'Dosa'])->get();

        $data = [
            'totalCount'=>count($dosa),
            'products'=>$dosa
        ];

        return response()->json($data, 200);
    }

    public function sandwich_category(Request $request)
    {
        $food = new Food;

        $sandwich = $food::where(['category'=>'Sandwich'])->get();

        $data = [
            'totalCount'=>count($sandwich),
            'products'=>$sandwich
        ];

        return response()->json($data, 200);
    }
      public function all_foods(Request $request)
    {
        $food = new Food;

        $alls = $food::all();

        $data = [
            'totalCount'=>count($alls),
            'products'=>$alls
        ];

        return response()->json($data, 200);
    }

    public function idli_category()
    {
        $food = new Food;

        $idli = $food::where(['category'=>'Idli'])->get();

        $data = [
            'totalCount'=>count($idli),
            'products'=>$idli
        ];

        return response()->json($data, 200);
    }
}
