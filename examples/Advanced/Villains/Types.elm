module Advanced.Villains.Types (..) where

import Advanced.Villains.Joker.Types as Joker
import Advanced.Villains.Penguin.Types as Penguin


type alias Model =
  { joker : Joker.Model
  , penguin : Penguin.Model
  , view : View
  }


type View
  = JokerView
  | PenguinView


type Action
  = JokerAction Joker.Action
  | PenguinAction Penguin.Action
  | TakeDamage
  | SetView View
