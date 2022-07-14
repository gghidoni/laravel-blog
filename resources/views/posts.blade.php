@extends('layout')


@section('content')

    <!-- Lista Articoli -->
    @foreach ($posts as $post)
        <article class="{{ $loop->even ? 'even-post' : '' }}">
            <h2><a href="/posts/{{$post->slug}}">{{ $post->title }}</a></h2>
            <span>
                by <a href="/authors/{{$post->author->username}}">{{$post->author->name}}</a> in <a href="/categories/{{$post->category->slug}}"><strong>{{$post->category->name}}</strong></a>
            </span>
            <p>{{$post->date}}</p>
            <div>{{$post->excerpt}}</div>
            <div class="comments-prev"><span>{{count($post->comments)}} comments</span></div>
        </article>
    @endforeach

    
@endsection
