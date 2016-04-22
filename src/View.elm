module View (root) where

import Viscose
import Signal exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Heroes.View
import Villains.View


root : Address Action -> Model -> Html
root address model =
  let
    heroesAddress =
      forwardTo address HeroesAction

    villainsAddress =
      forwardTo address VillainsAction
  in
    div
      [ class "container-fluid" ]
      [ div
          [ class "row" ]
          [ div
              [ class "col-md-6" ]
              [ Heroes.View.root heroesAddress model.heroes ]
          , div
              [ class "col-md-6" ]
              [ Villains.View.root villainsAddress model.villains ]
          ]
      , Maybe.oneOf
          [ (Heroes.View.modal heroesAddress model.heroes)
          , (Villains.View.modal villainsAddress model.villains)
          ]
          |> Viscose.root
      ]
