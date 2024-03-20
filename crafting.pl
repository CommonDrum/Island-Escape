
:- dynamic recipe/5.

%recipe(itemA, itemb, [resultingthingNameList], [resultingObjectList], 'description').
recipe(glassBottle, waterPool, [bottleOfUnpurifiedWater], [], 'You fill the glass bottle with water from the pool.').
recipe(bottleOfUnpurifiedWater, fire, [bottleOfPurifiedWater], [], 'You purify the water by boiling it.').
recipe(hardStick, flintStone, [axe], [], 'You attach the flint stone to the stick and create an axe.').
recipe(hardStick, cave, [], [fireplace], 'You gather some sticks and create a fireplace.').
recipe(fireplace, flintStone, [], [fire], 'You set the fireplace on fire and create a fire.').
recipe(t1, t2, [t3], [], 'Yes it is three!').

craft(ThingNameA, ThingNameB) :-
    location_check(ThingNameA, LocationA, ThingNameB, LocationB),
    recipe(ThingNameA, ThingNameB, ResultingthingNamesList, ResultingObjectsList, Description),
    retract_item(ThingNameA, LocationA),
    retract_item(ThingNameB, LocationB),
    add_crafted_things(ResultingthingNamesList, ResultingObjectsList),
    write(Description), nl, !.

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

retract_item(ThingName, Location) :-
    item(ThingName, Location, Description, Usage),
    retract(item(ThingName, Location, Description, Usage)).

add_crafted_things(ResultingthingNamesList, ResultingObjectsList) :-
    add_crafted_items_to_inventory(ResultingthingNamesList),
    add_crafted_objects_to_location(ResultingObjectsList).

add_crafted_items_to_inventory([]).
add_crafted_items_to_inventory([Item | Rest]) :-
    assertz(item(Item, inventory, 'Crafted item', 'Can be used')),
    add_crafted_items_to_inventory(Rest).

add_crafted_objects_to_location([]).
add_crafted_objects_to_location([Object | Rest]) :-
    current_location(CurrentLocation),
    assertz(object(Object, CurrentLocation, 'Crafted object', 'Can be picked up', 'Can be used')),
    add_crafted_objects_to_location(Rest).

