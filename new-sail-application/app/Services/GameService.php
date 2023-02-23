<?php

namespace App\Services;
use Illuminate\Support\Facades\Http;

class GameService
{
    public function __construct()
    {

    }

    public function getGame($id)
    {
        $response = Http::withHeaders([
            'Content-Type' => 'application/json'
        ])->post('https://aggr.reeltech.co/api/seamless/providerisb', [
            'api_password' => 'tabella-kingschance!',
            'api_login' => 'tabella-kingschance-stage_mc_s',
            'method' => 'getGame',
            'currency' => 'EUR',
            'lang' => 'en',
            'gameid' => $id,
            'homeurl' => '',
            'cashierurl' => '',
            'play_for_fun' => 'true',
            'sessionid' => 'this-identifies-the-casino-session',
            'gamesession_id' => 'this-identifies-the-game-sesion',
            'user_username' => 'simple_user',
            'user_password' => 'sample_token'
            ]);

        $responseData = $response->json();
        // $responseData = $response->collect();
        // dd($responseData);
        return $responseData;
    }

    public static function getGameList() 
    {
        $response = Http::withHeaders([
            'Content-Type' => 'application/json'
        ])->post('https://aggr.reeltech.co/api/seamless/providerisb', [
            'api_password' => 'tabella-kingschance!',
            'api_login' => 'tabella-kingschance-stage_mc_s',
            'method' => 'getGameList',
            'show_systems' => 0,
            'currency' => 'EUR',
            ]);

        $responseData = $response->json();
        // $responseData = $response->collect();
        // dd($responseData);
        return $responseData;

        // return $response;
    }
}