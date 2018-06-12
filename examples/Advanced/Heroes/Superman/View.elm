module Advanced.Heroes.Superman.View exposing (dialog, root)

import Advanced.Heroes.Superman.Types exposing (Model, Msg)
import Dialog
import Html exposing (Html, div, h2, text)
import Utils exposing (debuggingView)


root : Model -> Html Msg
root model =
    div []
        [ h2 [] [ text "Superman" ]
        , debuggingView model
        ]


dialog : Model -> Maybe (Dialog.Config Msg)
dialog _ =
    Nothing
