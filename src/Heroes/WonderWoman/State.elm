module Heroes.WonderWoman.State (..) where

import Heroes.WonderWoman.Types exposing (..)
import Effects exposing (..)


initialModel : Model
initialModel =
  { swordSwipes = 5999 }


update : Action -> Model -> Model
update action model =
  case action of
    Swipe ->
      { model | swordSwipes = model.swordSwipes + 1 }


effects : Action -> ( Model, Model ) -> Effects Action
effects action state =
  none
