module StateTest exposing (tests)

import Advanced.Heroes.Batman.Types exposing (..)
import Advanced.Heroes.Types as Heroes exposing (View(BatmanView), Msg(BatmanMsg))
import Advanced.State exposing (initialModel, update)
import Advanced.Types exposing (..)
import Advanced.Villains.Types as Villains exposing (View(PenguinView))
import Expect exposing (..)
import Test exposing (..)
import Tuple exposing (first)


tests : Test
tests =
    describe "State"
        [ test "Attacks get transmitted."
            (always
                (greaterThan initialModel.villains.penguin.health
                    (List.foldl (\action model -> update action model |> first)
                        initialModel
                        [ HeroesMsg (Heroes.SetView BatmanView)
                        , VillainsMsg (Villains.SetView PenguinView)
                        , HeroesMsg (BatmanMsg Kapow)
                        ]
                    ).villains.penguin.health
                )
            )
        ]
