% Define the locations
location(cellar).
location(beach).
location(jungle).

% Describe each location
describe(cellar) :- write('You are in a dark, damp cellar. It seems to be empty.'), nl.
describe(beach) :- write('You are on a sandy beach. Waves are gently lapping at the shore.'), nl.
describe(jungle) :- write('You are in a dense jungle. The canopy above barely lets any light through.'), nl.

% Define paths between locations
path(cellar, east, beach). % You can go east from the cellar to the beach
path(beach, west, cellar). % You can go west from the beach to the cellar
path(beach, north, jungle). % You can go north from the beach to the jungle
path(jungle, south, beach). % You can go south from the jungle to the beach

% Moving between locations
move(Direction) :-
    current_location(CurrentLocation),
    path(CurrentLocation, Direction, NextLocation),
    retract(current_location(CurrentLocation)),
    asserta(current_location(NextLocation)),
    describe(NextLocation).

% Helper to look around the current location
look :-
    current_location(Location),
    describe(Location).

% Command interpreter
command(move(Direction)) :- move(Direction).
command(look) :- look.

% Initialize game state
:- dynamic current_location/1.
start :-
    retractall(current_location(_)),
    asserta(current_location(cellar)),
    write('Welcome to the Island Adventure!'), nl,
    write('Type command(Action) to perform actions, e.g., command(move(north)).'), nl,
    describe(cellar).

