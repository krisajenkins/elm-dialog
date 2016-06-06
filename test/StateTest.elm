module StateTest exposing (tests)

import Advanced.Heroes.Batman.Types exposing (..)
import Advanced.Heroes.Types as Heroes exposing (View(BatmanView), Msg(BatmanMsg))
import Advanced.State exposing (initialModel, update)
import Advanced.Types exposing (..)
import Advanced.Villains.Types as Villains exposing (View(PenguinView))
import ElmTest exposing (..)


tests : Test
tests =
    ElmTest.suite "State"
        [ test "Attacks get transmitted."
            (assert
                (initialModel.villains.penguin.health
                    > (List.foldl (\action model -> update action model |> fst)
                        initialModel
                        [ HeroesMsg (Heroes.SetView BatmanView)
                        , VillainsMsg (Villains.SetView PenguinView)
                        , HeroesMsg (BatmanMsg Kapow)
                        ]
                      ).villains.penguin.health
                )
            )
        ]
