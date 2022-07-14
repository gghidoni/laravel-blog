<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule as ValidationRule;
use Symfony\Component\HttpFoundation\Response;

class AuthorPostController extends Controller
{
    

    public function index() {

        return view('author-posts', [
                'posts' => request()->user()->posts
            ]);

    }


    public function create() {

        // se non sei loggato
        if(auth()->guest()) {
            abort(Response::HTTP_FORBIDDEN);
        }

        // se non sei uno specifico utente
        // if(auth()->user()->username != 'PincoPallo') {
        //     abort(Response::HTTP_FORBIDDEN);
        // }

        return view('create-post');

    }


    public function store() {

        // validazione
        $attributes = request()->validate([
            'title' => 'required',
            'slug' => ['required', ValidationRule::unique('posts', 'slug')],
            'excerpt' => 'required',
            'body' => 'required',
            'category_id' => ['required', ValidationRule::exists('categories', 'id')]
        ]);

        // assegna id user 
        $attributes['user_id'] = auth()->id();
        
        // crea un nuovo post 
        $post = Post::create($attributes);

        // validazione tag id
        $tags = request()->validate([
            'tag_id' => ['required', ValidationRule::exists('categories', 'id')]
        ]);

        // itera array tag id e per ogni elemento inserisci un record nella tabella post_tag
        foreach($tags['tag_id'] as $tag) {
            DB::table('post_tag')->insert([
                'post_id' => $post->id,
                'tag_id' => $tag
            ]);
        }

        return redirect('/');

    }

    public function edit(Post $post) {

        // pagina di edit post
        return view('edit-post', ['post' => $post]);
        
    }

    public function update(Post $post) {

        // validazione attributi per update post
        $attributes = request()->validate([
            'title' => 'required',
            'slug' => ['required', ValidationRule::unique('posts', 'slug')->ignore($post->id)],
            'excerpt' => 'required',
            'body' => 'required',
            'category_id' => ['required', ValidationRule::exists('categories', 'id')]
        ]);

        $post->update($attributes);

        // validazione tag id
        $tags = request()->validate([
            'tag_id' => ['required', ValidationRule::exists('categories', 'id')]
        ]);

        // verifica update tags
        // mi creo un array di tag_id precedenti all'update
        $oldTags = [];
        foreach ($post->tags as $objTag) {
            $oldTags[] = $objTag->id;
        }

        // itero i nuovi valori request tag, se non sono gia presenti creo un nuovo record nella tabella
        foreach($tags['tag_id'] as $tag) {
            if(!in_array($tag, $oldTags)){
                DB::table('post_tag')->insert([
                    'post_id' => $post->id,
                    'tag_id' => $tag
                ]);
            }
        }


        // redirect con messaggio
        return back()->with('success', 'Post Updated!');
        
    }

    public function destroy(Post $post) {

        // elimina post
        $post->delete();

        // redirect con messaggio
        return back()->with('success', 'Post Deleted!');

    }


}
