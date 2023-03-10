<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class GameCollection extends ResourceCollection
{
    public static $wrap = '';
    
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    // public function toArray(Request $request): array
    // {
    //     //print_r($request);
        
    //     // return parent::toArray($request);
    //     return [
    //        'id' => $this->collection,
    //        'gameCount' => $this->count() 
    //     ];
    // }

    public function __construct($resource)
    {
        $collection = collect($resource->response)->slice(0, 3);
        return $collection->all();
    }


    // public function toArray(Request $request)
    // {
    //     $collection = collect($request->response)->slice(0, 3);
    //     return $collection->all();
    // }
}
