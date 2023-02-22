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
        // $gamesjd = json_decode($games);
        // dd($gamesjd);

        $gamesCollection = collect($games['response']);
        // dd($gamesCollection);

        // $gamesCollection = collect($games->response);

        $start = 0;
        $max = 10;
        if (isset($request->filter) && Str::contains($request->filter, [':','page','provider','game'])) {
            

            // get parameters
            $currentPage = null;

            // print_r('current param: ' . $request->filter);


            if (str_contains($request->filter, "|")) {
                list($filterBy, $currentPage) = explode("|", $request->filter);
            } else {
                $filterBy = $request->filter;
            }


            // $filter = $request->filter;
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
                    $max = $value * $max; 
                    $start = $max - 10;
                }
                $filtered = $gamesCollection;
            } else {
                $filtered = $gamesCollection;
            }  


            print_r('currentpage: ' . $currentPage);

            if ($currentPage) {
                list($page, $pageVal) = explode(':', $currentPage);
                if ($pageVal == 'all') {
                    $start = 0;
                    $max = count($filtered);
                } else {
                    $max = $pageVal * 10; 
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
