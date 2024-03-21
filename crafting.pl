
:- dynamic recipe/5.

%recipe(itemA, itemb, [resultingthingNameList], [resultingObjectList], 'description').
recipe(stick, flintstone, [axe], [], 'You attach the flint stone to the stick and create an axe.').

% Raft stuff recipes.
recipe(stick, sheet, [sail], [] ,'You attach the sheet to the stick and create a sail.').
recipe(vine, bark, [hull], [] , 'You attach the bark to the vine and create a hull.').
recipe(vine, leafs, [shelter], [] , 'You sew the leafs together and create a shelter.').
recipe(bottleOfUnpurifiedWater, fire, [bottleOfPurifiedWater], [], 'You purify the water by boiling it.').
recipe(axe, coconut, [food], [], 'You use the axe to open the coconut and create food.').

% Hull recipe path.
recipe(axe, palmTrees, [bark,coconut], [], 'You cut the palm tree and create a stick.').

% Water recipe path.
recipe(glassBottle, waterPool, [bottleOfUnpurifiedWater], [], 'You fill the glass bottle with water from the pool.').
recipe(stick, cave, [], [fireplace], 'You gather some sticks and create a fireplace.').
recipe(fireplace, flintstone, [], [fire], 'You set the fireplace on fire and create a fire.').
recipe(bottleOfUnpurifiedWater, fire, [bottleOfPurifiedWater], [], 'You purify the water by boiling it.').



craft(ThingNameA, ThingNameB) :-
    location_check(ThingNameA, LocationA, ThingNameB, LocationB),
    (recipe(ThingNameA, ThingNameB, ResultingthingNamesList, ResultingObjectsList, Description) ; recipe(ThingNameB, ThingNameA, ResultingthingNamesList, ResultingObjectsList, Description)), 
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

retract_item(axe, _) :- !. % We don't want to remove the axe from the inventory.

%if thing is object do not remove it from the location
retract_item(ThingName, _) :-
    object(ThingName, _, _, _, _),
    !.

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

