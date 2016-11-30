port module Main exposing (..)

import Json.Encode exposing (Value)
import Test.Runner.Node exposing (..)
import Tests


main : TestProgram
main =
    run emit Tests.tests


port emit : ( String, Value ) -> Cmd msg
