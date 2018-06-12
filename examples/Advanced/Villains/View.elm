module Advanced.Villains.View exposing (dialog, root)

import Advanced.Villains.Joker.View as Joker
import Advanced.Villains.Penguin.View as Penguin
import Advanced.Villains.Types
    exposing
        ( Model
        , Msg(JokerMsg, PenguinMsg, SetView)
        , View(JokerView, PenguinView)
        )
import Dialog
import Html exposing (Html, div, h1, text, ul)
import Html.Attributes exposing (class)
import Utils exposing (viewTab)


root : Model -> Html Msg
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
                    |> Html.map JokerMsg

            PenguinView ->
                Penguin.root model.penguin
                    |> Html.map PenguinMsg
        ]


dialog : Model -> Maybe (Dialog.Config Msg)
dialog model =
    case model.view of
        JokerView ->
            Joker.dialog model.joker
                |> Dialog.mapMaybe JokerMsg

        PenguinView ->
            Penguin.dialog model.penguin
                |> Dialog.mapMaybe PenguinMsg
