module Advanced.Heroes.Batman.View exposing (root, dialog)

import Advanced.Heroes.Batman.Types exposing (..)
import Dialog
import Html exposing (..)
import Utils exposing (..)


root : Model -> Html Message
root model =
  div []
    [ h2 [] [ text "Batman" ]
    , debuggingView model
    , attackButton Kapow "Kapow!"
    ]


dialog : Model -> Maybe (Dialog.Config Message)
dialog model =
  if model.showDialog then
    Just
      { closeMessage = Just Finished
      , header = Just (h1 [] [ text "Kapow!" ])
      , body = Just (text "Batman swipes at you!")
      , footer = Just (actionButton ( Finished, "OK" ))
      }
  else
    Nothing
