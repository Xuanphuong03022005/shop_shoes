<?php

namespace App\Http\Controllers;
use App\Http\Constant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $admin = Constant::ADMIN;
        $data = $request->all();
        $email = $data['user_name'];
        $password = $data['password'];
        if(Auth::attempt(['email' => $email,  'password' => $password]) || 
        Auth::attempt(['user_name' => $email,  'password' => $password])){
            if(Auth::user()->role_id == $admin)
            {
                return response()->json([
                    'role' => 'admin'
                ], 200);
            }else
            {
                return response()->json([
                    'role' => 'user',
                    'role_m' => Auth::user()->role_id
                ], 200);
            }
            
        }else{
            return response()->json([
                'message' => 'Đăng nhập không thành công'
            ], 401);
        }
    }
}
