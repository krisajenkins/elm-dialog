module Advanced.Heroes.WonderWoman.State exposing (..)

import Advanced.Heroes.WonderWoman.Types exposing (..)
import Response exposing (..)


initialModel : Model
initialModel =
    { swordSwipes = 5999 }


initialCommands : Cmd Message
initialCommands =
    Cmd.none


update : Message -> Model -> Response Model Message
update action model =
    case action of
        Swipe ->
            { model | swordSwipes = model.swordSwipes + 1 }
                |> withNone
