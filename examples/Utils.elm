module Utils (..) where

import Signal exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


both : (a -> b) -> ( a, a ) -> ( b, b )
both f ( x, y ) =
  ( f x, f y )


actionButton : Address a -> ( a, String ) -> Html
actionButton address ( action, label ) =
  button
    [ class "btn btn-info"
    , onClick address action
    ]
    [ text label ]


attackButton : Message -> String -> Html
attackButton attackMessage label =
  button
    [ class "btn btn-success"
    , on "click" targetValue (always attackMessage)
    ]
    [ text label ]


debuggingView : a -> Html
debuggingView data =
  div
    [ class "alert alert-info" ]
    [ code
        []
        [ text (toString data) ]
    ]


bootstrap : Html
bootstrap =
  node
    "link"
    [ href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
    , rel "stylesheet"
    ]
    []
