% items.pl

:-dynamic(item/4).

% Item definitions
% TODO: Shorten the names
item(leafs, none, 'There are many bushes with big leafs.', 'The leafs are big and can be used to make a shelter.').
item(flintstone, none, 'There are flint stones scattered around.', 'The flint stones are sharp and can be used to create tools.').
item(stick, none, 'There are sticks lying around.', 'The sticks can be used for various purposes.').
item(sheet, none, 'There is a sheet of fabric.', 'The sheet can be used to create a sail.').
item(vine, none, 'There are vines hanging from the trees.', 'The vines are strong and can be used to create a hull.').
item(bark, none, 'There are pieces of bark on the ground.', 'The bark can be used to create a hull.').
item(bottleOfUnpurifiedWater, none, 'There is a bottle of unpurified water.', 'The water needs to be purified before drinking.').
item(coconut, none, 'There are coconuts on the ground.', 'The coconuts can be opened to obtain food.').
item(glassBottle, none, 'There is an empty glass bottle.', 'The glass bottle can be used to collect water.').
item(bottleOfPurifiedWater, none, 'There is a bottle of purified water.', 'The water is safe to drink.').

% Item placements
item(stick, beachSouth, 'You see a hard stick on the ground.', 'The stick is sturdy and may be useful for crafting.').
item(stick, jungleSouth, 'You see a hard stick on the ground.', 'The stick is sturdy and may be useful for crafting.').
item(stick, jungleNorth, 'You see a hard stick on the ground.', 'The stick is sturdy and may be useful for crafting.').
item(glassBottle, beachSouth, 'A glass bottle is lying on the sand.', 'The glass bottle contains a mysterious message inside.').
item(sheet, beachSouth, 'A big textile sheet is stuck on a branch. It looks like ripped sail.', 'The sheet is big and not damaged. It sure will be useful for something.').

% Items for raft TEST
%item(sail, inventory, 'A big textile sheet is stuck on a branch. It looks like ripped sail.', 'The sheet is big and not damaged. It sure will be useful for something.').
%item(hull, inventory, 'There are vines hanging from the trees.', 'The vines are strong and can be used to create a hull.').
%item(shelter, inventory, 'There are many bushes with big leafs.', 'The leafs are big and can be used to make a shelter.').
%item(bottleOfPurifiedWater, inventory, 'There is a bottle of purified water.', 'The water is safe to drink.').
%item(food, inventory, 'There are coconuts on the ground.', 'The coconuts can be opened to obtain food.').

add_items_to_inventory([]).
add_items_to_inventory([Item | Rest]) :-
    item(Item, none, D, I),
    assert(item(Item, inventory, D, I)),
    add_items_to_inventory(Rest).
