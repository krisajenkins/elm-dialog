module App (main) where

import Effects exposing (Never)
import Html exposing (Html)
import StartApp exposing (..)
import State exposing (..)
import Task exposing (Task)
import Types exposing (..)
import View


app : App Model
app =
  StartApp.start
    { init = ( initialModel, initialEffects )
    , view = View.root
    , update =
        (\action oldModel ->
          let
            newModel =
              State.update action oldModel

            newEffects =
              State.effects action ( oldModel, newModel )
          in
            ( newModel, newEffects )
        )
    , inputs = []
    }


main : Signal Html
main =
  app.html


port tasks : Signal (Task Never ())
port tasks =
  app.tasks
