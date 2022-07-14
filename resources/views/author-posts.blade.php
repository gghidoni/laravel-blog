@extends('layout')


@section('content')
<h1>Manage your Posts</h1>

    <!-- Lista Articoli -->
    @foreach ($posts as $post)
        <article style="margin-bottom: 20px; margin-top: 30px" class="{{ $loop->even ? 'even-post' : '' }}">

            <h2><a href="/posts/{{$post->slug}}">{{ $post->title }}</a></h2>

            <span>
                By <a href="/authors/{{$post->author->username}}">{{$post->author->name}}</a> in <a href="/categories/{{$post->category->slug}}">
                    <strong>{{$post->category->name}}</strong>
                   </a>
            </span>

            <div style="margin-top: 20px">{{$post->excerpt}}</div>

            <div class="edit">
                <a href="/author/posts/{{ $post->id }}/edit"><button>Edit</button></a>
                <form action="/author/posts/{{ $post->id }}" method="post">
                    @csrf
                    @method('DELETE')
                    <button style="margin-left: 15px">Delete</button>
                </form>
            </div>
            
            
        </article>
        

    @endforeach
   
    
@endsection