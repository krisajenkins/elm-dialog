module Advanced.Villains.View exposing (root, dialog)

import Advanced.Villains.Joker.View as Joker
import Advanced.Villains.Penguin.View as Penguin
import Advanced.Villains.Types exposing (..)
import Dialog
import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Utils exposing (..)


root : Model -> Html Message
root model =
    div []
        [ h1 [] [ text "Villains" ]
        , ul [ class "nav nav-tabs" ]
            (List.map (viewTab SetView model.view)
                [ ( JokerView, "Joker" )
                , ( PenguinView, "Penguin" )
                ]
            )
        , case model.view of
            JokerView ->
                Joker.root model.joker
                    |> Html.App.map JokerMessage

            PenguinView ->
                Penguin.root model.penguin
                    |> Html.App.map PenguinMessage
        ]


dialog : Model -> Maybe (Dialog.Config Message)
dialog model =
    case model.view of
        JokerView ->
            Joker.dialog model.joker
                |> Dialog.mapMaybe JokerMessage

        PenguinView ->
            Penguin.dialog model.penguin
                |> Dialog.mapMaybe PenguinMessage
