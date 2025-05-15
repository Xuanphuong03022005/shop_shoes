<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Color;
use Exception;
use Illuminate\Http\Request;

class AdminColorController extends Controller
{
    public function index()
    {
        $color = Color::all();
        return response()->json([
            'value' => $color
        ], 200);
    }
    public function store(Request $request)
    {
        $name = $request->input('name');
        $color_search = Color::where('name', $name)->exists();
        if ($color_search) {
            return response()->json([
                'message' => 'Màu :đã tồn tại'
            ], 500);
        }
        $color = Color::create([
            'name' => $name
        ]);
        if ($color) {
            return response()->json([
                'message' => 'Thêm màu : ' . $name . ' thành công.'
            ], 200);
        } else {
            return response()->json([
                'message' => 'Thêm màu :không thành công.'
            ], 500);
        }
    }
    public function destroy($id)
    {
        try {
            $color = Color::find($id);
            if (!$color) {
                return response()->json([
                    'message' => 'Không tìm thấy màu này.'
                ], 404);
            }
            $color->delete();
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
