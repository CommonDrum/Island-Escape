% locations.pl

location(beachNorth, "North Beach: You find yourself in a serene oasis on the north side of the island. The gentle waves lap against the shore, creating a soothing rhythm. Palm trees sway in the warm breeze, providing shade and a sense of tranquility. The soft sand beneath your feet invites you to relax and take in the peaceful surroundings.").
location(beachSouth, "South Beach: You stand on the southern shore of the island, where your ship met its unfortunate fate. The powerful waves crash against the coastline, and the strong wind whips through your hair. Scattered around the beach are bits and pieces of the wrecked ship, but nothing seems particularly useful for your survival. The vast expanse of the ocean stretches out before you, a reminder of the challenges that lie ahead.").
location(jungleSouth, "South Jungle: As you venture into the southern part of the island's jungle, you find yourself surrounded by dense vegetation. The air is humid, and the canopy above filters the sunlight, creating a green-tinted ambiance. The undergrowth is rich with various plants, vines, and small trees, providing a sense of lushness and potential resources for your survival.").
location(jungleNorth, "North Jungle: You enter the heart of the island's jungle, where towering palm trees dominate the landscape. The air is thick with the scent of tropical foliage, and the sounds of exotic birds echo through the dense greenery. The jungle floor is littered with fallen leaves and branches, and the occasional clearing offers a momentary respite from the oppressive heat. This untamed wilderness holds both beauty and hidden dangers.").
location(cellar).

direct_path(beachSouth, beachNorth).
direct_path(beachSouth, jungleSouth).
direct_path(jungleSouth, jungleNorth).
direct_path(beachNorth, jungleNorth).
direct_path(cellar, beachNorth).

path(X, Y) :- direct_path(X, Y).
path(X, Y) :- direct_path(Y, X).

% This ascii art is taken from https://www.asciiart.eu/nature/beaches the initials of the artist are left unchanged.

picture(beachNorth) :-
    writeln('_\\/_                 |                _\\/_'),
    writeln('/o\\\\             \\       /            //o\\'),
    writeln(' |                 .---.                |'),
    writeln('_|_______     --  /     \\  --     ______|__'),
    writeln('         `~^~^~^~^~^~^~^~^~^~^~^~` jgs').

picture(beachSouth) :-
    writeln('_\\/_                                  _\\/_'),
    writeln('/o\\\\                                   //o\\'),
    writeln(' |                                      |'),
    writeln('_|_______________________________________|__ ' ).

picture(jungleNorth) :-
    writeln('           _  _             _  _'),
    writeln('  .       /\\/%\\       .   /%\\/%\\     .'),
    writeln('      __.<\\%#//\\,_       <%%#/%%\\,__  .'),
    writeln('.    <%#/|\\%%%#///\\    /^%%#%%\\///%#\\\\'),
    writeln('      ""/%/""\\ \\""//|   |/""\'/ /\\//""//\''),
    writeln(' .     L/\'`   \\ \\  `    "   / /  ```'),
    writeln('        `      \\ \\     .   / /       .'),
    writeln(' .       .      \\ \\       / /  .'),
    writeln('        .        \\ \\     / /          .'),
    writeln('   .      .    ..:\\ \\:::/ /:.     .     .'),
    writeln('______________/ \\__;\\___/\\;_/\\________________________________'),
    writeln('YwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYw').

picture(jungleSouth) :-
    writeln('           _  _             _  _'),
    writeln('  .       /\\/%\\       .   /%\\/%\\     .'),
    writeln('      __.<\\%#//\\,_       <%%#/%%\\,__  .'),
    writeln('.    <%#/|\\%%%#///\\    /^%%#%%\\///%#\\\\'),
    writeln('      ""/%/""\\ \\""//|   |/""\'/ /\\//""//\''),
    writeln(' .     L/\'`   \\ \\  `    "   / /  ```'),
    writeln('        `      \\ \\     .   / /       .'),
    writeln(' .       .      \\ \\       / /  .'),
    writeln('        .        \\ \\     / /          .'),
    writeln('   .      .    ..:\\ \\:::/ /:.     .     .'),
    writeln('______________/ \\__;\\___/\\;_/\\________________________________'),
    writeln('YwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYwYw').

