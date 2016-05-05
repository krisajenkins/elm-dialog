module Advanced.Villains.Penguin.View (root, dialog) where

import Utils exposing (..)
import Dialog
import Signal exposing (..)
import Html exposing (..)
import Advanced.Villains.Penguin.Types exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h2 [] [ text "Penguin" ]
    , debuggingView model
    , actionButton address ( Wark, "Wark!" )
    ]


dialog : Address Action -> Model -> Maybe Dialog.Config
dialog address model =
  case model.state of
    Quiet ->
      Nothing

    Hurt ->
      Just
        { closeMessage = Just (message address Close)
        , header = Just (h1 [] [ text "Penguin says, \"Ouch!\"" ])
        , body = Just (text "The penguin tries to dodge, which goes badly because penguins lack grace on land.")
        , footer = Just (actionButton address ( Close, "Take the pain" ))
        }

    Warking ->
      Just
        { closeMessage = Just (message address Close)
        , header = Just (h1 [] [ text "Penguin says, \"Wark!\"" ])
        , body = Just (text "The Penguin laughs his weird laugh")
        , footer = Just (actionButton address ( Close, "Calm down" ))
        }
