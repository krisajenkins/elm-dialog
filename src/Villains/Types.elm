module Villains.Types (..) where

import Villains.Joker.Types as Joker
import Villains.Penguin.Types as Penguin


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
