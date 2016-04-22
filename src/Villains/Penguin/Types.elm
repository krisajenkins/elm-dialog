module Villains.Penguin.Types (..) where


type alias Model =
  { warks : Int
  , quiet : Bool
  }


type Action
  = Wark
  | Close
