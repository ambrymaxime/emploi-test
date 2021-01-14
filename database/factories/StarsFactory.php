<?php
//? --- COMMENT HELLOCSE : Création d'une factory pour créer de fausses Stars
namespace Database\Factories;

use App\Models\Stars;
use Illuminate\Database\Eloquent\Factories\Factory;

class StarsFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Stars::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'first_name' => $this->faker->firstName,
            'last_name' => $this->faker->lastName,
            'description' => $this->faker->paragraph,
            'created_at' => now(),
            'updated_at' => null,
        ];
    }
}