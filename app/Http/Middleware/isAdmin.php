<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Constant;

class isAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $admin = Constant::ADMIN;
        dd($admin);
        if(Auth::check()){
            if(Auth::user()->role == $admin){
                return $next($request);
            }else{
                return response()->json([
                    'message' => "Không phải là admin"
                ], 403); 
            }
        }else{
            return response()->json([
                'message' => "Chưa đăng nhập"
            ], 401); 
        }
    }
}
