<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\OrderDetail;
use App\Models\User;
use App\Models\TrackOrder;

class Order extends Model
{
    use HasFactory;

    public function details(){
        return $this->hasMany(OrderDetail::class);
    }
    
    public function user(){
        return $this->hasMany(User::class);
    }

    public function track_orders(){
        return $this->hasMany(TackOrder::class);
    }
}
