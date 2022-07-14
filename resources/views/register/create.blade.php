@extends('layout')

@section('content')

    <div class="form">

    <h1>Register</h1>

    <form action="/register" method="POST">

        @csrf
    
        <input type="text" name="name" placeholder="Name" value="{{old('name')}}" required><br><br>
        @error('name')
            <p style="color: red">{{$message}}</p>
        @enderror
        <input type="text" name="username" placeholder="Username" value="{{old('username')}}" required><br><br>
        @error('username')
            <p style="color: red">{{$message}}</p>
        @enderror
        <input type="email" name="email" placeholder="Email" value="{{old('email')}}" required><br><br>
        @error('email')
            <p style="color: red">{{$message}}</p>
        @enderror
        <input type="password" name="password" placeholder="Password" required><br><br>
        @error('password')
            <p style="color: red">{{$message}}</p>
        @enderror

        <input type="submit" value="Register">
        

    </form>

</div>

@endsection