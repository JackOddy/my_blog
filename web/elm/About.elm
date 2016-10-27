module About exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Model =
    { about : String }


initModel : Model
initModel =
    { about = "Hi I'm Jack" }


type Msg
    = J


view : Model -> Html Msg
view model =
    div [ class "about" ]
        [ div [] [ text model.about ]
        ]
