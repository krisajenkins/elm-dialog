module Heroes.Superman.View (root, modal) where

import Viscose
import Signal exposing (..)
import Html exposing (..)
import Heroes.Superman.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "Superman" ]
    , text (toString model)
    ]


modal : Address Action -> Model -> Maybe Viscose.Config
modal address model =
  Nothing
