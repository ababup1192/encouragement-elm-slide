module Messages exposing (Msg(..))

import Navigation exposing (Location)


type Msg
    = Previous
    | Next
    | KeyDown Int
    | UrlChange Location
    | Increment
    | Decrement
