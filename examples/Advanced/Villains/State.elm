module Advanced.Villains.State exposing (..)

import Advanced.Villains.Joker.State as Joker
import Advanced.Villains.Joker.Types as Joker
import Advanced.Villains.Penguin.State as Penguin
import Advanced.Villains.Penguin.Types as Penguin
import Advanced.Villains.Types exposing (..)
import Response exposing (..)


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
                    update (JokerMessage Joker.TakeDamage) model

                PenguinView ->
                    update (PenguinMessage Penguin.TakeDamage) model
