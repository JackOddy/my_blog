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


init : ( Model, Cmd Msg )
init =
    ( initModel, allPosts )


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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AllPosts json ->
            ( json, Cmd.none )

        Fail error ->
            ( toString <| error, Cmd.none )



--view


view : Model -> Html Msg
view model =
    div []
        [ text model ]



--subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main =
    App.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
