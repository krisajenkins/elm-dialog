module Heroes.Superman.State (..) where

import Heroes.Superman.Types exposing (..)
import Effects exposing (..)


initialModel : Model
initialModel =
  { punches = 100 }


update : Action -> Model -> Model
update action model =
  case action of
    Punch ->
      { model | punches = model.punches + 1 }


effects : Action -> ( Model, Model ) -> Effects Action
effects action state =
  none
