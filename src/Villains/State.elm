module Villains.State (..) where

import Response exposing (..)
import Villains.Types exposing (..)
import Villains.Joker.State as Joker
import Villains.Penguin.State as Penguin


initialModel : Model
initialModel =
  { joker = Joker.initialModel
  , penguin = Penguin.initialModel
  , view = JokerView
  }


update : Action -> Model -> Response Model Action
update action model =
  case action of
    SetView view ->
      { model | view = view }
        |> withNone

    JokerAction subaction ->
      Joker.update subaction model.joker
        |> mapBoth (\x -> { model | joker = x }) JokerAction

    PenguinAction subaction ->
      Penguin.update subaction model.penguin
        |> mapBoth (\x -> { model | penguin = x }) PenguinAction
