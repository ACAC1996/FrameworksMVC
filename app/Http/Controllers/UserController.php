<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Rol;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     * 
     * @return \Illuminate\Http\Response
     */

     public function __construct(){
        $this->middleware(['auth','rol.admin']);
     }

     public function index(){
        $users=User::orderBy('created_at','desc')->paginate(10);
        return view('user.index', compact('users'))
            ->with('i', (request()->input('page', 1) - 1) * $users->perPage());
     }

     public function create(){
        $user = new User();
        $rols=Rol::pluck('key','id');
        return view('user.create', compact('user','rols'));
     }

     /**
      * 
      *@param \Illuminate\Http\Request $request
      *@return \Illuminate\Http\Response
      */
      public function store(Request $request){

        $user = User::create([
            'name'=>$request['name'],
            'rol_id'=>$request['rol_id'],
            'nickname'=>$request['nickname'],
            'email'=>$request['email'],
            'password' => Hash::make($request['password']),    
        ]);

        return redirect()->route('users.index')
            ->with('success', 'Usuario creado con exito.');
        /*User::create(
            [
                'name'=>$request['name'],
                'rol_id'=>1,
                'nickname'=>$request['nickname'],
                'email'=>$request['email'],
                'password' => Hash::make($request['password']),    
            ]
            );
            return back()->with('status','Usuario creado con exito');*/
      }

        /**
         * Display the specified resource.
         *
         * @param  int $id
         * @return \Illuminate\Http\Response
         */
        public function show($id)
        {
            $user = User::find($id);

            return view('users.show', compact('user'));
        }

      public function update(UpdateUserPut $request, User $user){
        $user->update(
            [
                'name'=>$request['name'],
                'nickname'=>$request['nickname'],
                'email'=>$request['email'],
            ]
        );
        return back()->with('status','Usuario actualizado con exito');
      }
}
