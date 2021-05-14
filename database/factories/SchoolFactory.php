<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\School;
use Faker\Generator as Faker;
use App\Helpers\Image as ImageGenerator;

$factory->define(School::class, function (Faker $faker) {
    return [
        //
        'name' => $faker->company,
        'address' => $faker->address,
        'logo' => ImageGenerator::image(public_path('storage/school_logos'),200,200, null, false),
        'phone' => $faker->phoneNumber,
        'email' => $faker->email,
        'website' => $faker->url,
    ];
});
