<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\Stars;
class WelcomeController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function welcome()
    {
        $user = Auth::user();

        if ($user) {
            $stars = Stars::select('id', 'first_name as firstName','last_name as lastName', 'description', 'thumbnail', 'created_at')
                ->orderBy('created_at','desc')
                ->get()
                ->all();

            $data = [
                'stars' => $stars,
            ];

            return view('pages.user.home')->with($data);
        } else {
            return view('auth.login');
        }
        
    }
}
