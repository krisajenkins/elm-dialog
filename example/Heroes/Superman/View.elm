module Heroes.Superman.View (root, modal) where

import Dialog
import Heroes.Superman.Types exposing (..)
import Html exposing (..)
import Signal exposing (..)
import Utils exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "Superman" ]
    , debuggingView model
    ]


modal : Address Action -> Model -> Maybe Dialog.Config
modal address model =
  Nothing
