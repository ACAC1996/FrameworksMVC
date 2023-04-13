<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class webController extends Controller
{
    public function index(){
        return view('web.index');
    }    

    public function detail(){
        return view('web.index');
    }

    public function post-category(){
        return view('web.index');
    }

    public function contact(){
        return view('web.index');
    }
}
