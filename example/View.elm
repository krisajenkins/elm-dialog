module View (root) where

import Dialog
import Heroes.View
import Html exposing (..)
import Html.Attributes exposing (..)
import Signal exposing (..)
import Types exposing (..)
import Utils exposing (..)
import Villains.View


root : Address Action -> Model -> Html
root address model =
  let
    heroesAddress =
      forwardTo address HeroesAction

    villainsAddress =
      forwardTo address VillainsAction

    attackMessage =
      message address HeroAttack
  in
    div
      [ style [ ( "margin", "15px" ) ] ]
      [ bootstrap
      , div
          [ class "container-fluid" ]
          [ div
              [ class "row" ]
              [ div
                  [ class "col-md-6" ]
                  [ Heroes.View.root heroesAddress attackMessage model.heroes ]
              , div
                  [ class "col-md-6" ]
                  [ Villains.View.root villainsAddress model.villains ]
              ]
          , Maybe.oneOf
              [ (Heroes.View.modal heroesAddress model.heroes)
              , (Villains.View.modal villainsAddress model.villains)
              ]
              |> Dialog.root
          ]
      ]
