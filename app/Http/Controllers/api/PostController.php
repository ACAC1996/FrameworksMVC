<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Traits\ApiResponse;
use App\Http\Controllers\api\ApiResponseController;

class PostController extends Controller
{
    public function index(){
        $posts=Post::
            join('post_images','post_images.post_id','=','posts.id')->
            join('categories','categories.id','=','posts.category_id')->
            select('posts.*','categories.name as category','post_images.image')->
            orderBy('created_at','desc')->paginate(1);
        return response()->json($posts,200);
    }

    public function show(Post $post){
        $post->image;
        $post->category;
        return response()->json($post);
    }

    public function category(Category $category){
        return response()->json(["posts"=>$category->post()->paginate(10),"category"=>$category]);
    }

    public function description(String $description){
        $post=Post::where('description',$description)->get();
        $post->image;
        $post->category;
        return response()->json($post);
    }
}
