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
  case model.state of
    Laughing ->
      Nothing

    Screaming ->
      Just
        { closeMessage = Just (message address Close)
        , header = Just (h1 [] [ text "Joker says, \"Argh!\"" ])
        , body = Just (text "The Joker is no longer smiling.")
        , footer = Nothing
        }
