module Main where

import Prelude

import Data.Array (head)
import Data.Maybe (fromMaybe)
import Data.Traversable (traverse)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (log)
import MediaStream as MS
import MediaStreamTrack as MST

main :: Effect Unit
main = launchAff_ do
  mediaStream <- MS.getUserMedia { audio: true, video: false }
  liftEffect do
    msId <- MS.getId mediaStream
    tracks <- MS.getTracks mediaStream
    labels <- traverse MST.getLabel tracks
    log $ fromMaybe "empty" (head labels)
    _ <- tracks # head # map (MST.setOnStarted (\_ -> log "done")) # pure
    pure unit
