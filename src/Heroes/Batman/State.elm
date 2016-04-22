module Heroes.Batman.State (..) where

import Heroes.Batman.Types exposing (..)
import Effects exposing (..)


initialModel : Model
initialModel =
  { kapows = 1000
  , showModal = False
  }


update : Action -> Model -> Model
update action model =
  case action of
    Kapow ->
      { model
        | kapows = model.kapows + 2
        , showModal = True
      }

    Finished ->
      { model | showModal = False }


effects : Action -> ( Model, Model ) -> Effects Action
effects action state =
  none
