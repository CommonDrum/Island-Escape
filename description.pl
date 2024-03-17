describe(Location) :-

    describeLocation(Location),

    describeObjects(Location),

    describeItems(Location),

    writePaths(Location).

describeLocation(Location) :-
    location(Location, Description),
    write(Description), nl.

describeObjects(Location) :-
    object(_, Location, BeforeInspect, _, _),
    write(BeforeInspect), nl,
    fail.
describeObjects(_).

describeItems(Location) :-
    item(Item, Location, BeforeInspect, _),
    \+ inInventory(Item),
    write(BeforeInspect), nl,
    fail.
describeItems(_):- write("").

writePaths(Location) :-
    write(Location), write(' to: '), nl,
    describePath(Location, [Location]),
    fail.
writePaths(_).

describePath(Location, Visited) :-
    path(Location, Destination),
    \+ memberchk(Destination, Visited),
    write('- '), write(Destination), nl,
    describePath(Destination, [Destination | Visited]).
describePath(_, _).
