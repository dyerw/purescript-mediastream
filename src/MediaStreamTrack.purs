module MediaStreamTrack where

import Prelude

import Data.Function.Uncurried (Fn3, runFn3)
import Effect (Effect)
import Effect.Uncurried (runEffectFn2, EffectFn1, EffectFn2, mkEffectFn1)
import Web.Event.Event (Event)

foreign import data MediaStreamTrack :: Type

foreign import setContentHint :: MediaStreamTrack -> String -> Effect Unit

foreign import getContentHint :: MediaStreamTrack -> Effect String

foreign import setEnabled :: MediaStreamTrack -> Boolean -> Effect Unit

foreign import getEnabled :: MediaStreamTrack -> Effect Boolean

foreign import getId :: MediaStreamTrack -> Effect String

foreign import isIsolated :: MediaStreamTrack -> Effect Boolean

data MediaStreamTrackKind = Video | Audio

foreign import _getKind :: Fn3 MediaStreamTrack MediaStreamTrackKind MediaStreamTrackKind MediaStreamTrackKind

getKind :: MediaStreamTrack -> MediaStreamTrackKind
getKind mst = runFn3 _getKind mst Video Audio

foreign import getLabel :: MediaStreamTrack -> Effect String

foreign import isMuted :: MediaStreamTrack -> Effect Boolean

foreign import isReadOnly :: MediaStreamTrack -> Effect Boolean

data MediaStreamReadyState = Live | Ended

foreign import _getReadyState :: Fn3 MediaStreamTrack MediaStreamReadyState MediaStreamReadyState MediaStreamReadyState

getReadyState :: MediaStreamTrack -> MediaStreamReadyState
getReadyState mst = runFn3 _getReadyState mst Live Ended

foreign import isRemote :: MediaStreamTrack -> Effect Boolean

foreign import _setOnStarted :: EffectFn2 (EffectFn1 Event Unit) MediaStreamTrack Unit

setOnStarted :: (Event -> Effect Unit) -> MediaStreamTrack  -> Effect Unit
setOnStarted cb mst = runEffectFn2 _setOnStarted (mkEffectFn1 cb) mst

foreign import _setOnEnded :: EffectFn2 (EffectFn1 Event Unit) MediaStreamTrack Unit

setOnEnded :: (Event -> Effect Unit) -> MediaStreamTrack -> Effect Unit
setOnEnded cb mst = runEffectFn2 _setOnEnded (mkEffectFn1 cb) mst
