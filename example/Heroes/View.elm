module Heroes.View (root, modal) where

import Dialog
import Utils exposing (..)
import Signal exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Heroes.Types exposing (..)
import Heroes.Batman.View as Batman
import Heroes.Superman.View as Superman
import Heroes.WonderWoman.View as WonderWoman


root : Address Action -> Message -> Model -> Html
root address attackMessage model =
  div
    []
    [ h1 [] [ text "Heroes" ]
    , div
        [ class "well" ]
        [ case model.view of
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
    , div
        [ class "btn-group" ]
        (List.map
          (actionButton address)
          [ ( SetView BatmanView, "Batman" )
          , ( SetView SupermanView, "Superman" )
          , ( SetView WonderWomanView, "WonderWoman" )
          ]
        )
    ]


modal : Address Action -> Model -> Maybe Dialog.Config
modal address model =
  case model.view of
    BatmanView ->
      Batman.modal (forwardTo address BatmanAction) model.batman

    SupermanView ->
      Superman.modal (forwardTo address SupermanAction) model.superman

    WonderWomanView ->
      WonderWoman.modal (forwardTo address WonderWomanAction) model.wonderWoman
