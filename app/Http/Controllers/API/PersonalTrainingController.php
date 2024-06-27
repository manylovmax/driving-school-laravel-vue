<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\PersonalTraining;
use App\Http\Resources\PersonalTrainingResource;
use App\Http\Controllers\Controller;

class PersonalTrainingController extends Controller
{
  const PAGE_SIZE = 6;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      $query = $request->query('q');

      return PersonalTrainingResource::collection(PersonalTraining::where('name', 'ilike', "%$query%")
      ->whereNull('deleted_at')
      ->orderBy('created_at', 'desc')
      ->paginate(self::PAGE_SIZE));
    }

    public function all()
    {
        return PersonalTrainingResource::collection(PersonalTraining::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $group = PersonalTraining::create($request->all());

        return new PersonalTrainingResource($group);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(PersonalTraining $Group)
    {
        return new PersonalTrainingResource($Group);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PersonalTraining $Group)
    {
        $Group->update($request->all());

        return new PersonalTrainingResource($Group);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroy(PersonalTraining $Group)
    {
      $Group->delete();

      return response()->json(null, 204);
    }
}
