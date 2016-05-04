module Heroes.WonderWoman.View (root, modal) where

import Utils exposing (..)
import Dialog
import Signal exposing (..)
import Html exposing (..)
import Heroes.WonderWoman.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "WonderWoman" ]
    , debuggingView model
    ]


modal : Address Action -> Model -> Maybe Dialog.Config
modal address model =
  Nothing
