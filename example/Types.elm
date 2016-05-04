module Types (..) where

import Heroes.Types as Heroes
import Villains.Types as Villains


type Action
  = HeroesAction Heroes.Action
  | VillainsAction Villains.Action
  | HeroAttack


type alias Model =
  { heroes : Heroes.Model
  , villains : Villains.Model
  }
