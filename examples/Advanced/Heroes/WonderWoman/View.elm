module Advanced.Heroes.WonderWoman.View exposing (root, dialog)

import Advanced.Heroes.WonderWoman.Types exposing (..)
import Dialog
import Html exposing (..)
import Utils exposing (..)


root : Model -> Html Msg
root model =
    div []
        [ h2 [] [ text "WonderWoman" ]
        , debuggingView model
        ]


dialog : Model -> Maybe (Dialog.Config Msg)
dialog model =
    Nothing
