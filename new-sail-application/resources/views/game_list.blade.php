<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Picture Gallery</title>
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
    <div class="gallery">
        <ul>
        @foreach ($data as $game)
            <li>
                <a href="{{ URL::to('games/' . $game['id']) }}" target="_blank">{{ $game['name'] }}
                @if ($data_images[$game['id']]['image'])
                    <img src="{{ URL::to($game['image']) }}" alt="" width="100" height="100" />
                @else
                    <img src="{{ URL::to(asset('storage/slot-default.png')) }}" alt="no image" width="100" height="100" />
                @endif
                </a>
            </li>
        @endforeach
        </ul>
    </div>
    <div class="pagination">
        {{ $data->links() }}
    </div>
</body>
</html>
