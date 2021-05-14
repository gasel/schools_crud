<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StudentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // transforms the resource into an array made up of the attributes to be converted to JSON
        return [
            'id'=> $this->id,
            'name'=> $this->name,
            'surname' => $this->surname,
            'birthdate'=>$this->birthdate,
            'city'=>$this->city,
            'school' => $this->school,
            'created_at' => (string) $this->created_at
        ];
    }
}
