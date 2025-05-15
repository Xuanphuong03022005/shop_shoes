<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateUserRequest;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\UserRole;
use App\Http\Constans;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
    }


    public function store(CreateUserRequest $request)
    { 
      
        $data = $request->all();
        $password = Hash::make($data['password']);
        $birthday = date('d-m-Y', strToTime($data['birthday']));
        $nameUser =  $data['full_name'];
        if($request->avatar != ""){
            $image = $request->file('avatar');
            $nameImage = time().'-'.$nameUser.'-'. $image->getClientOriginalName();
            $success = $image->storeAs('images', $nameImage, 'public');
            if(!$success){
                return response()->json([
                    'message' => 'Lưu ảnh thất bại'
                ], 500);
            }
        }else{
            $nameImage = null;
        }
      
      DB::beginTransaction();
     
      try{
        $user = User::create([
            'user_name' =>  $data['user_name'],
            'name' =>  $data['full_name'],
            'phone' =>  $data['phone'],
            'birthday' => $birthday,
            'address' =>  $data['address'],
            'avatar' =>  $nameImage,
            'password' =>  $password ,
            'email' =>  $data['email'],
        ]);
        $user->refresh();
        DB::commit();
        $roleId = $user->role_id;
        $user_id = $user->id;
        $role = UserRole::create([
            'user_id' =>  $user_id,
            'role_id' =>  $roleId
        ]);
        DB::commit();
        return response()->json([
            'message' => 'Lưu thông tin thành công'
        ], 200);
      }catch(Exception $e){
        DB::rollBack();
        return response()->json([
            'message' => 'Lưu thông tin thất bại'
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
        //
    }
}
