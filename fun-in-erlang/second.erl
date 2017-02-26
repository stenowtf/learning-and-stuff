-module(second).
-export([hypotenuse/2,perimeter/2,area/2]).

hypotenuse(A, B) ->
    math:sqrt(first:square(A) + first:square(B)).
perimeter(A, B) ->
    hypotenuse(A, B) + A + B.
area(A, B) ->
    S = perimeter(A, B) / 2,
    math:sqrt(S * (S - hypotenuse(A, B)) * (S - A) * (S - B)).
