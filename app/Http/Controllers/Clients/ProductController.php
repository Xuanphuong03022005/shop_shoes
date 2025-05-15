<?php

namespace App\Http\Controllers\Clients;

use App\Http\Controllers\Controller;
use App\Models\Image;
use App\Models\Product;
use App\Models\Size;
use App\Models\SizeColor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public  $url;
    public function __construct()
    {
        $this->url = config('app.url');
    }
    public function index()
    {
        $products = Product::leftJoin('feedback as f', 'products.id', '=', 'f.product_id')
            ->join(DB::raw('(SELECT path, product_id FROM images) as i'), 'products.id', 'i.product_id')
            ->leftJoin(DB::raw('(SELECT product_id, quantity  From order_details) as od'), 'products.id', 'od.product_id')
            ->where('is_published', 1)
            ->where('is_new', 1)
            ->groupBy(
                'products.id',
                'products.name',
            )
            ->select('products.name', 'products.id', DB::raw("CONCAT(' $this->url/',i.path) as image"), DB::raw('ROUND(COALESCE(AVG(f.rating), 0)) as rating_count'),  DB::raw('COALESCE(SUM(od.quantity) ,0)as quantity_sold'))
            ->limit(8)
            ->get();
        return response()->json([
            'value' =>  $products
        ]);
    }
    public function show($id)
    {
        $product = Product::join('brands as b', 'products.brand_id', 'b.id')
            ->join('origins as o', 'products.origin_id', 'o.id')
            ->join('genders as g', 'products.gender_id', 'g.id')
            ->join('categories as c', 'products.category_id', 'c.id')
            ->where('products.id', $id)
            ->where('is_published', 1)
            ->select('products.id', 'products.name', 'products.description', 'b.name as brand_name', 'o.name as origin_name', 'g.sex as gender_name', 'c.name as category_name')
            ->first();
        $sizes = Size::where('product_id', $id)
            ->get();
        $images = Image::where('product_id', $id)
            ->select(DB::raw("CONCAT('$this->url/', images.path) as path"))
            ->get();
        $arrayColor =  [];
        foreach ($sizes as $key => $value) {
            $size_colors = SizeColor::where('size_id', $value['id'])
                ->join('colors as c', 'size_colors.color_id', 'c.id')
                ->select('c.name as name_color', 'size_colors.color_id as id_color')
                ->get();
            foreach ($size_colors as $key => $value) {
                $exit = array_filter($arrayColor, function ($item) use ($value) {
                    return $item['id'] == $value['id_color'];
                });
                if (empty($exit)) {
                    $arrayColor[] = [
                        'id' =>  $value['id_color'],
                        'name' =>  $value['name_color'],
                    ];
                }
            }
        }
        return response()->json([
            'product' =>  $product,
            'sizes' =>  $sizes,
            'images' =>  $images,
            'color' =>  $arrayColor,
        ]);
    }
}
