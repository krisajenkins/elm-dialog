module Advanced.Villains.Joker.State exposing (..)

import Advanced.Villains.Joker.Types exposing (..)
import Response exposing (..)


initialModel : Model
initialModel =
    { shots = 0
    , health = 50
    , state = Laughing
    }


initialCommands : Cmd Msg
initialCommands =
    Cmd.none


update : Msg -> Model -> ( Model, Cmd Msg )
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
