<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class GameService
{
    public $gameId;
    
    public function __construct()
    {

    }

    public function getGamePayload()
    {
        return [
            'api_password' => config('global.game.api.password'),
            'api_login' => config('global.game.api.login'),
            'method' => 'getGame',
            'currency' => config('global.game.currency'),
            'lang' => config('global.game.lang'),
            'homeurl' => '',
            'cashierurl' => '',
            'play_for_fun' => config('global.game.playForFun'),
            'sessionid' => 'this-identifies-the-casino-session',
            'gamesession_id' => 'this-identifies-the-game-sesion',
            'user_username' => 'simple_user',
            'user_password' => 'sample_token'
        ];
    }

    public function getGameListPayload()
    {
        return [
            'api_password' => config('global.game.api.password'),
            'api_login' => config('global.game.api.login'),
            'method' => 'getGameList',
            'show_systems' => 0,
            'currency' => config('global.game.currency'),
        ];
    }

    public function getGame()
    {
        
        $gameIdSetting = array('gameid' => $this->gameId);
        $payload = array_merge($gameIdSetting, $this->getGamePayload());
        
        $response = Http::withHeaders([
            'Content-Type' => 'application/json'
        ])->post(config('global.game.api.url'), $payload);

        $responseData = $response->json();

        return $responseData;
    }

    public function getGameList() 
    {        
        $response = Http::withHeaders([
            'Content-Type' => 'application/json'
        ])->post(config('global.game.api.url'), $this->getGameListPayload());

        $responseData = $response->json();

        return $responseData;
    }
}