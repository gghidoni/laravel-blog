<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use App\Models\User;


class PostController extends Controller
{
   
    public function index() {

    // visualizza tutti i post
    $posts = Post::latest()->get();

    return view('posts', [
        'posts' => $posts
    ]);

    }

    public function show(Post $post) {

        // mostra un singolo post
        return view('post', [
            'post' => $post
        ]);

    }

    public function categoryArchive(Category $category) {

        // mostra un archivio di post by categoria
        return view('posts', [
            'posts' => $category->posts
        ]);

    }

    public function authorArchive(User $author) {

        // mostra un archivio di post by autore
        return view('posts', [
            'posts' => $author->posts
        ]);

    }

    

}
