module Advanced.Villains.Penguin.View exposing (root, dialog)

import Advanced.Villains.Penguin.Types exposing (..)
import Dialog
import Html exposing (..)
import Utils exposing (..)


root : Model -> Html Msg
root model =
    div []
        [ h2 [] [ text "Penguin" ]
        , debuggingView model
        , actionButton ( Wark, "Wark!" )
        ]


dialog : Model -> Maybe (Dialog.Config Msg)
dialog model =
    case model.state of
        Quiet ->
            Nothing

        Hurt ->
            Just
                { closeMessage = Just Close
                , containerClass = Just "penguin-modal-container"
                , header = Just (h1 [] [ text "Penguin says, \"Ouch!\"" ])
                , body = Just (text "The penguin tries to dodge, which goes badly because penguins lack grace on land.")
                , footer = Just (actionButton ( Close, "Take the pain" ))
                }

        Warking ->
            Just
                { closeMessage = Just Close
                , containerClass = Just "penguin-modal-container"
                , header = Just (h1 [] [ text "Penguin says, \"Wark!\"" ])
                , body = Just (text "The Penguin laughs his weird laugh")
                , footer = Just (actionButton ( Close, "Calm down" ))
                }
