describe(Location) :-
    describe_location(Location),        % Describe the location itself.
    describe_objects(Location),         % Describe objects at the location.
    describe_available_paths(Location). % List paths available from this location.

describe_location(Location) :-
    location(Location, Description),
    write('You are at '), write(Description), nl.

describe_objects(Location) :-
    (object(Name, Location, Description, _, _) ; item(Name, Location, Description, _)),
    write(Description), write(' here ('), write(Name), write(').'), nl,
    fail.
describe_objects(_).

describe_available_paths(Location) :-
    findall(Path, path(Location, Path), Paths),
    write('You can go to: '), nl,
    describe_paths(Paths).

describe_paths([]).
describe_paths([H|T]) :-
    location(H, _),
    write('- '), write(H), nl,
    describe_paths(T).