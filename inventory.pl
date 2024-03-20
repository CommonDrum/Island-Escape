% inventory.pl

:- dynamic(inInventory/1).

inInventory(Item) :-
    item(Item,inventory,_,_).

inventory :-
    inInventory(Item),
    write('You have a '), write(Item), write(' in your inventory.'), nl,
    fail.

inventory :-
    \+ inInventory(_),
    write('Your inventory is empty.'), nl.
