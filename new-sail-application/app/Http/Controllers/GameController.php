<?php

namespace App\Http\Controllers;

use App\Http\Requests\Game\IndexRequest;
use App\Services\ShowcaseService;
use Exception;

class GameController extends Controller
{
    protected $showcaseService;

    public function __construct(ShowcaseService $showcaseService)
    {
        $this->showcaseService = $showcaseService;
    }

    public function index(IndexRequest $request, $id=null)
    {
        try {
            if ($id) {
                $response = $this->showcaseService->launch($id);

                if (isset($response['error']) && $response['error']) {
                    throw new Exception($response['message'] ?? 'Something went wrong');
                }

                return view('game', ['game' => $response['games'], 'info' => $response['game_info']]);

            } else {
                $response = $this->showcaseService->gamesCollection($request);

                if (isset($response['error']) && $response['error']) {
                    throw new Exception($response['message'] ?? 'Something went wrong');
                }

                return view('game_list', ['games' => $response['games'], 'data_images' => $response['valid_images']]);
            }
        } catch(Exception $e) {
            return view('game_error', ['error' => true, 'message' => $e->getMessage()]);
        }
    }
}
