<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\ShowcaseService;

class GameServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton('showcase', function ($app) {
            return new ShowcaseService();
        });
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
