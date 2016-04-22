module Villains.Joker.State (..) where

import Villains.Joker.Types exposing (..)
import Effects exposing (..)


initialModel : Model
initialModel =
  { shots = 0 }


update : Action -> Model -> Model
update action model =
  case action of
    Shoot ->
      { model | shots = model.shots + 1 }


effects : Action -> ( Model, Model ) -> Effects Action
effects action state =
  none
