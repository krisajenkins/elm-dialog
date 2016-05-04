module Heroes.State (..) where

import Response exposing (..)
import Heroes.Types exposing (..)
import Heroes.Batman.State as Batman
import Heroes.Superman.State as Superman
import Heroes.WonderWoman.State as WonderWoman


initialModel : Model
initialModel =
  { batman = Batman.initialModel
  , superman = Superman.initialModel
  , wonderWoman = WonderWoman.initialModel
  , view = BatmanView
  }


update : Action -> Model -> Response Model Action
update action model =
  case action of
    SetView view ->
      { model | view = view }
        |> withNone

    BatmanAction subaction ->
      Batman.update subaction model.batman
        |> mapBoth (\x -> { model | batman = x }) BatmanAction

    SupermanAction subaction ->
      Superman.update subaction model.superman
        |> mapBoth (\x -> { model | superman = x }) SupermanAction

    WonderWomanAction subaction ->
      WonderWoman.update subaction model.wonderWoman
        |> mapBoth (\x -> { model | wonderWoman = x }) WonderWomanAction
