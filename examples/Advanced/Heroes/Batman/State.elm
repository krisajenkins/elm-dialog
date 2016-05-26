module Advanced.Heroes.Batman.State exposing (..)

import Response exposing (..)
import Advanced.Heroes.Batman.Types exposing (..)


initialModel : Model
initialModel =
    { kapows = 1000
    , showDialog = False
    }


initialCommands : Cmd Message
initialCommands =
    Cmd.none


update : Message -> Model -> Response Model Message
update action model =
    case action of
        Kapow ->
            { model
                | kapows = model.kapows + 2
                , showDialog = True
            }
                |> withNone

        Finished ->
            { model | showDialog = False }
                |> withNone
