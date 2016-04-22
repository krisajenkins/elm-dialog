module State (..) where

import Response exposing (..)
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


update : Action -> Model -> Response Model Action
update action model =
  case action of
    HeroesAction subaction ->
      Heroes.State.update subaction model.heroes
        |> mapBoth (\x -> { model | heroes = x }) HeroesAction

    VillainsAction subaction ->
      Villains.State.update subaction model.villains
        |> mapBoth (\x -> { model | villains = x }) VillainsAction
