module Advanced.Heroes.Batman.Types exposing (Model, Msg(..))


type alias Model =
    { kapows : Int
    , showDialog : Bool
    }


type Msg
    = Kapow
    | Finished
