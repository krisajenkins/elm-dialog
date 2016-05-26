module Advanced.App exposing (main)

import Advanced.State as State
import Advanced.View as View
import Html.App


main : Program Never
main =
    Html.App.program
        { init =
            ( State.initialModel
            , State.initialCommands
            )
        , view = View.root
        , update = State.update
        , subscriptions = always Sub.none
        }
