<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
        'surname' => $this->surname,
        'name' => $this->name,
        'phone' => $this->phone,
        'email' => $this->email,
        'group_id' => $this->group_id,
        'group_type' => $this->group_type,
        'created_at' => $this->created_at,
      ];
    }
}
