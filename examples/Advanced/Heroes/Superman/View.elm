module Advanced.Heroes.Superman.View exposing (root, dialog)

import Advanced.Heroes.Superman.Types exposing (..)
import Dialog
import Html exposing (..)
import Utils exposing (..)


root : Model -> Html Message
root model =
  div []
    [ h2 [] [ text "Superman" ]
    , debuggingView model
    ]


dialog : Model -> Maybe (Dialog.Config Message)
dialog model =
  Nothing
