module Advanced.App (main) where

import Effects exposing (Never)
import Html exposing (Html)
import StartApp exposing (..)
import Advanced.State exposing (..)
import Task exposing (Task)
import Advanced.Types exposing (..)
import Advanced.View


app : App Model
app =
  StartApp.start
    { init = ( initialModel, initialEffects )
    , view = Advanced.View.root
    , update = Advanced.State.update
    , inputs = []
    }


main : Signal Html
main =
  app.html


port tasks : Signal (Task Never ())
port tasks =
  app.tasks
