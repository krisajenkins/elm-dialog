module Heroes.Batman.View (root, modal) where

import Dialog
import Heroes.Batman.Types exposing (..)
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


modal : Address Action -> Model -> Maybe Dialog.Config
modal address model =
  if model.showModal then
    Just
      { closeMessage = message address Finished
      , header = Just (h1 [] [ text "Kapow!" ])
      , body = Just (text "Batman swipes at you!")
      , footer = Just (actionButton address ( Finished, "OK" ))
      }
  else
    Nothing
