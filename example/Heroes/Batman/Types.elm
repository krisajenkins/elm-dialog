module Heroes.Batman.Types (..) where


type alias Model =
  { kapows : Int
  , showModal : Bool
  }


type Action
  = Kapow
  | Finished
