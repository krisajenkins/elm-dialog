module Main (..) where

import Console
import ElmTest exposing (..)
import StateTest
import Task exposing (Task)


tests : Test
tests =
  suite
    "All"
    [ StateTest.tests ]


port runner : Signal (Task x ())
port runner =
  Console.run (consoleRunner tests)
