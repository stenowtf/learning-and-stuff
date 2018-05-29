module Model exposing (Model, init)

import First.Model
import Material
import Navigation exposing (Location)
import Router exposing (Screen(..), screenFromLocation)
import Second.Model
import Third.Model


type alias Model =
    { globalCounter : Int
    , mdl : Material.Model
    , screen : Screen
    , first : First.Model.Model
    , second : Second.Model.Model
    , third : Third.Model.Model
    }


init : Location -> Model
init location =
    { screen = screenFromLocation location
    , globalCounter = 0
    , mdl = Material.model
    , first = First.Model.init
    , second = Second.Model.init
    , third = Third.Model.init
    }
