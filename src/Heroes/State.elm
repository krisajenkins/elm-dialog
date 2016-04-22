module Heroes.State (..) where

import Utils exposing (..)
import Effects exposing (..)
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


update : Action -> Model -> Model
update action model =
  case action of
    SetView view ->
      { model | view = view }

    BatmanAction subaction ->
      { model | batman = Batman.update subaction model.batman }

    SupermanAction subaction ->
      { model | superman = Superman.update subaction model.superman }

    WonderWomanAction subaction ->
      { model | wonderWoman = WonderWoman.update subaction model.wonderWoman }


effects : Action -> ( Model, Model ) -> Effects Action
effects action state =
  case action of
    SetView _ ->
      none

    BatmanAction subaction ->
      both .batman state
        |> Batman.effects subaction
        |> Effects.map BatmanAction

    SupermanAction subaction ->
      both .superman state
        |> Superman.effects subaction
        |> Effects.map SupermanAction

    WonderWomanAction subaction ->
      both .wonderWoman state
        |> WonderWoman.effects subaction
        |> Effects.map WonderWomanAction
