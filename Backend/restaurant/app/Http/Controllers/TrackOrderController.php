<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TrackOrder;
use App\Models\Order;

class TrackOrderController extends Controller
{
    public function track_order()
    {

        $track_order = TrackOrder::all();

        return response()->json([
            "data"=>$track_order
        ], 200);
    }
}
