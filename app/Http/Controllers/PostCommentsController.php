<?php

namespace App\Http\Controllers;

use App\Models\Post;


class PostCommentsController extends Controller
{
    
    public function store(Post $post) {

        // validazione
        request()->validate([
            'body' => 'required'
        ]);


        //inserimento commento
        $post->comments()->create([

            'user_id' => request()->user()->id,
            'body' => request('body')
        ]);

        return back();

    }


}
