<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;
use App\Services\GameService;
use Exception;

use Illuminate\Support\Facades\Http;

class ShowcaseService extends GameService
{
    public $gameId;
    public $validImage = [];
    
    public function __construct()
    {

    }

    public function validateImages($items) 
    {
        // Cache::flush();
        foreach($items as $item) {
            $this->validImage[$item['id']]['image'] = Cache::remember('game.image.' . $item['id'], config('global.cache.ttl'), function () use ($item) {
                $response = Http::head($item['image']);
                return ($response->status() !== 200) ? false : true;
            });
        }
    }

    public function launch($gameId) 
    {
        try {
            $this->gameId = $gameId;
            $gameList = Cache::get('game-list');
            $gameInfo = [];
            if ($gameList) {
                $gamesCollection = collect($gameList['response']);
                $filterResult = $gamesCollection->filter(function ($game, $k) use ($gameId) {
                    if ($game['id'] == $gameId) return $game; 
                });
                $gameInfo = $filterResult->all();
            }

            if (key($gameInfo) === null) {
                throw new Exception('Game ID not found');
            }

            $gameData = array_merge($this->getGame(), ['game_info' => $gameInfo[key($gameInfo)]]);

        } catch(Exception $e) {
            return ['error' => true, 'message' => $e->getMessage()];
        }
    
        return $gameData;
    }

    public function gamesCollection($request) 
    {     
        try {
            // Cache::flush();
            $games = Cache::remember('game-list', config('global.cache.ttl'), function () {
                return $this->getGameList();
            });

            if ($games['error']) {
                throw new Exception($games['message']);
            }

            $gamesCollection = collect($games['response']);
            $filteredList = $gamesCollection;

            if (isset($request->filter)) {
                if (Str::contains($request->filter, ['provider:','game:'])) {
                    $filterBy = $request->filter;
                    list($key, $value) = explode(':', $filterBy);
                    $value = str_replace("-", " ", $value);
                    $filteredList = $gamesCollection->filter(function ($val) use ($key, $value) {
                        switch ($key) {
                            case "provider":
                                return strtolower($val['category']) == strtolower($value);
                                break;
                    
                            case "game":
                                return (strtolower($val['name']) == strtolower($value) || strtolower($val['gamename']) == strtolower($value));
                                break;
                        }
                    });
                } else {
                    throw new Exception("Invalid filter parameter");
                }
            }

            $paginatedItems = $filteredList->paginate(config('global.pagination.perPage'));
            $paginatedItems->setPath('/games?filter=' . $request->filter);
            
            $this->validateImages($paginatedItems);

        } catch (Exception $e) {
            return ['error' => true, 'message' => $e->getMessage()];
        }
    
        return [
            'games' => $paginatedItems,
            'valid_images' => $this->validImage
        ];
    }
}