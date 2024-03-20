% inventory.pl


inventory :-
    item(Name, inventory, _ , _),
    write(Name), nl,
    fail.


