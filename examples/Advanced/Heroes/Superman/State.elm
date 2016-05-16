module Advanced.Heroes.Superman.State exposing (..)

import Advanced.Heroes.Superman.Types exposing (..)
import Response exposing (..)


initialModel : Model
initialModel =
  { punches = 100 }


initialCommands : Cmd Message
initialCommands =
  Cmd.none


update : Message -> Model -> Response Model Message
update action model =
  case action of
    Punch ->
      { model | punches = model.punches + 1 }
        |> withNone
