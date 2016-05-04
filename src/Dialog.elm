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
right at the top of the DOM tree, like so:

    type Action
      = ...
      | ...
      | AcknowledgeDialog


    view : Address Action -> Model -> Html
    view address model =
      div
        []
        [ ...
        , ...your regular view code....
        , ...
        , Dialog.view
            (if model.shouldShowDialog then
              Just { closeMessage = Signal.message address AcknowledgeDialog
                   , header = Just (text "Alert!"
                   , body = Just (p [] [text "Let me tell you something important..."])
                   , footer = Nothing
                   }
             else
              Nothing
            )
        ]


It's then up to you to replace `model.shouldShowDialog` with whatever
logic should cause the dialog to be displayed, and to handle an
`AcknowledgeDialog` action with whatever logic should occur when the user
closes the dialog.

See the `examples/` directory for working examples of how this works
for apps large and small.

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
    [ classList [ ( "modal-backdrop in", isJust config ) ] ]
    []


{-| The configuration for the dialog you display. The `header`, `body`
and `footer` are all optional `Html` blocks. Those `Html` blocks can
be as simple or as complex as any other view function.

Use only the ones you want and set the others to `Nothing`.

The `closeMessage` is a mandatory `Signal.Message` we will send when the user
clicks to dismiss the modal.
-}
type alias Config =
  { closeMessage : Message
  , header : Maybe Html
  , body : Maybe Html
  , footer : Maybe Html
  }
