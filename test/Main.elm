module Main exposing (..)

import ElmTest exposing (..)
import StateTest


tests : Test
tests =
    suite "All"
        [ StateTest.tests ]


main : Program Never
main =
    runSuite tests
