% locations.pl

location(beachNorth, "Hey").
location(beachSouth, "123").
location(jungleSouth, "123").
location(jungleNorth, "123").
location(cellar).

path(beachSouth, beachNorth).
path(beachSouth, jungleSouth).
path(jungleSouth, jungleNorth).
path(beachNorth, jungleNorth).
path(cellar, beachNorth).
path(X, Y) :- path(Y, X), X \= Y.
