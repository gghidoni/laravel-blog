<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;



    public function post() {

        return $this->belongsTo(Post::class);   // ogni commento ha 1 post

    }


    public function author() {

        return $this->belongsTo(User::class, 'user_id');   // ogni commento ha 1 user

    }


}
