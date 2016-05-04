module Advanced.Villains.Joker.Types (..) where


type alias Model =
  { shots : Int
  , health : Int
  }


type Action
  = Shoot
  | TakeDamage
