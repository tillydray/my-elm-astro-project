module Main exposing (main)

import Browser
import Html exposing (Html, a, div, h3, img, main_, p, text)
import Html.Attributes exposing (alt, class, href, src, style)
import Http
import Json.Decode as Decode


main : Program () Model Msg
main =
    Browser.element
        { init = \flags -> init flags
        , subscriptions = \_ -> Sub.none
        , update = update
        , view = view
        }


type alias Model =
    { stories :
        List Story
    }


type alias Story =
    { imageUrl : String
    , imageAlt : String
    , title : String
    , description : String
    , linkUrl : String
    , linkText : String
    }


storyDecoder : Decode.Decoder Story
storyDecoder =
    Decode.map6 Story
        (Decode.field "imageUrl" Decode.string)
        (Decode.field "imageAlt" Decode.string)
        (Decode.field "title" Decode.string)
        (Decode.field "description" Decode.string)
        (Decode.field "linkUrl" Decode.string)
        (Decode.field "linkText" Decode.string)


storiesDecoder : Decode.Decoder (List Story)
storiesDecoder =
    Decode.list storyDecoder


init : () -> ( Model, Cmd Msg )
init _ =
    ( { stories = [] }
    , Http.get
        { url = "http://localhost:4321/api/stories.json"
        , expect = Http.expectJson StoriesLoaded storiesDecoder
        }
    )


type Msg
    = NoOp
    | StoriesLoaded (Result Http.Error (List Story))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StoriesLoaded res ->
            case res of
                Ok loadedStories ->
                    ( { model | stories = loadedStories }, Cmd.none )

                Err _ ->
                    -- TODO set an error message in the model
                    ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    main_ []
        (List.map viewStory model.stories)


viewStory : Story -> Html msg
viewStory story =
    div
        [ class "story-container" ]
        [ div [ class "story-image-container" ]
            [ img [ src story.imageUrl, alt story.imageAlt, class "story-image" ] [] ]
        , h3 [] [ text story.title ]
        , p [] [ text story.description ]
        , a [ href story.linkUrl ] [ text story.linkText ]
        ]
