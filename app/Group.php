<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Carbon;

class Group extends Model
{
  use SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
      'name', 'description', 'start_at', 'exam_date', 'timetable', 'hours_start_at', 'hours_finish_at', 'status', 'category', 'price', 'price_for_students', 'is_active'
    ];

     /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at', 'created_at', 'updated_at'];
    protected $casts = [
        'timetable' => 'array',
    ];

    const CATEGORY_B = 0;
    const CATEGORY_BC = 1;

    public static $categories = [
        0 => 'B',
        1 => 'BC',
    ];

    const STATUS_OPENED = 1;
    const STATUS_ON_THE_GO = 2;
    const STATUS_CLOSED = 3;

    const TRANSMISSION_MT = 1;
    const TRANSMISSION_AT = 2;

    public static $transmissions = [
        self::TRANSMISSION_MT => 'Механика',
        self::TRANSMISSION_AT => 'Автомат',
    ];
    public static $statuses = [
        self::STATUS_OPENED    => 'Открыт набор',
        self::STATUS_ON_THE_GO => 'Идет обучение',
        self::STATUS_CLOSED    => 'Обучение завершено',
    ];

    
    const GROUP_TYPE_REGULAR = 1;
    const GROUP_TYPE_PERSONAL = 2;

    public static $groupTypes = [
        self::GROUP_TYPE_REGULAR => 'Обычная',
        self::GROUP_TYPE_PERSONAL => 'Персональная',
    ];
}
