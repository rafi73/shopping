<?php

use Illuminate\Database\Seeder;
use App\User;

class UsersTableDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => str_random(8),
            'email' => 'rafi.aust@live.com',
            'password' => bcrypt('123456')
        ]);
    }
}
