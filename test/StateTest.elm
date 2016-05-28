module StateTest exposing (tests)

import ElmTest exposing (..)
import Advanced.State

tests : Test
tests =
    ElmTest.suite "State"
        [assert (Advanced.State.initialState == 5)
