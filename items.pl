% items.pl

:-dynamic(item/4).

item(driftwood, beachSouth, 'You see a piece of driftwood on the beach.', 'The driftwood seems sturdy and could be useful.').
item(glassBottle, beachSouth, 'A glass bottle is lying on the sand.', 'The glass bottle contains a mysterious message inside.').
item(flintStone, _, 'You spot a small flint stone.', 'The flint stone has sharp edges and could be used to start a fire.').
item(oldBarrels, cellar, 'There are some old barrels in the cellar.', 'The barrels are empty and covered in cobwebs.').
item(oldCrates, cellar, 'You notice a few old crates in the corner.', 'The crates contain some ancient artifacts.').
item(cocoNut, _, 'Coconuts are hanging from the trees.', 'The coconuts are ripe and can be eaten. But you need to find a way to open them.').
item(hardStick, _, 'You see a hard stick on the ground.', 'The stick is sturdy and may be useful for crafting.').
item(bigLeafs, _, 'There are many bushes with big leafs.', 'The leafs are big and can be used to make a shelter.').
item(bottleOfUnpurifiedWater, _, _, 'The water is not safe to drink. You need to purify it first.').
item(bottleOfPurifiedWater, _, _, 'The water is safe to drink.').
item(textileSheet, beachSouth, 'A big textile sheet is stuck on a branch. It looks like ripped sail.', 'The sheet is big and not damaged. It sure will be useful for something.').
