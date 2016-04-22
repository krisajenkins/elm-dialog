module State (..) where

import Utils exposing (..)
import Types exposing (..)
import Effects exposing (..)
import Heroes.State
import Villains.State


initialModel : Model
initialModel =
  { heroes = Heroes.State.initialModel
  , villains = Villains.State.initialModel
  }


initialEffects : Effects Action
initialEffects =
  none


update : Action -> Model -> Model
update action model =
  case action of
    HeroesAction subaction ->
      { model | heroes = Heroes.State.update subaction model.heroes }

    VillainsAction subaction ->
      { model | villains = Villains.State.update subaction model.villains }


effects : Action -> ( Model, Model ) -> Effects Action
effects action state =
  case action of
    HeroesAction subaction ->
      both .heroes state
        |> Heroes.State.effects subaction
        |> Effects.map HeroesAction

    VillainsAction subaction ->
      both .villains state
        |> Villains.State.effects subaction
        |> Effects.map VillainsAction
