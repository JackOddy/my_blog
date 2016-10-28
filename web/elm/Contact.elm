module Contact exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


--model


type alias Model =
    { job : String
    , github : String
    , twitter : String
    , email : String
    }


initModel : Model
initModel =
    { job = ""
    , github = "github.com/jackoddy"
    , twitter = ""
    , email = "jack.oddy@gmail.com"
    }



--view


type Msg
    = J


view : Model -> Html Msg
view model =
    div [ class "pane" ]
        [ div [ class "contact" ]
            [ div [ class "github" ] [ text model.github ]
            , div [ class "email" ] [ text model.email ]
            ]
        ]
