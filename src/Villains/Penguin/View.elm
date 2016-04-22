module Villains.Penguin.View (root, modal) where

import Utils exposing (..)
import Viscose
import Signal exposing (..)
import Html exposing (..)
import Villains.Penguin.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "Penguin" ]
    , text (toString model)
    , actionButton address ( Wark, "Wark!" )
    ]


modal : Address Action -> Model -> Maybe Viscose.Config
modal address model =
  if model.quiet then
    Nothing
  else
    Just
      { closeMessage = message address Close
      , header = Just (h1 [] [ text "Wark!" ])
      , body = Just (text "The Penguin laughs his weird laugh")
      , footer = Just (actionButton address ( Close, "OK" ))
      }
