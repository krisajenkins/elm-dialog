module Advanced.Villains.Joker.View (root, dialog) where

import Utils exposing (..)
import Dialog
import Signal exposing (..)
import Html exposing (..)
import Advanced.Villains.Joker.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "Joker" ]
    , debuggingView model
    ]


dialog : Address Action -> Model -> Maybe Dialog.Config
dialog address model =
  Nothing
