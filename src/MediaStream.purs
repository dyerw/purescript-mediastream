module MediaStream where

import Prelude

import Control.Promise (toAffE, Promise)
import Effect (Effect)
import Effect.Aff (Aff)
import MediaStreamTrack (MediaStreamTrack)

type MediaStreamConstraints = { video :: Boolean, audio :: Boolean }

foreign import data MediaStream :: Type

foreign import newMediaStream :: Effect MediaStream

foreign import _getUserMedia :: MediaStreamConstraints -> Effect (Promise MediaStream)

getUserMedia :: MediaStreamConstraints -> Aff MediaStream
getUserMedia = toAffE <<< _getUserMedia

foreign import isActive :: MediaStream -> Effect Boolean

foreign import isEnded :: MediaStream -> Effect Boolean

foreign import getId :: MediaStream -> Effect String

foreign import getTracks :: MediaStream -> Effect (Array MediaStreamTrack)
