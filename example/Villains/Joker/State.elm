module Villains.Joker.State (..) where

import Response exposing (..)
import Villains.Joker.Types exposing (..)


initialModel : Model
initialModel =
  { shots = 0
  , health = 50
  }


update : Action -> Model -> Response Model Action
update action model =
  case action of
    Shoot ->
      { model | shots = model.shots + 1 }
        |> withNone

    TakeDamage ->
      { model | health = model.health - 1 }
        |> withNone
