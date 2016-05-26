module Advanced.State exposing (..)

import Advanced.Heroes.State as Heroes
import Advanced.Types exposing (..)
import Advanced.Villains.State as Villains
import Advanced.Villains.Types as VillainsTypes
import Response exposing (..)


initialModel : Model
initialModel =
    { heroes = Heroes.initialModel
    , villains = Villains.initialModel
    }


initialCommands : Cmd Message
initialCommands =
    Cmd.batch
        [ Cmd.map HeroesMessage Heroes.initialCommands
        , Cmd.map VillainsMessage Villains.initialCommands
        ]


update : Message -> Model -> Response Model Message
update action model =
    case action of
        HeroesMessage subaction ->
            Heroes.update subaction model.heroes
                |> mapBoth (\x -> { model | heroes = x }) HeroesMessage

        VillainsMessage subaction ->
            Villains.update subaction model.villains
                |> mapBoth (\x -> { model | villains = x }) VillainsMessage

        HeroAttack ->
            Villains.update VillainsTypes.TakeDamage model.villains
                |> mapBoth (\x -> { model | villains = x }) VillainsMessage
