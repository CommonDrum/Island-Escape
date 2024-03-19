
:- dynamic craft/5.



craftR(itemA, itemb, [resultingthingNameList], [resultingObjectList], 'description').
craftR(glassBottle, waterPool, [bottleOfUnpurifiedWater], [], 'You fill the glass bottle with water from the pool.').
craftR(bottleOfUnpurifiedWater, fire, [bottleOfPurifiedWater], [], 'You purify the water by boiling it.').
craftR(hardStick, flintStone, [axe], [], 'You attach the flint stone to the stick and create an axe.').
craftR(hardStick, cave, [], [fireplace], 'You gather some sticks and create a fireplace.').
craftR(fireplace, flintStone, [], [fire], 'You set the fireplace on fire and create a fire.').
craftR(1,2,[3],[],'Yes it is three!').

craft(thingNameA, thingNameB) :-
    location_check(thingNameA, thingNameB),
    craftR(thingNameA, thingNameB, ResultingthingNames, ResultingObjects, Description),
    remove_item(thingNameA),
    remove_item(thingNameB),
    add_items(ResultingthingNames),
    add_objects(ResultingObjects),
    write(Description), nl.

craft(_, _) :-
    write('You cannot craft these items together.'), nl,
    fail.


location_check(ThingNameA, ThingNameB) :-
    (item(ThingNameA, LocationA, _, _) ; object(ThingNameA, LocationA, _, _, _)),
    (item(ThingNameB, LocationB, _, _) ; object(ThingNameB, LocationB, _, _, _)),
    (
        (LocationA = inventory ; LocationB = inventory) ;
        (current_location(currentLocation), LocationA = currentLocation, LocationB = currentLocation)
    ),
    !.

location_check(_, _) :-
    write('You cannot craft these items together. They are not in the same location.'), nl,
    fail.

add_items([]) :- !.
add_items([Item | Rest]) :-
    Item =.. [Name, Location, Description, Interaction],
    assertz(item(Name, Location, Description, Interaction)),
    add_items(Rest).

create_object([]) :- !.
create_object([Object | Rest]) :-
    Object =.. [Name, Location, Description, Interaction, ItemsReturned],
    assertz(object(Name, Location, Description, Interaction, ItemsReturned)),
    create_object(Rest).