module Villains.Penguin.State (..) where

import Villains.Penguin.Types exposing (..)
import Effects exposing (..)


initialModel : Model
initialModel =
  { warks = 0
  , quiet = True
  }


update : Action -> Model -> Model
update action model =
  case action of
    Wark ->
      { model
        | warks = model.warks + 3
        , quiet = False
      }

    Close ->
      { model | quiet = True }


effects : Action -> ( Model, Model ) -> Effects Action
effects action state =
  none
