<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

use App\Services\GameService;

class ShowcaseService extends GameService
{
    public $gameId;
    
    public function __construct()
    {

    }

    public function launch($gameId) 
    {
        $this->gameId = $gameId;
        return $this->getGame();
    }

    public function gamesCollection($request) 
    {     
        // Cache::flush();
        $games = Cache::remember('game-list', config('global.cache.ttl'), function () {
            return $this->getGameList();
        });
        
        $gamesCollection = collect($games['response']);
        $filteredList = $gamesCollection;

        if (isset($request->filter) && Str::contains($request->filter, [':','provider','game'])) {
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
        }

        $paginatedItems = $filteredList->paginate(config('global.pagination.perPage'));
        $paginatedItems->setPath('/games?filter=' . $request->filter);

        return $paginatedItems;
    }
}