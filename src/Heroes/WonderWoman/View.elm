module Heroes.WonderWoman.View (root, modal) where

import Viscose
import Signal exposing (..)
import Html exposing (..)
import Heroes.WonderWoman.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "WonderWoman" ]
    , text (toString model)
    ]


modal : Address Action -> Model -> Maybe Viscose.Config
modal address model =
  Nothing
