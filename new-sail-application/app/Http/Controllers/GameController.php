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
            // return $this->gameService->getGame($id);
            $response = $this->gameService->getGame($id);
            return view('game', ['data' => $response]);
        }

        $games = GameService::getGameList();
        $gamesCollection = collect($games['response']);

        $start = 0;
        $max = 10;
        if (isset($request->filter) && Str::contains($request->filter, [':','page','provider','game'])) {
            
            $currentPage = null;
            if (str_contains($request->filter, "|")) {
                list($filterBy, $currentPage) = explode("|", $request->filter);
            } else {
                $filterBy = $request->filter;
            }

            list($key, $value) = explode(':', $filterBy);
            
            if ($key == 'provider') {
                //replace underscore for spaces
                $value = str_replace("-", " ", $value);
                $filtered = $gamesCollection->filter(function ($val) use ($value) {
                    return strtolower($val['category']) == strtolower($value);
                });
            } else if ($key == 'game') {
                //replace underscore for spaces
                $value = str_replace("-", " ", $value);
                $filtered = $gamesCollection->filter(function ($val) use ($value) {
                    return (strtolower($val['name']) == strtolower($value) || strtolower($val['gamename']) == strtolower($value)) ;
                });
            } else if ($key == 'page') {
                if ($value == 'all') {
                    $max = count($gamesCollection);
                } else {
                    $max = 10; 
                    $start = ($max * $value) - 10;
                }
                $filtered = $gamesCollection;
            } else {
                $filtered = $gamesCollection;
            }  

            if ($currentPage) {
                list($page, $pageVal) = explode(':', $currentPage);
                if ($pageVal == 'all') {
                    $start = 0;
                    $max = count($filtered);
                } else {
                    $max = 10; 
                    $start = ($max * $pageVal) - 10;
                }
            }

        }

        print_r('max: ' . $max);
        print_r('start: ' . $start);

        $chunked = $filtered->slice($start, $max);
        dd($chunked->all());
    }
}
