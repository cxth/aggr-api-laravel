<?php

return [
    'pagination' => [
       'perPage' => '12'
    ],

    'cache' => [
        'ttl' => '86400' // 1 day
    ],

    'game' => [
        'api' => [
            'login' => env('AGGR_API_LOGIN', 'tabella-kingschance-stage_mc_s'),
            'password' => env('AGGR_API_PASSWORD', 'tabella-kingschance!'),
            'url' => env('AGGR_API_SEAMLESS_ISB', 'https://aggr.reeltech.co/api/seamless/providerisb'),
        ],
        'currency' => 'EUR',
        'lang' => 'en',
        'playForFun' => 'true'
    ]
];
