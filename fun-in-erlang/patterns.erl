-module(patterns).
-export([xOr_1/2, xOr_2/2, xOr_3/2, maxThree/3, howManyEqual/3]).

xOr_1(true, false) ->
    true;
xOr_1(false, true) ->
    true;
xOr_1(_, _) ->
    false.

xOr_2(X, X) ->
    false;
xOr_2(_, _) ->
    true.

xOr_3(true, X) ->
    not(X);
xOr_3(false, X) ->
    X.

% xOr_4 ? xOr_5 ? :(

maxThree(A, B, C) ->
    max(max(A, B), C).

howManyEqual(X, X, X)
    -> 3;
howManyEqual(X, X, _)
    -> 2;
howManyEqual(X, _, X)
    -> 2;
howManyEqual(_, X, X)
    -> 2;
howManyEqual(_, _, _)
    -> 0.
