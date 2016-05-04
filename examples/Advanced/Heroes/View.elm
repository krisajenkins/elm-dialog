module Advanced.Heroes.View (root, dialog) where

import Dialog
import Signal exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Advanced.Heroes.Types exposing (..)
import Advanced.Heroes.Batman.View as Batman
import Advanced.Heroes.Superman.View as Superman
import Advanced.Heroes.WonderWoman.View as WonderWoman
import Utils exposing (..)


root : Address Action -> Message -> Model -> Html
root address attackMessage model =
  div
    []
    [ h1 [] [ text "Heroes" ]
    , ul
        [ class "nav nav-tabs" ]
        (List.map
          (viewTab address SetView model.view)
          [ ( BatmanView, "Batman" )
          , ( SupermanView, "Superman" )
          , ( WonderWomanView, "Wonder Woman" )
          ]
        )
    , case model.view of
        BatmanView ->
          Batman.root
            (forwardTo address BatmanAction)
            attackMessage
            model.batman

        SupermanView ->
          Superman.root (forwardTo address SupermanAction) model.superman

        WonderWomanView ->
          WonderWoman.root (forwardTo address WonderWomanAction) model.wonderWoman
    ]


dialog : Address Action -> Model -> Maybe Dialog.Config
dialog address model =
  case model.view of
    BatmanView ->
      Batman.dialog (forwardTo address BatmanAction) model.batman

    SupermanView ->
      Superman.dialog (forwardTo address SupermanAction) model.superman

    WonderWomanView ->
      WonderWoman.dialog (forwardTo address WonderWomanAction) model.wonderWoman
