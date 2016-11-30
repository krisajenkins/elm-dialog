module Advanced.Heroes.View exposing (root, dialog)

import Advanced.Heroes.Batman.View as Batman
import Advanced.Heroes.Superman.View as Superman
import Advanced.Heroes.Types exposing (..)
import Advanced.Heroes.WonderWoman.View as WonderWoman
import Dialog
import Html exposing (..)
import Html.Attributes exposing (..)
import Utils exposing (viewTab)


root : Model -> Html Msg
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
                    |> Html.map BatmanMsg

            SupermanView ->
                Superman.root model.superman
                    |> Html.map SupermanMsg

            WonderWomanView ->
                WonderWoman.root model.wonderWoman
                    |> Html.map WonderWomanMsg
        ]


dialog : Model -> Maybe (Dialog.Config Msg)
dialog model =
    case model.view of
        BatmanView ->
            Batman.dialog model.batman
                |> Dialog.mapMaybe BatmanMsg

        SupermanView ->
            Superman.dialog model.superman
                |> Dialog.mapMaybe SupermanMsg

        WonderWomanView ->
            WonderWoman.dialog model.wonderWoman
                |> Dialog.mapMaybe WonderWomanMsg
