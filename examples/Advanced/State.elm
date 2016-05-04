module Advanced.State (..) where

import Response exposing (..)
import Advanced.Types exposing (..)
import Effects exposing (..)
import Advanced.Heroes.State as Heroes
import Advanced.Villains.Types as VillainsTypes
import Advanced.Villains.State as Villains


initialModel : Model
initialModel =
  { heroes = Heroes.initialModel
  , villains = Villains.initialModel
  }


initialEffects : Effects Action
initialEffects =
  none


update : Action -> Model -> Response Model Action
update action model =
  case action of
    HeroesAction subaction ->
      Heroes.update subaction model.heroes
        |> mapBoth (\x -> { model | heroes = x }) HeroesAction

    VillainsAction subaction ->
      Villains.update subaction model.villains
        |> mapBoth (\x -> { model | villains = x }) VillainsAction

    HeroAttack ->
      Villains.update VillainsTypes.TakeDamage model.villains
        |> mapBoth (\x -> { model | villains = x }) VillainsAction
