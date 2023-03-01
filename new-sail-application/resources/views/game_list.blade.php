<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reevo</title>
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <style>
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .gallery-item {
            width: 300px;
            margin: 20px;
            text-align: center;
        }

        .gallery-item img {
            max-width: 100%;
            height: auto;
        }

        .gallery-item h2 {
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            height: 10px;
        }

        .pagination a {
            display: inline-block;
            margin: 0 10px;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: #eee;
            color: #333;
            text-decoration: none;
        }

        .pagination a.active {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>
    <!-- React root DOM -->
    <div id="example"></div>
    <div class="gallery">
        @foreach ($games as $game)
            <div class="gallery-item">
                <a href="{{ URL::to('games/' . $game['id']) }}" target="_blank">
                @if ($data_images[$game['id']]['image'])
                    <img src="{{ URL::to($game['image']) }}" alt="" width="100" height="100" />
                @else
                    <img src="{{ URL::to(asset('storage/' . config('global.game.defaultImage'))) }}" alt="no image" width="100" height="100" />
                @endif
                <h2>{{ $game['name'] }}</h2>
                </a>
            </div>
        @endforeach
    </div>
    <div class="pagination">
        {{ $games->links() }}
    </div>
    <!-- React JS -->
    <!-- <script src="{{ asset('js/app.js') }}" defer></script> -->
    @viteReactRefresh
    @vite('resources/js/app.jsx')
</body>
</html>
