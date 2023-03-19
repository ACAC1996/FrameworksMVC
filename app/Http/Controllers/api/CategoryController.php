<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Traits\ApiResponse;
use App\Http\Controllers\api\ApiResponseController;

class CategoryController extends Controller
{
    public function all(){
        return $this->successResponse(Category::all());
    }

    public function index(){
        
        return $this->successResponse(Category::paginate(10));
    }

    
}