<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\School;
use App\Models\Student;
use Faker\Generator as Faker;

$factory->define(Student::class, function (Faker $faker) {

    // Grab a random vendor
    $school = School::orderByRaw('RAND()')->first();

	if (!$school) {
		$school = factory(School::class)->create();
	}
	
    return [
        //
        'name' => $faker->firstName,
        'surname' => $faker->lastName,
        'birthdate' => $faker->dateTimeBetween($startDate = '-30 years', $endDate = 'now', $timezone = null)->format('Y-m-d'),
        'city' => $faker->city,
        'school_id'=> $school->id
    ];
});
