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


        $response = Http::withHeaders([
            'Content-Type' => 'application/json'
        ])->get('https://aggr.reeltech.co/api/seamless/providerisb', [
            RequestOptions::JSON => [
                'api_password' => 'tabella-kingschance!',
                'api_login' => 'tabella-kingschance-stage_mc_s',
                'method' => 'getGameList',
                'show_systems' => 0,
                'currency' => 'EUR',
                ]
        ]);

        dd($response->body());
        //print_r($response);
        // return new GameCollection($response);
    }

    public function index()
    {
        $data1 = [
            'api_password' => 'tabella-kingschance!',
            'api_login' => 'tabella-kingschance-stage_mc_s',
            'method' => 'getGameList',
            'show_systems' => 0,
            'currency' => 'EUR',
        ];
        
        $curl = curl_init();
        
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://aggr.reeltech.co/api/seamless/providerisb",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30000,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_POSTFIELDS => json_encode($data1),
            CURLOPT_HTTPHEADER => array(
                // Set here requred headers
                "accept: */*",
                "accept-language: en-US,en;q=0.8",
                "content-type: application/json",
            ),
        ));
        
        $response = curl_exec($curl);
        $err = curl_error($curl);
        
        curl_close($curl);
        
        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
          print_r(json_decode($response));
        }
    }
}
