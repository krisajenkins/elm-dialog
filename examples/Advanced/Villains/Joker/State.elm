module Advanced.Villains.Joker.State exposing (..)

import Advanced.Villains.Joker.Types exposing (..)
import Response exposing (..)


initialModel : Model
initialModel =
    { shots = 0
    , health = 50
    , state = Laughing
    }


initialCommands : Cmd Message
initialCommands =
    Cmd.none


update : Message -> Model -> Response Model Message
update action model =
    case action of
        Shoot ->
            { model | shots = model.shots + 1 }
                |> withNone

        TakeDamage ->
            { model
                | health = model.health - 1
                , state = Screaming
            }
                |> withNone

        Close ->
            { model | state = Laughing }
                |> withNone
