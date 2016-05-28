module Advanced.State exposing (..)

import Advanced.Heroes.State as Heroes
import Advanced.Types exposing (..)
import Advanced.Villains.State as Villains
import Advanced.Villains.Types as Villains
import Response exposing (..)


initialModel : Model
initialModel =
    { heroes = Heroes.initialModel
    , villains = Villains.initialModel
    }


initialCommands : Cmd Msg
initialCommands =
    Cmd.batch
        [ Cmd.map HeroesMsg Heroes.initialCommands
        , Cmd.map VillainsMsg Villains.initialCommands
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        HeroesMsg subaction ->
            Heroes.update subaction model.heroes
                |> mapBoth (\x -> { model | heroes = x }) HeroesMsg

        VillainsMsg subaction ->
            Villains.update subaction model.villains
                |> mapBoth (\x -> { model | villains = x }) VillainsMsg

        HeroAttack ->
            Villains.update Villains.TakeDamage model.villains
                |> mapBoth (\x -> { model | villains = x }) VillainsMsg
