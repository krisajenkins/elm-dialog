module Advanced.Types (..) where

import Advanced.Heroes.Types as Heroes
import Advanced.Villains.Types as Villains


type Action
  = HeroesAction Heroes.Action
  | VillainsAction Villains.Action
  | HeroAttack


type alias Model =
  { heroes : Heroes.Model
  , villains : Villains.Model
  }
