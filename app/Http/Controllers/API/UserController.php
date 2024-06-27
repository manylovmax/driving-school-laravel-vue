<?php

namespace App\Http\Controllers\API;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    const PAGE_SIZE = 20;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $queryString = $request->query('q', null);
        $groupId = (int) $request->query('group_id', 0);
        $trashed = $request->query('trashed', false) === 'true'? true: false;

        return UserResource::collection($this->getSearchQuery($queryString, $groupId, $trashed));
    }

    private function getSearchQuery(string $queryString = null, int $groupId = null, bool $trashed = false) {
        $Query = DB::table('users');
        $Query->where('id', '!=', 1);// admin user

        if ($groupId) {
            $Query->where('group_id', $groupId);
        }

        if ($trashed) {
            $Query->whereNotNull('deleted_at');
        } else {
            $Query->whereNull('deleted_at');
        }

        if ($queryString) {
            $queryWords = explode(' ', $queryString);
            foreach ($queryWords as $queryWord) {
                $Query->where(function ($query) use ($queryWord) {
                    $query->orWhere('name', 'ilike', "%$queryWord%")
                    ->orWhere('surname', 'ilike', "%$queryWord%")
                    ->orWhere('phone', 'ilike', "%$queryWord%")
                    ->orWhere('email', 'ilike', "%$queryWord%");
                });
            }
        }

        return $Query->orderBy('created_at', 'desc')->paginate(self::PAGE_SIZE);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      $request->validate([
        'name' => 'required|string',
        'surname' => 'required|string',
        'phone' => 'required|string',
        'group_id' => 'required|integer',
        'email' => 'nullable|string|email|unique:users',
        // 'password' => 'required|string|confirmed'
      ]);
      $user = new User([
          'name' => $request->name,
          'surname' => $request->surname,
          'email' => $request->email,
        //   'password' => bcrypt($request->password),
          'phone' => $request->phone,
          'group_id' => $request->group_id,
      ]);
      $user->save();
        // $User = User::create($request->all());

        return new UserResource($user);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $User)
    {
        return new UserResource($User);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $User)
    {
        $User->update($request->all());

        return new UserResource($User);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $User)
    {
        $User->delete();

        return response()->json(null, 204);
    }
}
