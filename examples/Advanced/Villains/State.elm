module Advanced.Villains.State exposing (..)

import Response exposing (..)
import Advanced.Villains.Types exposing (..)
import Advanced.Villains.Joker.Types as JokerTypes
import Advanced.Villains.Penguin.Types as PenguinTypes
import Advanced.Villains.Joker.State as Joker
import Advanced.Villains.Penguin.State as Penguin


initialModel : Model
initialModel =
  { view = PenguinView
  , joker = Joker.initialModel
  , penguin = Penguin.initialModel
  }


initialCommands : Cmd Message
initialCommands =
  Cmd.batch
    [ Cmd.map JokerMessage Joker.initialCommands
    , Cmd.map PenguinMessage Penguin.initialCommands
    ]


update : Message -> Model -> Response Model Message
update action model =
  case action of
    SetView view ->
      { model | view = view }
        |> withNone

    JokerMessage subaction ->
      Joker.update subaction model.joker
        |> mapBoth (\x -> { model | joker = x }) JokerMessage

    PenguinMessage subaction ->
      Penguin.update subaction model.penguin
        |> mapBoth (\x -> { model | penguin = x }) PenguinMessage

    TakeDamage ->
      case model.view of
        JokerView ->
          update (JokerMessage JokerTypes.TakeDamage) model

        PenguinView ->
          update (PenguinMessage PenguinTypes.TakeDamage) model
