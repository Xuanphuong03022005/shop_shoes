<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
   protected $fillable = [  'origin_id', 
                            'category_id',
                            'brand_id',
                            'gender_id',
                            'name',
                            'description',
                            'is_published'
                        ];
    use HasFactory, SoftDeletes;
}
