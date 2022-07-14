<?php

namespace App\Http\Controllers;

use App\Models\User;



class RegisterController extends Controller
{
   
    public function create() {

        return view('register.create');

    }

    public function store() {

        // sistema di validazione

        $attributes = request()->validate([
            'name' => 'required|min:3|max:100',
            //'username' => ['required', 'min:3', 'max:100', Rule::unique('users', 'username')],
            'username' => 'required|min:3|max:100|unique:users,username',
            'email' => 'required|email|max:100|unique:users,email',
            'password' => 'required|min:5|max:100'
        ]);

        // creazione di una nuovo user

        $user = User::create($attributes);

        // messaggio

        session()->flash('success', 'Your account has been created');

        // login

        auth()->login($user);




        return redirect('/');

    }


}
