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
:- dynamic inspected/1.

inspected(none).
steps_remaining(51).
boat(false, false, false, false).



inspect(bay):-
    current_location(beachNorth),
    \+ inspected(bay),
    assert(inspected(bay)),
    write('New Ideas in you head!'), nl, 
    assert(to_think("This is a good place to build a raft and escape. I think this might be my only option. I should create a hull, sail and somthing tho shelter me from the wind. I already know to find water and food. I should thake those with me.", [goal(buildBoat, "Build a raft M8!", 50)])),
    fail.

inspect(Object) :-
    object(Object, Location, _, _, ItemList),
    current_location(Location),
    add_items_to_inventory(ItemList),
    fail.

inspect(Object) :-
    (object(Object, Location, _, AfterInspect, _) ; item(Object, Location, _, AfterInspect)),
    current_location(Location),
    write(AfterInspect), nl,
    !.

inspect(Object) :-
    \+ (object(Object, _, _, _, _) ; item(Object, _, _, _)),
    write('There is no object or item called "'), write(Object), write('" here.'), nl.


take(Item) :-
    item(Item, Location, D, I),
    current_location(Location),
    \+ inInventory(Item),
    retract(item(Item, Location, _, _)),
    assert(item(Item, inventory, D, I)),
    write('You picked up the '), write(Item), write('.'), nl,
    logic,
    !.

move(Destination) :-
    current_location(Current),
    path(Current, Destination),
    retract(current_location(Current)),
    assert(current_location(Destination)),
    describe(Destination),
    logic,
    !.

move(_) :-
    write('You cannot go that way.'), nl,
    !.

raft_ready_to_build() :-
    item(sail, inventory , _ , _),
    item(hull, inventory, _, _),
    item(shelter, inventory, _, _),
    item(food, inventory, _, _),
    item(bottleOfPurifiedWater, inventory, _, _), !.

build_raft() :-
    raft_ready_to_build,
    current_location(beachNorth),
    retract(goal(escape, "I have to escape this Island.", 0)),
    write('You have escaped the island! You win!'), nl, !.

build_raft() :-
    \+ raft_ready_to_build,
    write('You do not have all the items to build a raft.'), nl, !.

build_raft() :-
    \+ current_location(beachNorth),
    write('This is not a good place to build a raft.'), nl, !.


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
    raft_ready_to_build,
    write('You have all the items to build a raft. You can now escape the island! Use build_raft to build it!'), nl,
    fail.

logic:- 
    steps_remaining(X),
    Y is X - 1,
    retract(steps_remaining(X)),
    assert(steps_remaining(Y)),
    write('You have '), write(Y), write(' steps remaining.'), nl,
    current_location(Location),
    describe(Location),
    !.


