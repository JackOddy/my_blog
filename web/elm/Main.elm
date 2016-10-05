module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import PostList


--model


type alias Model =
    { page : Page }


type Page
    = About
    | Blog
    | Contact
    | NotFound


initModel : Model
initModel =
    { page = About }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- update


type Msg
    = Navigate Page


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Navigate page ->
            ( { model | page = page }, Cmd.none )



-- view


navBar : Model -> Html Msg
navBar model =
    header []
        [ a [ onClick <| Navigate About ] [ text "About" ]
        , text " | "
        , a [ onClick <| Navigate Blog ] [ text "Blog" ]
        , text " | "
        , a [ onClick <| Navigate Contact ] [ text "Contact" ]
        ]


viewPage : String -> Html Msg
viewPage pageDescription =
    div []
        [ h3 [] [ text pageDescription ]
        , p [] [ text <| "TODO: Make " ++ pageDescription ]
        ]


view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                About ->
                    viewPage "LeaderBoard Page"

                Blog ->
                    viewPage "List of Blog Posts"

                Contact ->
                    viewPage "Contact Page"

                NotFound ->
                    viewPage "Page not found"
    in
        div []
            [ navBar model
            , hr [] []
            , page
            ]



--subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never
main =
    App.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
