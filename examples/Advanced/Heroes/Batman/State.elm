module Advanced.Heroes.Batman.State (..) where

import Response exposing (..)
import Advanced.Heroes.Batman.Types exposing (..)


initialModel : Model
initialModel =
  { kapows = 1000
  , showDialog = False
  }


update : Action -> Model -> Response Model Action
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
