<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;



class Post extends Model
{
    use HasFactory;


    protected $with = ['category', 'author'];  // per ogni query post carica gia anche categoria e authore per risparmiare query

    public function comments() {

        return $this->hasMany(Comment::class);   // ogni post ha più commenti

    }

    public function category() {

        return $this->belongsTo(Category::class);   // ogni post ha 1 category

    }

    public function author() {

        return $this->belongsTo(User::class, 'user_id');   // ogni post ha 1 user

    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

}
