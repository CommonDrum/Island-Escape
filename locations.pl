% locations.pl

location(beachNorth, "Hey").
location(beachSouth, "123").
location(jungleSouth, "123").
location(jungleNorth, "123").
location(cellar).

direct_path(beachSouth, beachNorth).
direct_path(beachSouth, jungleSouth).
direct_path(jungleSouth, jungleNorth).
direct_path(beachNorth, jungleNorth).
direct_path(cellar, beachNorth).

path(X, Y) :- direct_path(X, Y).
path(X, Y) :- direct_path(Y, X).