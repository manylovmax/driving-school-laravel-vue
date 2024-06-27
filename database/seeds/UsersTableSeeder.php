<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      DB::table('users')->insert([
        'name' => 'admin',
        'phone' => 'admin',
        'email' => 'admin@gmail.com',
        'group_id' => 1,
        'password' => bcrypt('secret'),
      ]);
    }
}
