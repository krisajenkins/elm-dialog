module Villains.View (root, modal) where

import Viscose
import Signal exposing (..)
import Utils exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Villains.Types exposing (..)
import Villains.Joker.View as Joker
import Villains.Penguin.View as Penguin


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h1 [] [ text "Villains" ]
    , div
        [ class "well" ]
        [ case model.view of
            JokerView ->
              Joker.root (forwardTo address JokerAction) model.joker

            PenguinView ->
              Penguin.root (forwardTo address PenguinAction) model.penguin
        ]
    , div
        [ class "btn-group" ]
        (List.map
          (actionButton address)
          [ ( SetView JokerView, "Joker" )
          , ( SetView PenguinView, "Penguin" )
          ]
        )
    ]


modal : Address Action -> Model -> Maybe Viscose.Config
modal address model =
  case model.view of
    JokerView ->
      Joker.modal (forwardTo address JokerAction) model.joker

    PenguinView ->
      Penguin.modal (forwardTo address PenguinAction) model.penguin
