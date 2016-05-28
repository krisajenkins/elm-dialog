module Advanced.Heroes.State exposing (..)

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


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        SetView view ->
            { model | view = view }
                |> withNone

        BatmanMsg subaction ->
            Batman.update subaction model.batman
                |> mapBoth (\x -> { model | batman = x }) BatmanMsg

        SupermanMsg subaction ->
            Superman.update subaction model.superman
                |> mapBoth (\x -> { model | superman = x }) SupermanMsg

        WonderWomanMsg subaction ->
            WonderWoman.update subaction model.wonderWoman
                |> mapBoth (\x -> { model | wonderWoman = x }) WonderWomanMsg
