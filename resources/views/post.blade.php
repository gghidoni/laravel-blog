@extends('layout')

@section('content')

    <!-- Sezione Singolo Articolo -->
    <article>
        <h2> {{$post->title }} </h2>
        <span>
            by <a href="/authors/{{$post->author->username}}">{{$post->author->name}}</a> in <a href="/categories/{{$post->category->slug}}"><strong>{{$post->category->name}}</strong></a>
        </span>
        <div><p> {!! $post->body !!}  </p></div>

        
        @foreach( $post->tags as $tag)
            <span class="tags"><strong>   #</strong>{{ $tag->name }}  </span>
        @endforeach
        
    </article>



    <!-- Sezione commenti -->
    <!-- form inserimento commenti -->
    <section class="add-comments">
        <h4>Add a comment</h4>
    @auth
        
            <form action="/posts/{{$post->slug}}/comments" method="post">
                @csrf
                <textarea name="body"cols="60" rows="8" placeholder="Scrivi qui il tuo commento..." required></textarea><br>
                @error('body')
                    <span style="color: red">{{$message}}</span>
                @enderror
                <button type="submit">Post</button>
            </form>
        @else
        <p>To add a comment, <a href="/login">login</a> or <a href="/register">register!</a></p>
    @endauth
    </section>
    

    <!-- lista commenti -->
    <section class="list-comments">
        <h4>Comments</h4>
        @foreach ($post->comments as $comment)
            <div class="comment">
                <span><strong>{{$comment->author->username}}</strong></span><br>
                <time>Posted {{$comment->created_at}}</time><br>
                <p>{{$comment->body}}</p>
            </div>
            
        @endforeach   
    </section>

     
@endsection

