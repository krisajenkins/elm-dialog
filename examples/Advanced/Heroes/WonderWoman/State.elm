module Advanced.Heroes.WonderWoman.State (..) where

import Response exposing (..)
import Advanced.Heroes.WonderWoman.Types exposing (..)


initialModel : Model
initialModel =
  { swordSwipes = 5999 }


update : Action -> Model -> Response Model Action
update action model =
  case action of
    Swipe ->
      { model | swordSwipes = model.swordSwipes + 1 }
        |> withNone
