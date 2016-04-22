module Villains.Penguin.State (..) where

import Response exposing (..)
import Villains.Penguin.Types exposing (..)


initialModel : Model
initialModel =
  { warks = 0
  , quiet = True
  }


update : Action -> Model -> Response Model Action
update action model =
  case action of
    Wark ->
      { model
        | warks = model.warks + 3
        , quiet = False
      }
        |> withNone

    Close ->
      { model | quiet = True }
        |> withNone
