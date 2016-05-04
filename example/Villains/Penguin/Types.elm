module Villains.Penguin.Types (..) where


type PenguinState
  = Quiet
  | Warking
  | Hurt


type alias Model =
  { warks : Int
  , health : Int
  , state : PenguinState
  }


type Action
  = Wark
  | Close
  | TakeDamage
