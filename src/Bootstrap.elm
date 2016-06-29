module Bootstrap exposing (view)

import Exts.Html.Bootstrap exposing (..)
import Exts.Maybe exposing (maybe, isJust)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe exposing (andThen)
import Types exposing (..)


view : Maybe (Config msg) -> Html msg
view maybeConfig =
    let
        displayed =
            isJust maybeConfig
    in
        div []
            [ div
                ([ classList
                    [ ( "modal", True )
                    , ( "in", displayed )
                    ]
                 , style
                    [ ( "display"
                      , if displayed then
                            "block"
                        else
                            "none"
                      )
                    ]
                 ]
                )
                [ div [ class "modal-dialog" ]
                    [ div [ class "modal-content" ]
                        (case maybeConfig of
                            Nothing ->
                                [ empty ]

                            Just config ->
                                [ wrapHeader config.closeMessage config.header
                                , maybe empty wrapBody config.body
                                , maybe empty wrapFooter config.footer
                                ]
                        )
                    ]
                ]
            , backdrop maybeConfig
            ]


wrapHeader : Maybe msg -> Maybe (Html msg) -> Html msg
wrapHeader closeMessage header =
    if closeMessage == Nothing && header == Nothing then
        empty
    else
        div [ class "modal-header" ]
            [ maybe empty closeButton closeMessage
            , Maybe.withDefault empty header
            ]


closeButton : msg -> Html msg
closeButton closeMessage =
    button [ class "close", onClick closeMessage ]
        [ text "x" ]


wrapBody : Html msg -> Html msg
wrapBody body =
    div [ class "modal-body" ]
        [ body ]


wrapFooter : Html msg -> Html msg
wrapFooter footer =
    div [ class "modal-footer" ]
        [ footer ]


backdrop : Maybe (Config msg) -> Html msg
backdrop config =
    div [ classList [ ( "modal-backdrop in", isJust config ) ] ]
        []
