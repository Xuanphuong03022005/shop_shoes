<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SizeColor extends Model
{
    protected $fillable = [ 
        'color_id',
        'size_id'
       
    ];
    use HasFactory;
}
