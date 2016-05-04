module Dialog (view, Config) where

{-| Elm Modal Dialogs.

@docs view, Config
-}

import Exts.Html.Bootstrap exposing (..)
import Exts.Maybe exposing (maybe, isJust)
import Html exposing (..)
import Html exposing (Html)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (..)


{-| Renders a modal dialog whenever you supply a `Config`.

To use this, include this view in your *top-level* view function,
right at the top of the DOM tree. Then call it with `Nothing` whenever
you want the modal to be hidden, and a `Just Dialog.Config` value when
you want it shown.
-}
view : Maybe Config -> Html
view maybeConfig =
  let
    displayed =
      isJust maybeConfig
  in
    div
      []
      [ div
          [ key "dialog"
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


{-| The configuration for the dialog you display. The `header`, `body`
and `footer` are all optional. Use only the ones you want.

The `closeMessage` is a mandatory message we will send when the user
clicks to dismiss the modal.
-}
type alias Config =
  { closeMessage : Message
  , header : Maybe Html
  , body : Maybe Html
  , footer : Maybe Html
  }
