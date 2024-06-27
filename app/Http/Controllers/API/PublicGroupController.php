<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Group;
use App\Http\Resources\GroupResource;
use App\Http\Controllers\Controller;

class PublicGroupController extends Controller
{
  const PAGE_SIZE = 20;
  const STATUS_OPEN = 1;
  const STATUS_FILLING = 2;
  const STATUS_CLOSED = 3;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      return GroupResource::collection(Group::where('status', '<>', self::STATUS_CLOSED)
      ->whereNull('deleted_at')
      ->orderBy('created_at', 'desc')
      ->paginate(self::PAGE_SIZE));
    }
}
