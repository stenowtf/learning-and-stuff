module Subscription exposing (subscriptions)

import Material
import Model exposing (Model)
import Update exposing (Msg)


subscriptions : Model -> Sub Msg
subscriptions model =
    Material.subscriptions Update.Mdl model
