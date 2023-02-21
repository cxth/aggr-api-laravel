<?php

namespace App\Http\Controllers;

// use Illuminate\Http\Request;

use App\Http\Requests\Game\IndexRequest;
use App\Http\Resources\GameCollection;
use App\Models\Game;
use App\Services\GameService;
use Illuminate\Support\Facades\DB;

class GameController extends Controller
{
    protected Game $game;
    protected GameService $gameService;

    public function __construct(Game $game, GameService $gameService)
    {
        $this->game = $game;
        $this->gameService = $gameService;
    }

    public function index() 
    {
        //return "hello";

        $games = DB::table('games')->get();
        print_r($games);
    }

    // public function index(IndexRequest $request): GameCollection
    // {
    //     // return new GameCollection($this->game->getFiltered($request->validated()));
    //     return new GameCollection();
    // }
}
