module TicTacToe exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


type alias Model =
    { name : String
    }


initialModel : Model
initialModel =
    { name = "Mike"
    }


view : Model -> Html msg
view model =
    div []
        []


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )


main =
    Html.beginnerProgram
        { model = initialModel,
        update: update,
         }
