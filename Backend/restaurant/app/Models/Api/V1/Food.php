<?php

namespace App\Models\Api\V1;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Food extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'category',
        'image',
        'price',
        'rating'
    ];


    public function user(){
        return $this->belongsTo(User::class);
    }
}
