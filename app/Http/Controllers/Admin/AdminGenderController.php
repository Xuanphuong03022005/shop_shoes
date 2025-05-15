<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gender;
use Illuminate\Http\Request;

class AdminGenderController extends Controller
{
    public function index()
    {
        $genders = Gender::all();
        return response()->json([
            'value' => $genders
        ], 200);
    }
}
