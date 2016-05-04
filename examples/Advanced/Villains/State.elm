module Advanced.Villains.State (..) where

import Response exposing (..)
import Advanced.Villains.Types exposing (..)
import Advanced.Villains.Joker.Types as JokerTypes
import Advanced.Villains.Penguin.Types as PenguinTypes
import Advanced.Villains.Joker.State as Joker
import Advanced.Villains.Penguin.State as Penguin


initialModel : Model
initialModel =
  { joker = Joker.initialModel
  , penguin = Penguin.initialModel
  , view = PenguinView
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

    TakeDamage ->
      case model.view of
        JokerView ->
          update (JokerAction JokerTypes.TakeDamage) model

        PenguinView ->
          update (PenguinAction PenguinTypes.TakeDamage) model
