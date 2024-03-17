% inventory.pl

% Dynamic predicate for inventory
:- dynamic(inInventory/1).

% Inventory
inventory :-
    inInventory(Item),
    write('You have a '), write(Item), write(' in your inventory.'), nl,
    fail.

inventory :-
    \+ inInventory(_),
    write('Your inventory is empty.'), nl.
