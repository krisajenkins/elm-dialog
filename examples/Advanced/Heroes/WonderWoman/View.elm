module Advanced.Heroes.WonderWoman.View exposing (dialog, root)

import Advanced.Heroes.WonderWoman.Types exposing (Model, Msg)
import Dialog
import Html exposing (Html, div, h2, text)
import Utils exposing (debuggingView)


root : Model -> Html Msg
root model =
    div []
        [ h2 [] [ text "WonderWoman" ]
        , debuggingView model
        ]


dialog : Model -> Maybe (Dialog.Config Msg)
dialog _ =
    Nothing
