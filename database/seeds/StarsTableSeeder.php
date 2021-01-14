<?php
//? --- COMMENT HELLOCSE : Création d'un Seeder utilisant Factory
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Stars;


class StarsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Stars::factory()->count(10)->create();
    }
}
