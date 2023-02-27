<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Exception;

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

    public function validateResponse($response)
    {
        $responseData = $response->json();

        // check valid API url
        if ($response->getStatusCode() === 404) {
            throw new Exception('API URL not found');
        }

        if (isset($responseData['error']) && $responseData['error'] === 1) {
            throw new Exception($responseData['message']);
        }
    }

    public function getGame()
    {
        try {
            $gameIdSetting = array('gameid' => $this->gameId);
            $payload = array_merge($gameIdSetting, $this->getGamePayload());
            
            $response = Http::withHeaders([
                'Content-Type' => 'application/json'
            ])->post(config('global.game.api.url'), $payload);

            $this->validateResponse($response);

        } catch(Exception $e) {
            return ['error' => true, 'message' => $e->getMessage()];
        }

        return [
            'games' => $response->json(),
            'valid_images' => [] // @TODO remove this
        ];
    }

    public function getGameList() 
    {        
        try {
            $response = Http::withHeaders([
                'Content-Type' => 'application/json'
            ])->post(config('global.game.api.url'), $this->getGameListPayload());
    
            $this->validateResponse($response);
            
        } catch(Exception $e) {
            return ['error' => true, 'message' => $e->getMessage()];
        }
    
        return $response->json();;
    }
}