## Run the project

1. start docker desktop
2. check-out repo main branch 
3. $ cd new-sail-application
4. $ sail composer install
5. $ ./vendor/bin/sail up
6. open Postman or Thunder client
7. test api calls

Get Game List:
- http://localhost:8080/games
- http://localhost:8080/games?filter=provider:reevo&page=2
- http://localhost:8080/games?filter=game:Tower-of-Babel

Get Game:
- http://localhost:8080/games/911873
- http://localhost:8080/games/912129
