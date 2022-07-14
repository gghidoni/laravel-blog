@extends('layout')

@section('content')

    

    

<div class="form">
    <h1>Login</h1>

    <form action="/login" method="POST">

        @csrf
 
        <input type="email" name="email" placeholder="Email" value="{{old('email')}}" required><br><br>
        @error('email')
            <p style="color: red">{{$message}}</p>
        @enderror
        <input type="password" name="password" placeholder="Password" required><br><br>
        @error('password')
            <p style="color: red">{{$message}}</p>
        @enderror

        <input type="submit" value="Login">
        

    </form>

</div>

@endsection