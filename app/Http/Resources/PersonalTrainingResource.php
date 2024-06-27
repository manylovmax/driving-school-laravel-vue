<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PersonalTrainingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
          'id' => $this->id,
          'name' => $this->name,
          'description' => $this->description,
          'status' => $this->status,
          'category' => $this->category,
          'price' => $this->price,
          'price_for_students' => $this->price_for_students,
          'is_active' => $this->is_active,
        ];
    }
}
