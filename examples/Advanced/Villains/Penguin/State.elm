module Advanced.Villains.Penguin.State (..) where

import Response exposing (..)
import Advanced.Villains.Penguin.Types exposing (..)


initialModel : Model
initialModel =
  { warks = 0
  , health = 100
  , state = Quiet
  }


update : Action -> Model -> Response Model Action
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
