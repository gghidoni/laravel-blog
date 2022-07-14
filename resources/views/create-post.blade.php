@extends('layout')

@section('content')

    <h1>Publish a new Post</h1>

    <form action="/author/posts/create" method="POST">
        @csrf

        <textarea name="title" cols="80" rows="1" placeholder="Post title" value="{{ old('title') }}" required></textarea><br><br>
        @error('title')
            <p style="color: red">{{$message}}</p>
        @enderror
        <textarea name="slug" cols="80" rows="1" placeholder="slug" value="{{ old('slug') }}" required></textarea><br><br>
        @error('slug')
            <p style="color: red">{{$message}}</p>
        @enderror
        <textarea name="excerpt" cols="80" rows="5" placeholder="Excerpt post" value="{{ old('excerpt') }}" required></textarea><br><br>
        @error('excerpt')
            <p style="color: red">{{$message}}</p>
        @enderror
        <textarea name="body" cols="80" rows="10" placeholder="Content post" value="{{ old('body') }}" required></textarea><br><br>
        @error('body')
            <p style="color: red">{{$message}}</p>
        @enderror
        <label for="category_id"><strong>Category: </strong></label>
        <select name="category_id">
            <!-- Richiamo tutte le categorie per formare il select -->
            @php
                $categories = \App\Models\Category::all();
            @endphp
            @foreach ($categories as $category)
                <option value="{{$category->id}}">{{ ucwords($category->name) }}</option>
            @endforeach
        </select><br><br>
        @error('category_id')
            <p style="color: red">{{$message}}</p>
        @enderror

        <span><strong>Tags:</strong></span>
        <!-- Richiamo tutti i tags per formare il select -->
            @php
                $tags = \App\Models\Tag::all();
            @endphp
            @foreach ($tags as $tag)
                <input type="checkbox" name="tag_id[]" id="{{$tag->id}}" value="{{$tag->id}}"><label for="{{$tag->id}}">{{ ucwords($tag->name) }}</label>
            @endforeach
            <br><br>
        @error('tag_id')
            <p style="color: red">{{$message}}</p>
        @enderror




        

        <input type="submit" value="Pubblica">


    </form>


@endsection