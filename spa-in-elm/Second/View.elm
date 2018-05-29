module Second.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Material.Button as Button
import Material.Icon as Icon
import Material.Options as Options
import Model exposing (Model)
import Router exposing (Screen(..))
import Second.Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ text "Button pushed in this screen: "
            , text <| toString model.second.counter
            ]
        , div []
            [ text "Button pushed in all screens: "
            , text <| toString model.globalCounter
            ]
        , div []
            [ Button.render
                Mdl
                [ 0 ]
                model.mdl
                [ Button.fab
                , Button.colored
                , Options.onClick
                    IncrementCounter
                ]
                [ Icon.i "add" ]
            ]
        ]
