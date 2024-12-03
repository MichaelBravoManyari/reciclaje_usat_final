<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckAdmin
{
    /**
     * Maneja una solicitud entrante.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    /* public function handle(Request $request, Closure $next)
    {
        if (Auth::check() && Auth::user()->usertype_id != 1) {
            return redirect()->route('accessDenied');
        }
        return $next($request);
    } */

    public function handle(Request $request, Closure $next)
    {
        if (Auth::check()) {
            if (Auth::user()->usertype_id === null) {
                return redirect()->route('newProfile');
            }
            
            if (Auth::user()->usertype_id != 1) {
                return redirect()->route('accessDenied');
            }
        }

        return $next($request);
    }
}
