module Foundation exposing (view)

import Exts.Maybe exposing (maybe, isJust)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Maybe exposing (andThen)
import Types exposing (..)


empty : Html msg
empty =
    text ""


view : Maybe (Config msg) -> Html msg
view maybeConfig =
    let
        displayed =
            isJust maybeConfig

        displayStyle =
            style
                [ ( "display"
                  , if displayed then
                        "block"
                    else
                        "none"
                  )
                ]
    in
        div []
            [ div
                [ class "reveal-overlay"
                , displayStyle
                ]
                [ div
                    [ class "reveal"
                    , displayStyle
                    ]
                    (case maybeConfig of
                        Nothing ->
                            [ empty ]

                        Just config ->
                            [ maybe empty wrapHeader config.header
                            , maybe empty wrapBody config.body
                            , maybe empty wrapFooter config.footer
                            , maybe empty closeButton config.closeMessage
                            ]
                    )
                ]
            , backdrop maybeConfig
            ]


wrapHeader : Html msg -> Html msg
wrapHeader header =
    div [] [ header ]


wrapBody : Html msg -> Html msg
wrapBody body =
    div [] [ body ]


wrapFooter : Html msg -> Html msg
wrapFooter footer =
    div [] [ footer ]


closeButton : msg -> Html msg
closeButton closeMessage =
    button [ class "close-button", onClick closeMessage ]
        [ text "x" ]


backdrop : Maybe (Config msg) -> Html msg
backdrop config =
    div [ classList [ ( "off-canvas-wrapper", isJust config ) ] ]
        []
