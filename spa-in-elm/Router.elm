module Router exposing (Screen(..), header, route, screenFromLocation, screens, url)

import Navigation exposing (Location)


type Screen
    = Main
    | First
    | Third
    | Second


type alias Route =
    { screen : Screen
    , url : String
    , header : String
    }


screens : List Route
screens =
    [ Route Main "" ""
    , Route First "first" "First Screen"
    , Route Second "second" "Second Screen"
    , Route Third "third" "Third Screen"
    ]


screenFromLocation : Location -> Screen
screenFromLocation location =
    let
        isCurrent { url } =
            "#" ++ url == Debug.log "location" location.hash

        screenList =
            List.filter isCurrent screens
    in
    case screenList of
        [ { screen } ] ->
            screen

        _ ->
            Main


route : Screen -> Maybe Route
route screen =
    let
        isCurrent route =
            route.screen == screen

        routes =
            List.filter isCurrent screens
    in
    case routes of
        [] ->
            Nothing

        route :: _ ->
            Just route


header : Screen -> String
header screen =
    case route screen of
        Just { header } ->
            header

        _ ->
            ""


url : Screen -> String
url screen =
    case route screen of
        Just { url } ->
            "#" ++ url

        _ ->
            ""
