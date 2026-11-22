<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryAddress extends Model
{
    use HasFactory;

    protected $fillable = [
        "contact_person_name",
        "contact_person_number",
        "address",
        "address_type",
        "latitude",
        "longitude",
        "user_id"
    ];
}
