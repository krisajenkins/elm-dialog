module Advanced.Heroes.Types exposing (..)

import Advanced.Heroes.Batman.Types as Batman
import Advanced.Heroes.Superman.Types as Superman
import Advanced.Heroes.WonderWoman.Types as WonderWoman


type alias Model =
    { batman : Batman.Model
    , superman : Superman.Model
    , wonderWoman : WonderWoman.Model
    , view : View
    }


type View
    = BatmanView
    | SupermanView
    | WonderWomanView


type Msg
    = BatmanMsg Batman.Msg
    | SupermanMsg Superman.Msg
    | WonderWomanMsg WonderWoman.Msg
    | SetView View
