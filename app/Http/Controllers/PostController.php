<?php

namespace App\Http\Controllers;

use App\Rol;
use App\Models\Post;
use App\Models\Category;
use App\Models\Reply;
use App\Models\User;
use Illuminate\Http\Request;

/**
 * Class PostController
 * @package App\Http\Controllers
 */
class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::orderBy('created_at','desc')->paginate(5);

        return view('post.index', compact('posts'))
            ->with('i', (request()->input('page', 1) - 1) * $posts->perPage());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $post = new Post();
        $categories=Category::pluck('name','id');
        $users=User::pluck('name','id');
        return view('post.create', compact('post','categories','users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        request()->validate(Post::$rules);

        $post = Post::create($request->all());

        return redirect()->route('posts.index')
            ->with('success', 'Post created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::find($id);

        return view('post.show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        
        $post = Post::find($id);
        $categories=Category::pluck('name','id');
        $users=User::pluck('name','id');
        $replies=Reply::pluck('respuesta','id');
        return view('post.edit', compact('post','categories','users'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  Post $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        request()->validate(Post::$rules);

        $post->update($request->all());

        return redirect()->route('posts.index')
            ->with('success', 'Post updated successfully');
    }

    /**
     * @param int $id
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception
     */
    public function destroy($id)
    {
        $post = Post::find($id)->delete();

        return redirect()->route('posts.index')
            ->with('success', 'Post deleted successfully');
    }

    public function image(Request $request, Post $post){
        $request->validate([
            'image' => 'required|mimes:jpeg,bmp,png|max:10240',
        ]);
        $filename=time() . "." . $request->image->extension();
        $request->image->move(public_path('images'),$filename);
        echo "Subio la imagen".$filename;
        PostImage::create(['image'=>$filename,'post_id'=>$post->id]);
        return back()->with('status','Imagen cargada con exito');
    }

    public function __construct(){
        $this->middleware(['auth','rol.admin']);
    }
}
