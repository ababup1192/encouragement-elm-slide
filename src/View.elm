module View exposing (view)

import Html exposing (Html, Attribute, div, text)
import Html.Attributes exposing (style)
import List.Extra exposing ((!!))
import Model exposing (Model, Route(Slide))
import Slides exposing (slides)
import Messages exposing (Msg)


slideStyle : Attribute Msg
slideStyle =
    style
        [ ( "padding", "50px" )
        ]


view : Model -> Html Msg
view model =
    div [ slideStyle ]
        [ case model.currentPosition of
            Slide currentPosition ->
                case (slides model.count) !! currentPosition of
                    Just slide ->
                        slide

                    Nothing ->
                        text ""
        ]
