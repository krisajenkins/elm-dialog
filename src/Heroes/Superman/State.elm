module Heroes.Superman.State (..) where

import Response exposing (..)
import Heroes.Superman.Types exposing (..)


initialModel : Model
initialModel =
  { punches = 100 }


update : Action -> Model -> Response Model Action
update action model =
  case action of
    Punch ->
      { model | punches = model.punches + 1 }
        |> withNone
