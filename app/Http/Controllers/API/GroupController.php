<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Group;
use App\Http\Resources\GroupResource;
use App\Http\Controllers\Controller;

class GroupController extends Controller
{
  const PAGE_SIZE = 100;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      $query = $request->query('q');

      return GroupResource::collection(Group::where('name', 'ilike', "%$query%")
      // ->whereNull('deleted_at')
      ->orderBy('status', 'asc')
      ->orderBy('created_at', 'desc')
      ->paginate(self::PAGE_SIZE));
    }

    public function all()
    {
        return GroupResource::collection(Group::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $group = Group::create($request->all());

        return new GroupResource($group);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Group $Group)
    {
        return new GroupResource($Group);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Group $Group)
    {
        $Group->update($request->all());

        return new GroupResource($Group);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroy(Group $Group)
    {
      $Group->delete();

      return response()->json(null, 204);
    }
}
