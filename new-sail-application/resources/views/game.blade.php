<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $info['name'] }}</title>
</head>
<body>
    <iframe src="{{url($game['response'])}}" style="width:100%; height:100vh; border:none;"></iframe>
</body>
</html>
