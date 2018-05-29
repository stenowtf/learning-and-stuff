module Main exposing (..)

import Material
import Model exposing (Model)
import Navigation
import Subscription
import Update
import View


main =
    Navigation.program
        Update.ChangeLocation
        { init = init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscription.subscriptions
        }


init : Navigation.Location -> ( Model, Cmd Update.Msg )
init location =
    Model.init location
        ! [ Material.init Update.Mdl ]
