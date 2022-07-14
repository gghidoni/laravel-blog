<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        // User::truncate();      // cancella tutto User
        // Post::truncate();      // cancella tutto Post
        // Category::truncate();  // cancella tutto Category

        Post::factory(5)->create();

        // $user = User::factory()->create();  // mi crea n user casuali con il comando "php artisan db:seed"

        // $personal = Category::create([
        //     'name' => 'Personal',
        //     'slug' => 'personal'
        // ]);

        // $family = Category::create([
        //     'name' => 'Family',
        //     'slug' => 'family'
        // ]);

        // $work = Category::create([
        //     'name' => 'Work',
        //     'slug' => 'work'
        // ]);

        // Post::create([
        //     'user_id' => $user->id,
        //     'category_id' => $family->id,
        //     'title' => 'My Family post',
        //     'slug' => 'my-family-post',
        //     'excerpt' => 'dfsdfbwsigfbiwrybfyfby',
        //     'body' => 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudant.'
        // ]);

        // Post::create([
        //     'user_id' => $user->id,
        //     'category_id' => $personal->id,
        //     'title' => 'My Personal post',
        //     'slug' => 'my-personal-post',
        //     'excerpt' => 'dfsdfbwsigfbiwrybfyfby',
        //     'body' => 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudant.'
        // ]);

        // Post::create([
        //     'user_id' => $user->id,
        //     'category_id' => $work->id,
        //     'title' => 'My Work post',
        //     'slug' => 'my-work-post',
        //     'excerpt' => 'dfsdfbwsigfbiwrybfyfby',
        //     'body' => 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudant.'
        // ]);

        // // \App\Models\User::factory()->create([
        // //     'name' => 'Test User',
        // //     'email' => 'test@example.com',
        // // ]);
    }
}
