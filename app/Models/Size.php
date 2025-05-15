<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Size extends Model
{
    use HasFactory;
    protected $fillable = [ 
    'product_id',
    'number_size',
    'list_price',
    'sale_price',
    'quantity'
];
}
