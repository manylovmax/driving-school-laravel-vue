<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GroupsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      DB::table('groups')->insert([
        'id' => 1,
        'name' => 'B012',
        'start_at' => '2018-12-20',
        // 'exam_date' => null,
        'timetable' => '["Воскресенье"]',
        'hours_start_at' => '10:00:00',
        'hours_finish_at' => '13:00:00',
        'status' => 1,
        'category' => 1,
        'price' => 25000,
        'price_for_students' => 23000,
        'is_active' => true,
        'created_at' => '2018-12-03 23:21:37',
        'updated_at' => '2018-12-03 23:21:37',
        // 'deleted_at' => null,
      ]);
      DB::table('groups')->insert([
        'id' => 2,
        'name' => 'B013',
        'start_at' => '2018-12-20',
        // 'exam_date' => null,
        'timetable' => '["Понедельник", "Среда"]',
        'hours_start_at' => '19:30:00',
        'hours_finish_at' => '21:00:00',
        'status' => 1,
        'category' => 1,
        'price' => 25000,
        'price_for_students' => 23000,
        'is_active' => true,
        'created_at' => '2018-12-03 23:21:37',
        'updated_at' => '2018-12-03 23:21:37',
        // 'deleted_at' => null,
      ]);
      DB::table('groups')->insert([
        'id' => 3,
        'name' => 'B014',
        'start_at' => '2018-12-20',
        // 'exam_date' => null,
        'timetable' => '["Вторник", "Четверг"]',
        'hours_start_at' => '19:30:00',
        'hours_finish_at' => '21:00:00',
        'status' => 1,
        'category' => 1,
        'price' => 25000,
        'price_for_students' => 23000,
        'is_active' => true,
        'created_at' => '2018-12-03 23:21:37',
        'updated_at' => '2018-12-03 23:21:37',
        // 'deleted_at' => null,
      ]);
    }
}
