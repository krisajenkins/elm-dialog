module Advanced.Heroes.WonderWoman.View (root, dialog) where

import Utils exposing (..)
import Dialog
import Signal exposing (..)
import Html exposing (..)
import Advanced.Heroes.WonderWoman.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "WonderWoman" ]
    , debuggingView model
    ]


dialog : Address Action -> Model -> Maybe Dialog.Config
dialog address model =
  Nothing
