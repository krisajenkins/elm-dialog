module Advanced.Villains.Joker.Types exposing (JokerState(..), Model, Msg(..))


type JokerState
    = Laughing
    | Screaming


type alias Model =
    { shots : Int
    , health : Int
    , state : JokerState
    }


type Msg
    = Shoot
    | Close
    | TakeDamage
