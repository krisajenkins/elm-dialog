module Advanced.Villains.Penguin.State exposing (..)

import Advanced.Villains.Penguin.Types exposing (..)


initialModel : Model
initialModel =
    { warks = 0
    , health = 100
    , state = Quiet
    }


initialCommands : Cmd Msg
initialCommands =
    Cmd.none


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Wark ->
            ( { model
                | warks = model.warks + 3
                , state = Warking
              }
            , Cmd.none
            )

        TakeDamage ->
            ( { model
                | health = model.health - 2
                , state = Hurt
              }
            , Cmd.none
            )

        Close ->
            ( { model | state = Quiet }
            , Cmd.none
            )
