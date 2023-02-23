<?php

namespace App\Http\Controllers;

// use Illuminate\Http\Request;

use App\Http\Requests\Game\IndexRequest;
use App\Http\Resources\GameCollection;
use App\Models\Game;
use App\Services\GameService;

use Illuminate\Support\Str;

use Illuminate\Support\Facades\Http;
use GuzzleHttp\Client;
use GuzzleHttp\RequestOptions;

use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;

// use Illuminate\Support\Facades\View;

class GameController extends Controller
{
    protected Game $game;
    protected GameService $gameService;

    public function __construct(Game $game, GameService $gameService)
    {
        $this->game = $game;
        $this->gameService = $gameService;
    }

    public function index(IndexRequest $request, $id=null)
    {
        if ($id) {
            $response = $this->gameService->getGame($id);
            return view('game', ['data' => $response]);
        }

        $games = GameService::getGameList();
        $gamesCollection = collect($games['response']);
        $filtered = $gamesCollection;

        if (isset($request->filter) && Str::contains($request->filter, [':','page','provider','game'])) {
            
            $filterBy = $request->filter;

            list($key, $value) = explode(':', $filterBy);
            
            if ($key == 'provider') {
                $value = str_replace("-", " ", $value);
                $filtered = $gamesCollection->filter(function ($val) use ($value) {
                    return strtolower($val['category']) == strtolower($value);
                });
            } 
            
            if ($key == 'game') {
                $value = str_replace("-", " ", $value);
                $filtered = $gamesCollection->filter(function ($val) use ($value) {
                    return (strtolower($val['name']) == strtolower($value) || strtolower($val['gamename']) == strtolower($value)) ;
                });
            } 
        }

        $paginatedItems = $filtered->paginate(10);
        $paginatedItems->setPath('/games?filter=' . $request->filter);
        return view('game_list', ['data' => $paginatedItems]);
    }
}
