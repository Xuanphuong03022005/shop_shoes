<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Origin;
use Exception;

class AdminOriginController extends Controller
{
    public function index()
    {
        $origin = Origin::all();
        return response()->json([
            'value' => $origin
        ], 200);
    }
    public function store(Request $request)
    {
        $name = $request->input('name');
        $originSearch = Origin::where('name', $name)->exists();
        if ($originSearch) {
            return response()->json([
                'message' => 'Mục xuất xứ đã tồn tại'
            ], 500);
        }
        $origin = Origin::create([
            'name' => $name
        ]);
        if ($origin) {
            return response()->json([
                'message' => 'Thêm xuất xứ : ' . $name . ' thành công.'
            ], 200);
        } else {
            return response()->json([
                'message' => 'Thêm xuất xứ không thành công.'
            ], 500);
        }
    }
    public function destroy($id)
    {
        try {
            $origin = Origin::find($id);
            if (!$origin) {
                return response()->json([
                    'message' => 'Không tìm thấy bản ghi này.'
                ], 404);
            }
            $origin->delete();
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
