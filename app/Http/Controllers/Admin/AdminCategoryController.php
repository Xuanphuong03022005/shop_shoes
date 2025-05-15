<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use  App\Models\Category;
use Exception;

class AdminCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        return response()->json([
            'value' => $categories
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
       
        $name = $request->input('name');
        $category_search = Category::where('name', $name)->exists();
        if($category_search){
            return response()->json([
                'message' => 'Mục phân loại đã tồn tại'
            ], 500);
        }
        $category = Category::create([
            'name' => $name
        ]);
        if( $category){
            return response()->json([
                'message' => 'Thêm phân loại : '. $name .' thành công.'
            ], 200);
        }else{
            return response()->json([
                'message' => 'Thêm phân loại không thành công.'
            ],500);
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $category = Category::find($id);
            if(!$category){
                return response()->json([
                    'message' => 'Không tìm thấy bản ghi này.'
                ],404);
            }
            $category->delete();
            return response()->json([
                'message' => 'Xoá thành công.'
            ],200);
        }catch(Exception $e){
            return response()->json([
                'message' => 'Xoá không thành công.'
            ],500);
        }
    }
}
