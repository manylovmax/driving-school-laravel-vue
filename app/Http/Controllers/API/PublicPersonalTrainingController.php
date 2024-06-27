<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\PersonalTraining;
use App\Http\Resources\PersonalTrainingResource;
use App\Http\Controllers\Controller;

class PublicPersonalTrainingController extends Controller
{
  const PAGE_SIZE = 6;
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
      return Per::collection(PersonalTraining::where('status', '<>', self::STATUS_CLOSED)
      ->whereNull('deleted_at')
      ->orderBy('created_at', 'desc')
      ->paginate(self::PAGE_SIZE));
    }
}
