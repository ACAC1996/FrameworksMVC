<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Rol;
use App\Http\Controllers\User;
use App\Http\Controllers\Requests\StoreUserPost;

class ValidarRolAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next)
    {
        if(auth()->user()->rol_id==1){
            return $next($request);
        }
        return redirect('/');
    }
}
