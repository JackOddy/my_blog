module Blog exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import Http
import Task


--model


type alias Model =
    String


type alias Post =
    { title : String
    , body : String
    , time : String
    , author : String
    }


initModel : Model
initModel =
    "Loading Posts..."


allPosts : Cmd Msg
allPosts =
    let
        url =
            "/api/posts"

        task =
            Http.getString url

        cmd =
            Task.perform Fail AllPosts task
    in
        cmd



--update


type Msg
    = AllPosts String
    | Fail Http.Error


update : Msg -> Model -> Model
update msg model =
    case msg of
        AllPosts json ->
            json

        Fail error ->
            toString <| error



--view


view : Model -> Html Msg
view model =
    div [ class "pane" ]
        [ div [ class "blog" ]
            [ text model ]
        ]
