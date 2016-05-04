module Dialog (root, Config) where

import Exts.Html.Bootstrap exposing (..)
import Exts.Maybe exposing (maybe, isJust)
import Html exposing (..)
import Html exposing (Html)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (..)


type alias Config =
  { closeMessage : Message
  , header : Maybe Html
  , body : Maybe Html
  , footer : Maybe Html
  }


root : Maybe Config -> Html
root maybeConfig =
  let
    displayed =
      isJust maybeConfig
  in
    div
      []
      [ div
          [ key "modal"
          , classList
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
          [ div
              [ class "modal-dialog" ]
              [ div
                  [ class "modal-content" ]
                  (case maybeConfig of
                    Nothing ->
                      [ empty ]

                    Just config ->
                      [ maybe empty (wrapHeader config.closeMessage) config.header
                      , maybe empty wrapBody config.body
                      , maybe empty wrapFooter config.footer
                      ]
                  )
              ]
          ]
      , backdrop maybeConfig
      ]


wrapHeader : Message -> Html -> Html
wrapHeader closeMessage header =
  div
    [ class "modal-header" ]
    [ button
        [ class "close"
        , on "click" targetValue (always closeMessage)
        ]
        [ text "x" ]
    , header
    ]


wrapBody : Html -> Html
wrapBody body =
  div
    [ class "modal-body" ]
    [ body ]


wrapFooter : Html -> Html
wrapFooter footer =
  div
    [ class "modal-footer" ]
    [ footer ]


backdrop : Maybe Config -> Html
backdrop config =
  div
    [ classList [ ( "modal-backdrop in", isJust config ) ]
    ]
    []
