module Advanced.Heroes.Superman.View (root, dialog) where

import Dialog
import Advanced.Heroes.Superman.Types exposing (..)
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


dialog : Address Action -> Model -> Maybe Dialog.Config
dialog address model =
  Nothing
