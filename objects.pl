% objects.pl

:-dynamic(object/5).
%obejct(Name, Location, Description, Inspection, Items, isInfinite).

object(largeRock, jungleSouth, 'There is a large rock nearby.', 'You come closer to the rock and discover a bunch of flintstones laying around it.', [flintstone, flintstone]).
object(waterPool, jungleSouth, 'You see a small pool of water.', 'Water! You can drink it, but it is not safe to drink. You need to purify it first.', []).
object(palmTrees, jungleNorth, 'You see a few palm trees.', 'The palm trees are tall and have coconuts hanging from them.', []).
object(cave, beachNorth, 'There is a small cave-like structure in the rocks.', 'It looks like a good place to stay, but it lacks come warmth...', []).
object(bush, jungleSouth, 'You see a bush with big leafs.', 'You strip the bush out of its leafs and gather some sticks.', [leafs]).
object(bay, beachNorth, 'Small bay gliters in the sun.', 'The water is calm and clear. You think it that if you had a boat, you could sail away from here.', []).
object(fire, none, 'You have created a fire!', 'The fire is warm and it feels nice being next to it.', []).
object(fireplace, none, 'You have created a fireplace!', 'Now you need to find something to set it on fire.', []).
object(vines, jungleNorth, 'You see some vines hanging from the trees.', 'You gather some vines.', [vine,vine]).


