module Advanced.App exposing (main)

import Advanced.State as State
import Advanced.Types exposing (Model, Msg)
import Advanced.View as View
import Html


main : Program Never Model Msg
main =
    Html.program
        { init =
            ( State.initialModel
            , State.initialCommands
            )
        , view = View.root
        , update = State.update
        , subscriptions = always Sub.none
        }
