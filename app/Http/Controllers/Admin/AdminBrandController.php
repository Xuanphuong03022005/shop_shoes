<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Exception;
use Illuminate\Http\Request;

class AdminBrandController extends Controller
{
    public function index()
    {
        $brand = Brand::all();
        return response()->json([
            'value' => $brand
        ], 200);
    }
    public function store(Request $request)
    {
        $name = $request->input('name');
        $brand_search = Brand::where('name', $name)->exists();
        if ($brand_search) {
            return response()->json([
                'message' => 'Màu đã tồn tại'
            ], 500);
        }
        $brand = Brand::create([
            'name' => $name
        ]);
        if ($brand) {
            return response()->json([
                'message' => 'Thêm màu: ' . $name . ' thành công.'
            ], 200);
        } else {
            return response()->json([
                'message' => 'Thêm màu không thành công.'
            ], 500);
        }
    }
    public function destroy($id)
    {
        try {
            $brand = Brand::find($id);
            if (!$brand) {
                return response()->json([
                    'message' => 'Không tìm thấy màu này.'
                ], 404);
            }
            $brand->delete();
            return response()->json([
                'message' => 'Xoá thành công.'
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'message' => 'Xoá không thành công.'
            ], 500);
        }
    }
}
