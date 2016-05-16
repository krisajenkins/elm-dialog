module Advanced.Types exposing (..)

import Advanced.Heroes.Types as Heroes
import Advanced.Villains.Types as Villains


type Message
  = HeroesMessage Heroes.Message
  | VillainsMessage Villains.Message
  | HeroAttack


type alias Model =
  { heroes : Heroes.Model
  , villains : Villains.Model
  }
