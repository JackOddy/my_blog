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
    , contact : Contact.Model
    , about : About.Model
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
    , contact = Contact.initModel
    , about = About.initModel
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, initCommand )


initCommand : Cmd Msg
initCommand =
    Cmd.map BlogMsg Blog.allPosts



-- update


type Msg
    = Navigate Direction 
    | BlogMsg Blog.Msg
    | ContactMsg Contact.Msg
    | AboutMsg About.Msg

type Direction
  = Left
  | Right

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Navigate direction ->
          let
              page = changePage direction
          in
            ( { model | page = page }, Cmd.none )

        BlogMsg subMsg ->
            let
                updatedBlogModel =
                    Blog.update subMsg model.blog
            in
                ( { model | blog = updatedBlogModel }, Cmd.none )

        ContactMsg subMsg ->
            ( model, Cmd.none )

        AboutMsg subMsg ->
            ( model, Cmd.none )


changePage : Direction -> Page
changePage direction =
  case direction of
    Left ->
      --stuff
    Right ->
      -- stuff

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

aboutPage : Model -> Html Msg
aboutPage model =
    App.map AboutMsg <| About.view model.about


blogPage : Model -> Html Msg
blogPage model =
    App.map BlogMsg <| Blog.view model.blog


contactPage : Model -> Html Msg
contactPage model =
    App.map ContactMsg <| Contact.view model.contact


view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                About ->
                    App.map AboutMsg
                        (About.view model.about)

                Blog ->
                    App.map BlogMsg
                        (Blog.view model.blog)

                Contact ->
                    App.map ContactMsg
                        (Contact.view model.contact)

                NotFound ->
                    div [] []
    in
        div [ class "container" ]
            [ navBar model
            , hr [] []
            , div [ class "view" ]
                [ div [ class "arrow-bar" ]
                    [ div [ class "left arrow", onClick <| Navigate Left ] []
                    , div [ class "right arrow", <| Navigate Right ] []
                    ]
                , div
                    [ class "strip", id <| toString model.page ]
                    [ aboutPage model
                    , blogPage model
                    , contactPage model
                    ]
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
