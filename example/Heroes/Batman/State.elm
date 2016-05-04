module Heroes.Batman.State (..) where

import Response exposing (..)
import Heroes.Batman.Types exposing (..)


initialModel : Model
initialModel =
  { kapows = 1000
  , showModal = False
  }


update : Action -> Model -> Response Model Action
update action model =
  case action of
    Kapow ->
      { model
        | kapows = model.kapows + 2
        , showModal = True
      }
        |> withNone

    Finished ->
      { model | showModal = False }
        |> withNone
