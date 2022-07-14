@extends('layout')

@section('content')

    <h1>Edit Post: {{$post->title}}</h1>

    <form action="/author/posts/{{ $post->id }}" method="POST">
        @csrf
        @method('PATCH')

        <!-- title -->
        <textarea name="title" cols="80" rows="1" required>{{ $post->title }}</textarea><br><br>
        @error('title')
            <p style="color: red">{{$message}}</p>
        @enderror

        <!-- slug -->
        <textarea name="slug" cols="80" rows="1" required>{{ $post->slug }}</textarea><br><br>
        @error('slug')
            <p style="color: red">{{$message}}</p>
        @enderror

        <!-- excerpt -->
        <textarea name="excerpt" cols="80" rows="5" required>{{ $post->excerpt }}</textarea><br><br>
        @error('excerpt')
            <p style="color: red">{{$message}}</p>
        @enderror

        <!-- body -->
        <textarea name="body" cols="80" rows="10" required>{{ $post->body }}</textarea><br><br>
        @error('body')
            <p style="color: red">{{$message}}</p>
        @enderror

        <!-- category -->
        <label for="category_id">Category </label>
        <select name="category_id">

            <!-- Richiamo tutte le categorie per formare il select -->
            @php
                $categories = \App\Models\Category::all();
            @endphp
            @foreach ($categories as $category)
                <option value="{{$category->id}}" {{ $post->category_id == $category->id ? 'selected' : '' }}>{{ ucwords($category->name) }}</option>
            @endforeach
        </select><br><br>
        @error('category_id')
            <p style="color: red">{{$message}}</p>
        @enderror

        <!-- tags -->
        <span><strong>Tags:</strong></span>
        
        <!-- Richiamo tutti i tags per formare il select -->
            @php
                $tags = \App\Models\Tag::all();
                $tagsIdArrayByPost = [];
                foreach ($post->tags as $objTag) {
                    $tagsIdArrayByPost[] = $objTag->id;
                }
            @endphp
            @foreach ($tags as $tag)
                <input type="checkbox" name="tag_id[]" id="{{$tag->id}}" value="{{$tag->id}}" {{ in_array($tag->id, $tagsIdArrayByPost) ? 'checked' : '' }}><label for="{{$tag->id}}">{{ ucwords($tag->name) }}</label>
            @endforeach
            <br><br>
        @error('tag_id')
            <p style="color: red">{{$message}}</p>
        @enderror
        

        <input type="submit" value="Update">


    </form>


@endsection