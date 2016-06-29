module Types exposing (..)

import Html exposing (..)


type alias Config msg =
    { closeMessage : Maybe msg
    , header : Maybe (Html msg)
    , body : Maybe (Html msg)
    , footer : Maybe (Html msg)
    }
