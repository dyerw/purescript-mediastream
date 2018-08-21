exports.newMediaStream = function() {
  return new MediaStream();
};

exports._getUserMedia = function(constraints) {
  return function() {
    return navigator.mediaDevices.getUserMedia(constraints);
  };
};

exports.isActive = function(mediaStream) {
  return function() {
    return mediaStream.active;
  };
};

exports.isEnded = function(mediaStream) {
  return function() {
    return mediaStream.ended;
  };
};

exports.getId = function(mediaStream) {
  return function() {
    return mediaStream.id;
  };
};

exports.getTracks = function(mediaStream) {
  return function() {
    return mediaStream.getTracks();
  };
};
