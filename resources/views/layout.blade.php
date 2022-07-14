<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/style.css">
    <title>My Blog</title>
</head>
<body>
    

    <!-- Header con navbar -->
    <header>
        <nav>
            
                <div class="logo"><a href="/">MyLaravelBlog</a></div>
                <div class="menu">
                    @auth
                        <a href="/author/posts/create">New Post</a>
                        <a href="/author/posts">Manage your Posts</a>
                        <span>Welcome, {{ auth()->user()->name }}</span>
                        <div class="logout">
                            <form action="/logout" method="post">
                                @csrf
                                <button type="submit">Logout</button>
                            </form>
                        </div>
                    @else
                        <a href="/register">Register</a>
                        <a href="/login">Login</a>
                    @endauth
                </div>
            
        </nav>
    </header>

    <main>

        <!-- Messaggi -->
        @if (session()->has('success'))
            <div>
                <p style="color: green"><strong>{{session('success')}}</strong></p>
            </div>
        @endif

        

        <!-- Contenuto dinamico -->
        <section class="content">
            @yield('content')
        </section>
    
    </main>
    

</body>
</html>