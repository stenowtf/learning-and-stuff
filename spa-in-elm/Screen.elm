module Screen exposing (..)

import Html exposing (Html, text)
import Material
import Material.Badge as Badge
import Material.Button as Button
import Material.Color as Color
import Material.Icon as Icon
import Material.Layout as Layout
import Material.Options as Options exposing (Property, cs, css)
import Model exposing (Model)
import Router
import Update exposing (Msg(..), wrapScreen)


type alias Render =
    Model -> List (Html Msg)


defaultLayout : Model -> Render -> Html Msg
defaultLayout model viewBody =
    Layout.render Mdl
        model.mdl
        [ Layout.fixedHeader
        ]
        { header = [ viewHeader model ]
        , drawer = [ model |> drawerElements |> viewDrawer ]
        , tabs = ( viewTabs model, [ css "cursor" "pointer" ] )
        , main = viewBody model
        }


viewHeader : Model -> Html Msg
viewHeader model =
    Layout.row
        []
        [ Layout.title []
            [ text <| Router.header model.screen ]
        , Layout.navigation []
            []
        ]


viewTabs : Model -> List (Html msg)
viewTabs model =
    []


viewDrawer : List (Html msg) -> Html msg
viewDrawer elements =
    Layout.navigation
        []
    <|
        elements


drawerElements : Render
drawerElements model =
    let
        screenLink { screen } =
            Layout.link
                [ Layout.href <| Router.url screen
                ]
                [ text <| Router.header screen
                ]
    in
    List.map screenLink Router.screens


empty : Model -> List (Html msg)
empty _ =
    []
