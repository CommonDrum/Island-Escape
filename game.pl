% main.pl

:- consult('locations.pl').
:- consult('objects.pl').
:- consult('items.pl').
:- consult('description.pl').
:- consult('inventory.pl').
:- consult('thinking.pl').
:- consult('crafting.pl').

:- dynamic current_location/1.
:- dynamic inInventory/1.
:- dynamic steps_remaining/1.

steps_remaining(51).
boat(false, false, false, false).

inspect(Object) :-
    object(Object, Location, _, AfterInspect, _),
    current_location(Location),
    write(AfterInspect), nl,
    logic.

inspect(Item) :-
    item(Item, Location, _, AfterInspect),
    current_location(Location),
    write(AfterInspect), nl,
    logic.

take(Item) :-
    item(Item, Location, _, _),
    current_location(Location),
    \+ inInventory(Item),
    assert(inInventory(Item)),
    write('You picked up the '), write(Item), write('.'), nl,
    logic.

move(Destination) :-
    current_location(Current),
    path(Current, Destination),
    retract(current_location(Current)),
    assert(current_location(Destination)),
    describe(Destination),
    logic.

move(_) :-
    write('You cannot go that way.'), nl.

look :-
    current_location(Location),
    describe(Location).


help :-
    write('Available commands:'), nl,
    write('inspect(Object/Item) - Inspect an object/item.'), nl,
    write('take(Item) - Take an item.'), nl,
    write('move(Destination) - Move to a new location.'), nl,
    write('look - Look around the current location.'), nl,
    write('inventory - List the items in your inventory.'), nl,
    write('craft(Item) - Craft an item.'), nl,
    write('commands - List available commands.'), nl.

start :-
    assert(current_location(beachSouth)),
    write('Welcome to the text-based adventure game!'), nl,
    write('Use the "help" command to see available commands.'), nl,
    help,
    logic.

game_loop :-
    steps_remaining(0),
    write('You have run out of time! You die :('), nl,
    !.

game_loop :-
    boat(true, true, true, true),
    write('You have fixed the boat and escaped the island! You win!'), nl,
    !.

logic:- 
    steps_remaining(X),
    Y is X - 1,
    retract(steps_remaining(X)),
    assert(steps_remaining(Y)),
    write('You have '), write(Y), write(' steps remaining.'), nl,
    current_location(Location),
    describe(Location).


