<?php

namespace App\Http\Controllers;

use App\Http\Requests\Game\IndexRequest;
use App\Services\ShowcaseService;

class GameController extends Controller
{
    protected $showcaseService;

    public function __construct(ShowcaseService $showcaseService)
    {
        $this->showcaseService = $showcaseService;
    }

    public function index(IndexRequest $request, $id=null)
    {
        if ($id) {
            $response = $this->showcaseService->launch($id);
            $template = 'game';
        } else {
            $response = $this->showcaseService->gamesCollection($request);
            $template = 'game_list';
        }

        if ($response['error']) {
            abort(503); // service unavailable
        }

        return view($template, ['data' => $response]);
    }
}
