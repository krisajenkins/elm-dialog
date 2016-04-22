module Villains.State (..) where

import Utils exposing (..)
import Effects exposing (..)
import Villains.Types exposing (..)
import Villains.Joker.State as Joker
import Villains.Penguin.State as Penguin


initialModel : Model
initialModel =
  { joker = Joker.initialModel
  , penguin = Penguin.initialModel
  , view = JokerView
  }


update : Action -> Model -> Model
update action model =
  case action of
    SetView view ->
      { model | view = view }

    JokerAction subaction ->
      { model | joker = Joker.update subaction model.joker }

    PenguinAction subaction ->
      { model | penguin = Penguin.update subaction model.penguin }


effects : Action -> ( Model, Model ) -> Effects Action
effects action state =
  case action of
    SetView _ ->
      none

    JokerAction subaction ->
      both .joker state
        |> Joker.effects subaction
        |> Effects.map JokerAction

    PenguinAction subaction ->
      both .penguin state
        |> Penguin.effects subaction
        |> Effects.map PenguinAction
