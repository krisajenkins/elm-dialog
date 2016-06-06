module Advanced.State exposing (..)

import Advanced.Battle exposing (Attack(..))
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
            let
                ( substate, maybeAttack ) =
                    Heroes.update subaction model.heroes

                ( newModel, newCmd ) =
                    substate
                        |> mapModel (\x -> { model | heroes = x })
                        |> mapCmd HeroesMsg
            in
                case maybeAttack of
                    Nothing ->
                        ( newModel, newCmd )

                    Just Punch ->
                        let
                            ( modelWithAttack, cmdWithAttack ) =
                                update (VillainsMsg Villains.TakeDamage) newModel
                        in
                            ( modelWithAttack
                            , Cmd.batch
                                [ newCmd
                                , cmdWithAttack
                                ]
                            )

        VillainsMsg subaction ->
            Villains.update subaction model.villains
                |> mapModel (\x -> { model | villains = x })
                |> mapCmd VillainsMsg
