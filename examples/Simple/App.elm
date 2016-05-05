module Simple.App (main) where

{-| Fan favourite, it's the "click a button and increment a counter" demo!

When the user clicks a button, the counter will increment and a dialog
will pop up alerting them about the new value. When they click Ok, the
dialog goes away.
-}

import Dialog
import Effects exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (..)
import StartApp exposing (..)
import Task exposing (Task)
import Utils exposing (..)


------------------------------------------------------------
-- Types
------------------------------------------------------------


type Action
  = Increment
  | Acknowledge


type alias Model =
  { counter : Int
  , showDialog : Bool
  }



------------------------------------------------------------
-- State
------------------------------------------------------------


initialState : ( Model, Effects Action )
initialState =
  ( { counter = 0
    , showDialog = False
    }
  , none
  )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    Increment ->
      ( { model
          | counter = model.counter + 1
          , showDialog = True
        }
      , none
      )

    Acknowledge ->
      ( { model | showDialog = False }
      , none
      )



------------------------------------------------------------
-- View
------------------------------------------------------------
--


{-| This is our top-level view, the one that will go straight into the
`<body>` tag. We wire in `Dialog.view` at the top level. Our model
contains the information we need to decide whether to show the dialog
or not.
-}
view : Address Action -> Model -> Html
view address model =
  div
    [ style [ ( "margin", "45px" ) ] ]
    [ bootstrap
    , h2 [] [ text (toString model.counter) ]
    , button
        [ class "btn btn-info"
        , onClick address Increment
        ]
        [ text "Increment" ]
    , Dialog.view
        (if model.showDialog then
          Just (dialogConfig address model)
         else
          Nothing
        )
    ]


{-| A `Dialog.Config` is just a few piece of optional `Html`, plus "what do we do onClose?"
-}
dialogConfig : Address Action -> Model -> Dialog.Config
dialogConfig address model =
  { closeMessage = Just (Signal.message address Acknowledge)
  , header = Just (h3 [] [ text "1 Up!" ])
  , body = Just (text ("The counter ticks up to " ++ (toString model.counter) ++ "."))
  , footer =
      Just
        (button
          [ class "btn btn-success"
          , onClick address Acknowledge
          ]
          [ text "OK" ]
        )
  }



------------------------------------------------------------
-- StartApp
------------------------------------------------------------


app : App Model
app =
  StartApp.start
    { init = initialState
    , view = view
    , update = update
    , inputs = []
    }


main : Signal Html
main =
  app.html


port tasks : Signal (Task Never ())
port tasks =
  app.tasks
