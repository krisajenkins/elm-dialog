module Advanced.Heroes.View exposing (root, dialog)

import Advanced.Heroes.Batman.View as Batman
import Advanced.Heroes.Superman.View as Superman
import Advanced.Heroes.Types exposing (..)
import Advanced.Heroes.WonderWoman.View as WonderWoman
import Dialog
import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Utils exposing (viewTab)


root : Model -> Html Message
root model =
  div []
    [ h1 [] [ text "Heroes" ]
    , ul [ class "nav nav-tabs" ]
        (List.map (viewTab SetView model.view)
          [ ( BatmanView, "Batman" )
          , ( SupermanView, "Superman" )
          , ( WonderWomanView, "Wonder Woman" )
          ]
        )
    , case model.view of
        BatmanView ->
          Batman.root model.batman
            |> Html.App.map BatmanMessage

        SupermanView ->
          Superman.root model.superman
            |> Html.App.map SupermanMessage

        WonderWomanView ->
          WonderWoman.root model.wonderWoman
            |> Html.App.map WonderWomanMessage
    ]


dialog : Model -> Maybe (Dialog.Config Message)
dialog model =
  case model.view of
    BatmanView ->
      Batman.dialog model.batman
        |> Dialog.mapMaybe BatmanMessage

    SupermanView ->
      Superman.dialog model.superman
        |> Dialog.mapMaybe SupermanMessage

    WonderWomanView ->
      WonderWoman.dialog model.wonderWoman
        |> Dialog.mapMaybe WonderWomanMessage
