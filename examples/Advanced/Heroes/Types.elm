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


type Message
    = BatmanMessage Batman.Message
    | SupermanMessage Superman.Message
    | WonderWomanMessage WonderWoman.Message
    | SetView View
