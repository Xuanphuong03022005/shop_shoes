<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Image;
use App\Models\Size;
use App\Models\SizeColor;
use Exception;
use Illuminate\Support\Facades\DB;

class AdminProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $url = config('app.url');
        $products = Product::select('total_size', 'total_image', DB::raw("CONCAT('$url/',i_t.path_first) as path"), DB::raw('DATE_FORMAT(products.deleted_at, "%d-%m-%Y") as deleted_at_new'),  'products.*')
            ->join(DB::raw('(SELECT product_id, COUNT(number_size) as total_size from sizes GROUP BY product_id) as s'), 'products.id', 's.product_id')
            ->join(DB::raw('(SELECT product_id, COUNT(path) as total_image FROM images GROUP BY product_id ) as i'), 'products.id', 'i.product_id')
            ->join(DB::raw('(SELECT i_f.product_id, i_f.path as path_first FROM images as i_f 
                                    JOIN (SELECT product_id, MIN(id) as id_min FROM images
                                    GROUP BY product_id)  as i_min  
                                    ON i_f.id = i_min.id_min) as i_t'), 'products.id', 'i_t.product_id')
            ->withTrashed()
            ->get();
        return response()->json([
            'value' =>  $products
        ], 200);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      
        $data = $request->all();
        $image = $request->file('image');
        $name = $data['name'];
        $arraySize = [];
        $arrayPathImage = [];
        foreach ($image as $key => $value) {
            $nameImageFile = $value->getClientOriginalName();
            $nameImage = time() . '-' . $name . '-' . $nameImageFile;
            $success = $value->storeAs('images', $nameImage, 'public');
           
            if (!$success) {
                return response()->json([
                    'message' => 'Save image fail'
                ], 500);
            }
            $path = "storage/$success";
            $arrayPathImage[] = $path;
        }
        foreach ($data['size'] as $value) {
            $array = json_decode($value, true);
            if ($array) {
                $arraySize[] = $array;
            }
        }
        try {
           
            DB::beginTransaction();
            $product = Product::create([
                'origin_id' => $data['origin'],
                'category_id' => $data['category'],
                'brand_id' => $data['brand'],
                'gender_id' => $data['gender'],
                'name' => $data['name'],
                'description' => $data['description'],
                'is_published' => $data['sold']
            ]);
            foreach ($arrayPathImage as $key => $value) {
                $image = Image::create([
                    'path' => $value,
                    'product_id' => $product->id
                ]);
            }
            foreach ($arraySize as $key => $value) {
                $size = Size::create([
                    'product_id' => $product->id,
                    'number_size' => $value['size'],
                    'list_price' => $value['price'],
                    'quantity' => $value['quantity'],
                ]);
                foreach ($value['color'] as $key => $value) {
                    $sizeColor = SizeColor::create([
                        'size_id' =>  $size->id,
                        'color_id' => $value['id']
                    ]);
                }
            }
            DB::commit();
            return response()->json([
                'message' =>  'Create Successful Product '
            ], 200);
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' =>  'Create Product Fail'
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $url = config('app.url');
        $product = Product::find($id);
        $images = Image::where('product_id', $id)
            ->select(DB::raw("CONCAT('$url/',path) as path"))
            ->get();
        $sizes = Size::select('sizes.*', 'size_color_t.nameC', 'size_color_t.idC as id_color')
        ->join(DB::raw('(SELECT sc.size_id as idS,  sc.color_id as idC, c.name as nameC  FROM size_colors as sc
            JOIN colors as c ON sc.color_id = c.id
            ) as size_color_t' ),
                'sizes.id' , 'size_color_t.idS'
        )
        ->where('sizes.product_id', $id)
        ->get();
    
            return response()->json([
                'sizes' =>   $sizes,
                'images' =>   $images,
                'product' =>   $product,
            ], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //sản phẩm
        try{
            $data = $request->all();
        $product = Product::find($id);
        if(!$product){
            return response()->json([
                'message' => 'Product Not Found'
            ], 500);
        }
        $product->update([
            'origin_id' =>  $data['origin'], 
            'category_id'=>  $data['category'], 
            'brand_id'=>  $data['brand'], 
            'gender_id'=>  $data['gender'], 
            'name'=>  $data['name'], 
            'description'=>  $data['description'], 
            'is_published' =>  $data['sold'], 
        ]);
        //size
        foreach ($data['size'] as $key =>  $value) {
            $array = json_decode($value, true);
            if ($array) {
                $size = Size::where('product_id', $id)->where('number_size', $array['size'])->first();
                if($size){
                    $size->update([
                        'product_id'=>  $id,
                        'number_size'=>  $array['size'],
                        'list_price'=>  $array['price'],
                        'quantity' =>  $array['quantity'] 
                    ]);
                    $size_color = SizeColor::where('size_id', $size->id)->get();
                    $lengthSize = count($size_color);
                    foreach($array['color'] as $key => $itemColor){
                       if($key < $lengthSize){
                        $exit = SizeColor::find($size_color[$key]['id']);
                            if($exit){
                                $exit->update([
                                    'color_id' => $itemColor['id']
                                ]);
                            }
                        }else{
                            $sizeColor = SizeColor::create([
                                'size_id' =>  $size->id,   
                                'color_id' => $itemColor['id']
                            ]);
                        }
                    }
                    for($i = count($array['color']) ; $i < $lengthSize; $i++){
                        $sizeColorDelete = SizeColor::find($size_color[$i]['id']);
                        $sizeColorDelete->delete();
                    }
                }else{
                    $sizeCreate = Size::create([
                        'product_id'=>  $id,
                        'number_size'=>  $array['size'],
                        'list_price'=>  $array['price'],
                        'quantity' =>  $array['quantity'] 
                    ]);
                    foreach ($array['color'] as $key => $item) {
                        $sizeColor = SizeColor::create([
                            'size_id' =>  $sizeCreate->id,   
                            'color_id' => $item['id']
                        ]);
                    }
                }
            }
        }
        $arraysizeF = [];
        $sizeDB = Size::where('product_id', $id)->pluck('number_size')->toArray();
        foreach($data['size'] as $key =>$value){
            $arraySize = json_decode($value, true);
            $arraysizeF[] =  $arraySize;
        }
        $idSize = array_column($arraysizeF, 'size');
        $arrayDelete = array_diff($sizeDB, $idSize);
        $DeleteSize = Size::where('product_id', $id)->whereIn('number_size', $arrayDelete)->delete();
        //ảnh
        $images =  $data['image'];
        $name =  $data['name'];
        $arrayImage = [];
        foreach ($images as $key => $value) {
            if($request->hasFile('image.' . $key)){
                $file = $request->file('image.' . $key);
                $nameImageFile = $value->getClientOriginalName();
                $nameImage = time() . '-' . $name . '-' . $nameImageFile;
                $success = $value->storeAs('images', $nameImage, 'public');
                if (!$success) {
                    return response()->json([
                        'message' => 'Save image fail'
                    ], 500);
                }
                $path = "storage/$success";
                $arrayImage[] = $path;
            }else{
                $image = json_decode($value,true);
                $substr = substr($image['name'], 18);
                $arrayImage[] =$substr;
            }
           
        }
        $imageDB = Image::where('product_id', $id)
        ->get();
        foreach($arrayImage as $key => $value){
            if($key < count($imageDB)){
                $imageUpdate = Image::find($imageDB[$key]['id']);
                if($imageUpdate){
                    $imageUpdate->update([
                        'path' => $value
                    ]);
                }
            }else{
                $image = Image::create([
                    'path' => $value,
                    'product_id' => $id
                ]);
            }
        }
        $lengthImage = count($arrayImage);
        for($i = $lengthImage; $i < count($imageDB); $i ++){
             $id = $imageDB[$i]['id'];
             $imageDelete = Image::find($id);
             $imageDelete->delete();
        }
        return response()->json([
            'message' =>  'Update success product',
        ], 200);
        }catch(Exception $e){
             return response()->json([
            'error' =>  'Update fail',
        ], 5000);
        }
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'message' =>  'Not Found Product Or Product Already Delete'
            ], 500);
        }
        $success = $product->delete();
        if (!$success) {
            return response()->json([
                'message' =>  'Delete Product Fail'
            ], 500);
        }
        $value = $product->deleted_at;
        $deleted = date('d-m-Y', strToTime($value));
        return response()->json([
            'message' =>  'Delete Product Success',
            'value' => $deleted
        ], 200);
    }
}
