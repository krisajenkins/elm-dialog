module Advanced.Villains.View (root, dialog) where

import Dialog
import Signal exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Advanced.Villains.Types exposing (..)
import Advanced.Villains.Joker.View as Joker
import Advanced.Villains.Penguin.View as Penguin
import Utils exposing (..)


root : Address Action -> Model -> Html
root address model =
  div
    []
    [ h1 [] [ text "Villains" ]
    , ul
        [ class "nav nav-tabs" ]
        (List.map
          (viewTab address SetView model.view)
          [ ( JokerView, "Joker" )
          , ( PenguinView, "Penguin" )
          ]
        )
    , case model.view of
        JokerView ->
          Joker.root (forwardTo address JokerAction) model.joker

        PenguinView ->
          Penguin.root (forwardTo address PenguinAction) model.penguin
    ]


dialog : Address Action -> Model -> Maybe Dialog.Config
dialog address model =
  case model.view of
    JokerView ->
      Joker.dialog (forwardTo address JokerAction) model.joker

    PenguinView ->
      Penguin.dialog (forwardTo address PenguinAction) model.penguin
