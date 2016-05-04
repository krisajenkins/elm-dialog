module Advanced.Villains.Joker.Types (..) where


type JokerState
  = Laughing
  | Screaming


type alias Model =
  { shots : Int
  , health : Int
  , state : JokerState
  }


type Action
  = Shoot
  | Close
  | TakeDamage
