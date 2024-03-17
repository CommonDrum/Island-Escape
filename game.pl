description(cellar) :-
    !visited(cellar),
    write('You are in the cellar. It is dark and damp. You can see a it is full of old barrels and crates.'),
    assert(visited(cellar)), nl.

desctiption(cellar) :-
    write('You are in the cellar. It is dark and damp. You can see a it is full of old barrels and crates.'), nl.


location(beachNorth).
location(beachSouth).
location(jungleSouth).
location(jungleNorth).
location(cellar).

path(beachSouth , beachNorth).
path(beachSouth , jungleSouth).
path(jungleSouth , jungleNorth).
path(beachNorth , jungleNorth).
path(cellar, beachNorth).
path(X,Y) :- path(Y,X).

move(location) :-
    current_location(Here),
    path(Here, There),
    retract(current_location(Here)),
    assert(current_location(There)),
    describe(There).

move(_) :-
    write('You can''t go that way.'), nl.

look :-
    current_location(Location),
    describe(Location).


start :-

