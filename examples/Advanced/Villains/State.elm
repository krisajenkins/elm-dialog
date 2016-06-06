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


initialCommands : Cmd Msg
initialCommands =
    Cmd.batch
        [ Cmd.map JokerMsg Joker.initialCommands
        , Cmd.map PenguinMsg Penguin.initialCommands
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        SetView view ->
            ( { model | view = view }
            , Cmd.none
            )

        JokerMsg subaction ->
            Joker.update subaction model.joker
                |> mapModel (\x -> { model | joker = x })
                |> mapCmd JokerMsg

        PenguinMsg subaction ->
            Penguin.update subaction model.penguin
                |> mapModel (\x -> { model | penguin = x })
                |> mapCmd PenguinMsg

        TakeDamage ->
            case model.view of
                JokerView ->
                    update (JokerMsg Joker.TakeDamage) model

                PenguinView ->
                    update (PenguinMsg Penguin.TakeDamage) model
