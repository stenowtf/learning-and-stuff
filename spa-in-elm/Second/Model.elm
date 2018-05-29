module Second.Model exposing (Model, init)


type alias Model =
    { counter : Int
    }


init : Model
init =
    { counter = 0
    }
