module Advanced.Heroes.WonderWoman.Types exposing (Model, Msg(..))


type alias Model =
    { swordSwipes : Int
    }


type Msg
    = Swipe
