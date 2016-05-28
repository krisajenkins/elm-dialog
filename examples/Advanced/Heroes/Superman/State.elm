module Advanced.Heroes.Superman.State exposing (..)

import Advanced.Heroes.Superman.Types exposing (..)


initialModel : Model
initialModel =
    { punches = 100 }


initialCommands : Cmd Msg
initialCommands =
    Cmd.none


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Punch ->
            ( { model | punches = model.punches + 1 }
            , Cmd.none
            )
