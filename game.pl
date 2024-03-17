% main.pl

:- consult('locations.pl').
:- consult('objects.pl').
:- consult('items.pl').
:- consult('description.pl').
:- consult('inventory.pl').

inspect(Object) :-
    object(Object, Location, _, AfterInspect, _),
    current_location(Location),
    write(AfterInspect), nl.

inspect(Item) :-
    item(Item, Location, _, AfterInspect),
    current_location(Location),
    write(AfterInspect), nl.

take(Item) :-
    item(Item, Location, _, _),
    current_location(Location),
    \+ inInventory(Item),
    assert(inInventory(Item)),
    write('You picked up the '), write(Item), write('.'), nl.

move(Destination) :-
    current_location(Current),
    path(Current, Destination),
    retract(current_location(Current)),
    assert(current_location(Destination)),
    describe(Destination).

move(_) :-
    write('You cannot go that way.'), nl.

look :-
    current_location(Location),
    describe(Location).

start :-
    assert(current_location(beachSouth)),
    write('Welcome to the text-based adventure game!'), nl,
    describe(beachSouth).
