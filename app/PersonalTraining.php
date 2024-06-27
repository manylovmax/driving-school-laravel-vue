<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PersonalTraining extends Model
{
  use SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *s
     * @var array
     */
    protected $fillable = [
      'name', 'description',  'status', 'category', 'price', 'price_for_students', 'is_active'
  ];
  protected $dates = ['deleted_at', 'created_at', 'updated_at'];

  // protected $table = 'personal_training';
}
