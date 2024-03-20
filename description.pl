describe(Location) :-
    picture(Location),                  
    describe_location(Location),       
    describe_objects(Location),        
    describe_available_paths(Location).

describe_location(Location) :-
    location(Location, Description),
    write('You are at '), write(Description), nl.

describe_objects(Location) :-
    (object(Name, Location, Description, _, _) ; item(Name, Location, Description, _)),
    write(Description), write(' ('), write(Name), write(').'), nl,
    fail.
describe_objects(_).

describe_available_paths(Location) :-
    findall(Path, path(Location, Path), Paths),
    write('You can go to: '), nl,
    describe_paths(Paths).

describe_paths([]).
describe_paths([H|T]) :-
    location(H, _),
    write('- '), write(H), nl,
    describe_paths(T).