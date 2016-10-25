module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import Blog
import Contact
import About


--model


type alias Model =
    { page : Page
    , blog : Blog.Model
    }


type Page
    = About
    | Blog
    | Contact
    | NotFound


initModel : Model
initModel =
    { page = About
    , blog = Blog.initModel
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, initCommand )


initCommand : Cmd Msg
initCommand =
    Cmd.map BlogMsg Blog.allPosts



-- update


type Msg
    = Navigate Page
    | BlogMsg Blog.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Navigate page ->
            ( { model | page = page }, Cmd.none )

        BlogMsg subMsg ->
            let
                updatedBlogModel =
                    Blog.update subMsg model.blog
            in
                ( { model | blog = updatedBlogModel }, Cmd.none )



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
                    App.map BlogMsg
                        (Blog.view model.blog)

                Contact ->
                    viewPage "Contact Page"

                NotFound ->
                    viewPage "Page not found"
    in
        div []
            [ navBar model
            , hr [] []
            , page
            , p []
                [ text <| toString model
                ]
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
