module Heroes.Batman.View (root, modal) where

import Utils exposing (..)
import Viscose
import Signal exposing (..)
import Html exposing (..)
import Heroes.Batman.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "Batman" ]
    , text (toString model)
    , actionButton address ( Kapow, "Kapow!" )
    ]


modal : Address Action -> Model -> Maybe Viscose.Config
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
