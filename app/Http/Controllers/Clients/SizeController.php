<?php

namespace App\Http\Controllers\Clients;

use App\Http\Controllers\Controller;
use App\Models\Size;
use App\Models\SizeColor;
use Illuminate\Http\Request;

class SizeController extends Controller
{
    public function show($id)
    {
        $size = SizeColor::where('size_id', $id)
            ->join('colors as c', 'size_colors.color_id', 'c.id')
            ->join('sizes as s', 'size_colors.size_id', 's.id')
            ->select('c.id as id', 'c.name as name', 's.list_price as list_price', 's.sale_price as sale_price')
            ->get();
        return response()->json([
            'value' => $size
        ]);
    }
}
