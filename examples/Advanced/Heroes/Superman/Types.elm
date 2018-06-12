module Advanced.Heroes.Superman.Types exposing (Model, Msg(..))


type alias Model =
    { punches : Int
    }


type Msg
    = Punch
