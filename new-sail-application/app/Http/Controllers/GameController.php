<?php

namespace App\Http\Controllers;

// use Illuminate\Http\Request;

use App\Http\Requests\Game\IndexRequest;
use App\Http\Resources\GameCollection;
use App\Models\Game;
use App\Services\GameService;

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
        //     RequestOptions::JSON => [
        //         'api_password' => 'tabella-kingschance!',
        //         'api_login' => 'tabella-kingschance-stage_mc_s',
        //         'method' => 'getGameList',
        //         'show_systems' => 0,
        //         'currency' => 'EUR',
        //         ]
        // ]);

        // $response = Http::withHeaders([
        //     'Content-Type' => 'application/json'
        // ])->get('https://aggr.reeltech.co/api/seamless/providerisb', ["{
        //     'api_password':'tabella-kingschance!',
        //     'api_login':'tabella-kingschance-stage_mc_s',
        //     'method':'getGameList',
        //     'show_systems':0,
        //     'currency':'EUR',
        // }"]);


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
        // return new GameCollection(GameService::getGameList());

        $games = GameService::getGameList();
        $gamesCollection = collect($games->response)->slice(0, 3);
        dd($gamesCollection->all());


    }
}
