module Advanced.Villains.Penguin.Types exposing (..)


type PenguinState
    = Quiet
    | Warking
    | Hurt


type alias Model =
    { warks : Int
    , health : Int
    , state : PenguinState
    }


type Msg
    = Wark
    | Close
    | TakeDamage
