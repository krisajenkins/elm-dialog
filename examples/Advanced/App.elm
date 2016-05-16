module Advanced.App exposing (main)

import Advanced.State exposing (..)
import Advanced.View
import Html.App


main : Program Never
main =
  Html.App.program
    { init =
        ( Advanced.State.initialModel
        , Advanced.State.initialCommands
        )
    , view = Advanced.View.root
    , update = Advanced.State.update
    , subscriptions = always Sub.none
    }
