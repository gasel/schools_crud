<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'address', 'logo', 'email', 'phone', 'website'
    ];

}
