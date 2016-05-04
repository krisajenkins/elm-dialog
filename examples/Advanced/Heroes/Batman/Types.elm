module Advanced.Heroes.Batman.Types (..) where


type alias Model =
  { kapows : Int
  , showDialog : Bool
  }


type Action
  = Kapow
  | Finished
