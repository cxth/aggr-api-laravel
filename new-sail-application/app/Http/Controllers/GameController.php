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
                $template = 'game';
            } else {
                $response = $this->showcaseService->gamesCollection($request);
                $template = 'game_list';
            }

            if ($response['games']['error']) {
                throw new Exception($response['games']['message']);
            }

        } catch(Exception $e) {
            return view('game_error', ['error' => $response['games']]);
        }

        // return view($template, ['data' => $response]);
        return view($template, [
            'data' => $response['games'],
            'data_images' => $response['valid_images']
        ]);
    }
}
