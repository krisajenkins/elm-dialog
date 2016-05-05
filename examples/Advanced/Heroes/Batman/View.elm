module Advanced.Heroes.Batman.View (root, dialog) where

import Dialog
import Advanced.Heroes.Batman.Types exposing (..)
import Html exposing (..)
import Signal exposing (..)
import Utils exposing (..)


root : Address Action -> Message -> Model -> Html
root address attackMessage model =
  div
    []
    [ h2 [] [ text "Batman" ]
    , debuggingView model
    , attackButton attackMessage "Kapow!"
    ]


dialog : Address Action -> Model -> Maybe Dialog.Config
dialog address model =
  if model.showDialog then
    Just
      { closeMessage = Just (message address Finished)
      , header = Just (h1 [] [ text "Kapow!" ])
      , body = Just (text "Batman swipes at you!")
      , footer = Just (actionButton address ( Finished, "OK" ))
      }
  else
    Nothing
