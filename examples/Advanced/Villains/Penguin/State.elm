module Advanced.Villains.Penguin.State exposing (..)

import Advanced.Villains.Penguin.Types exposing (..)
import Response exposing (..)


initialModel : Model
initialModel =
  { warks = 0
  , health = 100
  , state = Quiet
  }


initialCommands : Cmd Message
initialCommands =
  Cmd.none


update : Message -> Model -> Response Model Message
update action model =
  case action of
    Wark ->
      { model
        | warks = model.warks + 3
        , state = Warking
      }
        |> withNone

    TakeDamage ->
      { model
        | health = model.health - 2
        , state = Hurt
      }
        |> withNone

    Close ->
      { model | state = Quiet }
        |> withNone
