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

class GameController extends Controller
{
    protected Game $game;
    protected GameService $gameService;

    public function __construct(Game $game, GameService $gameService)
    {
        $this->game = $game;
        $this->gameService = $gameService;
    }

    // public function index() 
    // {
    //     //return "hello";

    //     // $games = DB::table('games')->get();

    //     // $games = Game::find(1521);
    //     $games = Game::take(10)->get();
    //     print_r($games);
    // }

    // public function index(IndexRequest $request): GameCollection
    // {
    //     // return new GameCollection($this->game->getFiltered($request->validated()));
    //     return new GameCollection(Game::take(3)->get());
    // }


    public function indexx()
    {
        // $response = Http::withHeaders([
        //     'Content-Type' => 'application/json'
        // ])->get('https://aggr.reeltech.co/api/seamless/providerisb', ['data' => [
        //     'api_password' => 'tabella-kingschance!',
        //     'api_login' => 'tabella-kingschance-stage_mc_s',
        //     'method' => 'getGameList',
        //     'show_systems' => 0,
        //     'currency' => "EUR",
        // ]]);


        // $client = new Client();
        // $response = $client->get('https://aggr.reeltech.co/api/seamless/providerisb', [
            // RequestOptions::JSON => [
            //     'api_password' => 'tabella-kingschance!',
            //     'api_login' => 'tabella-kingschance-stage_mc_s',
            //     'method' => 'getGameList',
            //     'show_systems' => 0,
            //     'currency' => 'EUR',
            //     ]
        // ]);

        // $response = Http::withHeaders([
        //     'Content-Type' => 'application/json'
        // ])->post('https://aggr.reeltech.co/api/seamless/providerisb', ["{
        //     'api_password':'tabella-kingschance!',
        //     'api_login':'tabella-kingschance-stage_mc_s',
        //     'method':'getGameList',
        //     'show_systems':0,
        //     'currency':'EUR',
        // }"]);

        // $response = Http::withHeaders([
        //     'Content-Type' => 'application/json'
        // ])->post('https://aggr.reeltech.co/api/seamless/providerisb', [
        //     'api_password' => 'tabella-kingschance!',
        //     'api_login' => 'tabella-kingschance-stage_mc_s',
        //     'method' => 'getGameList',
        //     'show_systems' => 0,
        //     'currency' => 'EUR',
        //     ]);

    
        // $responseData = $response->json();
        // dd($responseData);


        // $response = Http::withHeaders([
        //     'Content-Type' => 'application/json'
        // ])->get('https://aggr.reeltech.co/api/seamless/providerisb', [
        //     RequestOptions::JSON => [
        //         'api_password' => 'tabella-kingschance!',
        //         'api_login' => 'tabella-kingschance-stage_mc_s',
        //         'method' => 'getGameList',
        //         'show_systems' => 0,
        //         'currency' => 'EUR',
        //         ]
        // ]);

        // dd($response->body());
        //print_r($response);
        // return new GameCollection($response);
    }

    public function index(IndexRequest $request)
    {
        // print_r($request->filter);
        
        // return new GameCollection(GameService::getGameList());

        $games = GameService::getGameList();
        $gamesCollection = collect($games['response']);
        // dd($gamesCollection);

        // $gamesCollection = collect($games->response);

        $start = 0;
        $max = 10;
        if (isset($request->filter) && Str::contains($request->filter, [':','page','provider','game'])) {
            $filter = $request->filter;
            list($param, $value) = explode(':', $filter);
            
            if ($param == 'provider') {
                //replace underscore for spaces
                $value = str_replace("-", " ", $value);
                $filtered = $gamesCollection->filter(function ($val) use ($value) {
                    return strtolower($val->category) == strtolower($value);
                });
            } else if ($param == 'game') {
                //replace underscore for spaces
                $value = str_replace("-", " ", $value);
                $filtered = $gamesCollection->filter(function ($val) use ($value) {
                    return (strtolower($val->name) == strtolower($value) || strtolower($val->gamename) == strtolower($value)) ;
                });
            } else {
                $filtered = $gamesCollection;
            }  


            if ($param == 'page') {
                if ($value == 'all') {
                    $max = count($gamesCollection);
                } else {
                    $max = $value * $max; // @todo: check max if valid
                    $start = $max - 10;
                } 
            }
        }

        print_r('max: ' . $max);
        print_r('start: ' . $start);

        $chunked = $filtered->slice($start, $max);
        
        // $gamesCollection = collect($games->response);
        // return $gamesCollection->all();
        // dd($filtered->all());

        dd($chunked->all());
    }
}
