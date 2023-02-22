<?php

namespace App\Services;

class GameService
{
    public function __construct()
    {

    }

    public static function getGameList()
    {
        $data1 = [
            'api_password' => 'tabella-kingschance!',
            'api_login' => 'tabella-kingschance-stage_mc_s',
            'method' => 'getGameList',
            'show_systems' => 0,
            'currency' => 'EUR',
        ];
        
        $curl = curl_init();
        
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://aggr.reeltech.co/api/seamless/providerisb",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30000,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_POSTFIELDS => json_encode($data1),
            CURLOPT_HTTPHEADER => array(
                // Set here requred headers
                "accept: */*",
                "accept-language: en-US,en;q=0.8",
                "content-type: application/json",
            ),
        ));
        
        $response = curl_exec($curl);
        $err = curl_error($curl);
        
        curl_close($curl);
        
        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
        //   print_r(json_decode($response));

          return json_decode($response);
          //return $response;
        }
    }
}