<?php

namespace App\Http\Controllers;

// use Illuminate\Http\Request;

use App\Http\Requests\Game\IndexRequest;
use App\Http\Resources\GameCollection;

class GameController extends Controller
{
    public function index(IndexRequest $request): GameCollection
    {
        return new GameCollection();
    }
}
