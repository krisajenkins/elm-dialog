module Tests exposing (..)

import StateTest
import Test exposing (..)


tests : Test
tests =
    describe "All"
        [ StateTest.tests ]
