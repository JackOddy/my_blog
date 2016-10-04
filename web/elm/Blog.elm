module Blog exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Html.App as App
import Login
import About
import Contact
import Post


-- model


type alias Model =
    { page : Page
    , login : Login
    , about : About
    , contact : Contact
    , post : Post
    }


type Page
    = LoginPage
    | AboutPage
    | ContactPage
    | PostPage


initModel : Model
initModel =
    { page = AboutPage
    , login = Login
    , about = About
    , contact = Contact
    , post = Post
    }



-- update
