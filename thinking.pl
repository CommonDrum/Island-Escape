:- dynamic goal/3.
:- dynamic to_think/2.

goal(escape, "I have to escape this Island.", 0).

to_think("Water and food should be my priority. I should look around for some.", [goal(water, "I need to find water.", 50), goal(food, "I need to find food.", 50)]).

think :-
    to_think(Thought, Goals),
    writeln(Thought),
    add_goals(Goals),
    retract(to_think(Thought, Goals)),
    logic,
    !.

add_goals([]).
add_goals([goal(ID, Desc, Time) | Rest]) :-
    assertz(goal(ID, Desc, Time))
    add_goals(Rest).

see_goals :-
    goal(_, Description, _),
    write(Description), nl,
    fail.
see_goals.

