module Villains.Joker.View (root, modal) where

import Utils exposing (..)
import Dialog
import Signal exposing (..)
import Html exposing (..)
import Villains.Joker.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "Joker" ]
    , debuggingView model
    ]


modal : Address Action -> Model -> Maybe Dialog.Config
modal address model =
  Nothing
