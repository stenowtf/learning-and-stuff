module Playground exposing (..)

import Html


escapeEarth : Float -> Float -> String -> String
escapeEarth velocity speed fuelStatus =
    let
        escapeVelocityInKmPerSec =
            11.186

        orbitalSpeedInKmPerSec =
            7.67

        whereToLand fuelStatus =
            if fuelStatus == "low" then
                "Land on droneship"
            else
                "Land on launchpad"
    in
    if velocity > escapeVelocityInKmPerSec then
        "Godspeed"
    else if speed == orbitalSpeedInKmPerSec then
        "Stay in orbit"
    else
        whereToLand fuelStatus


speed : Float -> Float -> Float
speed distance time =
    distance / time


time : number -> number -> number
time startTime endTime =
    endTime - startTime


weekday dayInNumber =
    case dayInNumber of
        0 ->
            "Sunday"

        1 ->
            "Monday"

        2 ->
            "Tuesday"

        3 ->
            "Wednesday"

        4 ->
            "Thursday"

        5 ->
            "Friday"

        6 ->
            "Saturday"

        _ ->
            "Unknown day"


hashtag dayInNumber =
    case weekday dayInNumber of
        "Sunday" ->
            "#SinDay"

        "Monday" ->
            "#MondayBlues"

        "Tuesday" ->
            "#TakeMeBackTuesday"

        "Wednesday" ->
            "#HumpDay"

        "Thursday" ->
            "#ThrowbackThursday"

        "Friday" ->
            "#FlashbackFriday"

        "Saturday" ->
            "#Caturday"

        _ ->
            "#Whatever"


whereToPark speed =
    case speed of
        7.67 ->
            "Low Earth Orbit"

        3.8 ->
            "Medium Earth Orbit"

        3.07 ->
            "Geostationary Orbit"

        _ ->
            "Nowhere"


revelation =
    """
    It became very clear to me sitting out there today
    that every decision I've made in my entire life has
    been wrong. My life is the complete "opposite" of
    everything I want it to be. Every instinct I have,
    in every aspect of life, be it something to wear,
    something to eat - it's all been wrong.
    """


descending a b =
    case compare a b of
        LT ->
            GT

        GT ->
            LT

        EQ ->
            EQ


evilometer character1 character2 =
    case ( character1, character2 ) of
        ( "Joffrey", "Ramsay" ) ->
            LT

        ( "Joffrey", "Night King" ) ->
            LT

        ( "Ramsay", "Joffrey" ) ->
            GT

        ( "Ramsay", "Night King" ) ->
            LT

        ( "Night King", "Joffrey" ) ->
            GT

        ( "Night King", "Ramsay" ) ->
            GT

        _ ->
            GT


main : Html.Html msg
main =
    [ "Night King", "Joffrey", "Ramsay" ]
        |> List.sortWith evilometer
        |> toString
        |> Html.text
