module Advanced.Types exposing (..)

import Advanced.Heroes.Types as Heroes
import Advanced.Villains.Types as Villains


type Msg
    = HeroesMsg Heroes.Msg
    | VillainsMsg Villains.Msg
    | HeroAttack


type alias Model =
    { heroes : Heroes.Model
    , villains : Villains.Model
    }
