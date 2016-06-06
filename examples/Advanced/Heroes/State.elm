module Advanced.Heroes.State exposing (..)

import Advanced.Battle exposing (Attack(..))
import Advanced.Heroes.Batman.State as Batman
import Advanced.Heroes.Superman.State as Superman
import Advanced.Heroes.Types exposing (..)
import Advanced.Heroes.WonderWoman.State as WonderWoman
import Response exposing (..)


initialModel : Model
initialModel =
    { view = BatmanView
    , batman = Batman.initialModel
    , superman = Superman.initialModel
    , wonderWoman = WonderWoman.initialModel
    }


initialCommands : Cmd Msg
initialCommands =
    Cmd.batch
        [ Cmd.map BatmanMsg Batman.initialCommands
        , Cmd.map SupermanMsg Superman.initialCommands
        , Cmd.map WonderWomanMsg WonderWoman.initialCommands
        ]


update : Msg -> Model -> ( ( Model, Cmd Msg ), Maybe Attack )
update action model =
    case action of
        SetView view ->
            ( ( { model | view = view }
              , Cmd.none
              )
            , Nothing
            )

        BatmanMsg subaction ->
            let
                ( substate, attack ) =
                    Batman.update subaction model.batman
            in
                ( substate
                    |> mapModel (\x -> { model | batman = x })
                    |> mapCmd BatmanMsg
                , attack
                )

        SupermanMsg subaction ->
            ( Superman.update subaction model.superman
                |> mapModel (\x -> { model | superman = x })
                |> mapCmd SupermanMsg
            , Nothing
            )

        WonderWomanMsg subaction ->
            ( WonderWoman.update subaction model.wonderWoman
                |> mapModel (\x -> { model | wonderWoman = x })
                |> mapCmd WonderWomanMsg
            , Nothing
            )
