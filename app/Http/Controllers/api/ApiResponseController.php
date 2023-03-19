<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Controllers\api\PostController;
use Illuminate\Http\Request;

class ApiResponseController extends Controller
{
    use ApiResponse;

    public function show(Post $post){
        $post->image;
        $post->category;
        return response()->json(array("data"=>$post,"code"=>200,"msj"=>'OK'));
    }
}
