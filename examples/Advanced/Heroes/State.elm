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


initialCommands : Cmd Message
initialCommands =
    Cmd.batch
        [ Cmd.map BatmanMessage Batman.initialCommands
        , Cmd.map SupermanMessage Superman.initialCommands
        , Cmd.map WonderWomanMessage WonderWoman.initialCommands
        ]


update : Message -> Model -> Response Model Message
update action model =
    case action of
        SetView view ->
            { model | view = view }
                |> withNone

        BatmanMessage subaction ->
            Batman.update subaction model.batman
                |> mapBoth (\x -> { model | batman = x }) BatmanMessage

        SupermanMessage subaction ->
            Superman.update subaction model.superman
                |> mapBoth (\x -> { model | superman = x }) SupermanMessage

        WonderWomanMessage subaction ->
            WonderWoman.update subaction model.wonderWoman
                |> mapBoth (\x -> { model | wonderWoman = x }) WonderWomanMessage
