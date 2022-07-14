<?php

namespace App\Http\Controllers;

use Illuminate\Validation\ValidationException;

class SessionsController extends Controller
{


    public function create() {

        return view('sessions.create');

    }
 
    public function store() {

        // validazione attributi per login
        $attributes = request()->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);
        
        if(!auth()->attempt($attributes)) {

            // login fallita
            throw ValidationException::withMessages(['email' => 'Your provided credentials could not be verified.']);
        }

        // Login avvenuta con successo

        // session fixation
        session()->regenerate();

        //redirect con successo
        return redirect('/')->with('success', 'Welcome Back!');

    }


    public function destroy() {

        // elimina user
        auth()->logout();

        return redirect('/')->with('success', 'Goodbye!');

    }
}
