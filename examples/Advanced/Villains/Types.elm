module Advanced.Villains.Types exposing (..)

import Advanced.Villains.Joker.Types as Joker
import Advanced.Villains.Penguin.Types as Penguin


type alias Model =
    { joker : Joker.Model
    , penguin : Penguin.Model
    , view : View
    }


type View
    = JokerView
    | PenguinView


type Message
    = JokerMessage Joker.Message
    | PenguinMessage Penguin.Message
    | TakeDamage
    | SetView View
