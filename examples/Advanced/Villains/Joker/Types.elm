module Advanced.Villains.Joker.Types exposing (..)


type JokerState
  = Laughing
  | Screaming


type alias Model =
  { shots : Int
  , health : Int
  , state : JokerState
  }


type Message
  = Shoot
  | Close
  | TakeDamage
