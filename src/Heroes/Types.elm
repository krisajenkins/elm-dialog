module Heroes.Types (..) where

import Heroes.Batman.Types as Batman
import Heroes.Superman.Types as Superman
import Heroes.WonderWoman.Types as WonderWoman


type alias Model =
  { batman : Batman.Model
  , superman : Superman.Model
  , wonderWoman : WonderWoman.Model
  , view : View
  }


type View
  = BatmanView
  | SupermanView
  | WonderWomanView


type Action
  = BatmanAction Batman.Action
  | SupermanAction Superman.Action
  | WonderWomanAction WonderWoman.Action
  | SetView View
