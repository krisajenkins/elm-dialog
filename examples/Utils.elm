module Utils exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


both : (a -> b) -> ( a, a ) -> ( b, b )
both f ( x, y ) =
    ( f x, f y )


viewTab : (view -> msg) -> view -> ( view, String ) -> Html msg
viewTab viewMsg currentView ( view, title ) =
    li [ classList [ ( "active", currentView == view ) ] ]
        [ a [ onClick (viewMsg view) ]
            [ text title ]
        ]


actionButton : ( msg, String ) -> Html msg
actionButton ( action, label ) =
    button
        [ class "btn btn-info"
        , onClick action
        ]
        [ text label ]


attackButton : msg -> String -> Html msg
attackButton attackMsg label =
    button
        [ class "btn btn-success"
        , onClick attackMsg
        ]
        [ text label ]


debuggingView : a -> Html msg
debuggingView data =
    div [ class "alert alert-info" ]
        [ code []
            [ text (toString data) ]
        ]


bootstrap : Html msg
bootstrap =
    node "link"
        [ href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
        , rel "stylesheet"
        ]
        []
