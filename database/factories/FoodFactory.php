<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use  App\Models\Category;
use  App\Models\Food;
class FoodFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $array = ['anh42.jpg', 'anh43.jgp', 'anh44.jpg'];
        $arrayName = ['NHO XANH', 'BÍ NGÔ', 'Bơ xanh', ' Cà chua', 'Cam Cao Phong', 'CỦ DỀN'];
        return [
            'name' => $this->faker->randomElement($arrayName),
            'category_id'=> Category::inRandomOrder()->first()->id,
            'price' =>  $this->faker->numberBetween(1000, 20000),
            'image' =>$this->faker->randomElement($array),
            'description' =>$this->faker->text($maxNbChars = 90),
        ];
    }
}
