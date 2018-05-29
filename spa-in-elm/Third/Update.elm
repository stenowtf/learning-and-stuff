module Third.Update exposing (..)

import Material
import Model exposing (Model)


type Msg
    = Reset
    | IncrementCounter
    | Mdl (Material.Msg Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg_ ->
            Material.update Mdl msg_ model

        IncrementCounter ->
            let
                counter =
                    model.third.counter

                third =
                    model.third
            in
            { model
                | globalCounter = model.globalCounter + 1
                , third = { third | counter = counter + 1 }
            }
                ! []

        _ ->
            model ! []
