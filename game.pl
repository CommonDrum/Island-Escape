location(cellar).
location(beachNorth).
location(beachSouth).
location(beachEast).
location(beachWest).
location(jungleEast).
location(jungleWest).




describe(cellar) :- write('You are in a dark, damp cellar. It seems to be empty.'), nl.
describe(beach) :- write('You are on a sandy beach. Waves are gently lapping at the shore.'), nl.
describe(jungle) :- write('You are in a dense jungle. The canopy above barely lets any light through.'), nl.

path(cellar, beachWest).

path(beachWest, cellar).
path(beachWest, beachSouth).
path(beachWest, beachNorth).
path(beachWest, jungleWest).

path(beachSouth, beachWest).
path(beachSouth, beachEast).
path(beachSouth, jungleEast).
path(beachSouth, jungleWest).

path(beachEast, beachSouth).
path(beachEast, jungleEast).
path(beachEast, beachNorth).

path(beachNorth, beachWest).
path(beachNorth, beachEast).
path(beachNorth, jungleEast).
path(beachNorth, jungleWest).

path(jungleEast, beachSouth).
path(jungleEast, beachEast).
path(jungleEast, beachNorth).
path(jungleEast, jungleWest).




move(Direction) :-
    current_location(CurrentLocation),
    path(CurrentLocation, Direction, NextLocation),
    retract(current_location(CurrentLocation)),
    asserta(current_location(NextLocation)),
    describe(NextLocation).

look :-
    current_location(Location),
    describe(Location).

command(move(Direction)) :- move(Direction).
command(look) :- look.

:- dynamic current_location/1.
start :-
    retractall(current_location(_)),
    asserta(current_location(cellar)),
    write('Welcome to the Island Adventure!'), nl,
    write('Type command(Action) to perform actions, e.g., command(move(north)).'), nl,
    describe(cellar).

