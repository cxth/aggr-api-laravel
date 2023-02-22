## Run the project

1. start docker desktop
2. check-out repo main branch 
3. $ cd new-sail-application
4. $ sail composer install
5. $ ./vendor/bin/sail up
6. open Postman or Thunder client
7. test api calls


http://localhost/api/games?filter=page:all
http://localhost/api/games?filter=page:2
http://localhost/api/games?filter=provider:reevo|page:2
http://localhost/api/games?filter=game:Tower-of-Babel
