
:- dynamic recipe/5.

%recipe(itemA, itemb, [resultingthingNameList], [resultingObjectList], 'description').
recipe(glassBottle, waterPool, [bottleOfUnpurifiedWater], [], 'You fill the glass bottle with water from the pool.').
recipe(bottleOfUnpurifiedWater, fire, [bottleOfPurifiedWater], [], 'You purify the water by boiling it.').
recipe(hardStick, flintStone, [axe], [], 'You attach the flint stone to the stick and create an axe.').
recipe(hardStick, cave, [], [fireplace], 'You gather some sticks and create a fireplace.').
recipe(fireplace, flintStone, [], [fire], 'You set the fireplace on fire and create a fire.').
recipe(t1,t2,[t3],[],'Yes it is three!').

craft(ThingNameA, ThingNameB) :-
    location_check(ThingNameA, LocationA, ThingNameB, LocationB),
    recipe(ThingNameA, ThingNameB, ResultingthingNamesList, ResultingObjectsList, Description),
    retract_items(ThingNameA, LocationA, ThingNameB, LocationB),
    write(Description), nl.

craft(_, _) :-
    write('You cannot craft these items together.'), nl.

location_check(ThingNameA, LocationA, ThingNameB, LocationB) :-
    (item(ThingNameA, LocationA, _, _) ; object(ThingNameA, LocationA, _, _, _)),
    (item(ThingNameB, LocationB, _, _) ; object(ThingNameB, LocationB, _, _, _)),
    (
        (LocationA = inventory ; LocationB = inventory) ;
        (current_location(currentLocation), LocationA = currentLocation, LocationB = currentLocation)
    ),
    !.

location_check(_, _, _, _) :-
    write('You cannot craft these items together. They are not in the same location or your inventory.'), nl.

retract_items(ThingNameA, LocationA, ThingNameB, LocationB) :-
    retract_item(ThingNameA, LocationA),
    retract_item(ThingNameB, LocationB).

retract_item(ThingName, Location) :-
    item(ThingName, Location, Description, Usage),
    retract(item(ThingName, Location, Description, Usage)).
