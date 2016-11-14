module Tests exposing (..)
import Test exposing (..)
import StateTest


tests : Test
tests =
    describe "All"
        [ StateTest.tests ]


