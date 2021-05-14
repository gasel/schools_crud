<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\School;

class Student extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'surname', 'birthdate', 'city', 'school_id'
    ];

    public function school()
    {
        return $this->belongsTo(School::class);
    }
    
}
