:- dynamic goal/3.
:- dynamic to_think/2.

goal(escape, "I have to escape this Island.", 0).

to_think("Water and food should be my priority. I should look around for some.", [goal(water, "I need to find water.", 50), goal(food, "I need to find food.", 50)]).

think :-
    to_think(Thought, Goals),
    writeln(Thought),
    add_goals(Goals),
    retract(to_think(Thought, Goals)),
<<<<<<< HEAD
    fail.

think :- 
    findall(D, goal(_, D, _), L),
    write(L), nl.


fulill_goal(Goal) :-
    goal(Goal, Description, Value),
    writeln('You have fulfilled a goal!'),
    writeln(Description),
    steps_remaining(X),
    Y is X + Value,
    retract(steps_remaining(X)),
    assertz(steps_remaining(Y)),
    retract(goal(Goal, Description, Value)).

fulill_goal.
=======
    logic,
    !.
>>>>>>> 9a4acf7965ff74c8c3d568251fc55949ea05450e

add_goals([]).
add_goals([goal(ID, Desc, Time) | Rest]) :-
    assertz(goal(ID, Desc, Time))
    add_goals(Rest).

see_goals :-
    goal(_, Description, _),
    write(Description), nl,
    fail.
see_goals.

