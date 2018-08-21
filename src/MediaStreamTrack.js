exports.setContentHint = function(mst, ch) {
  return function() {
    mst.contentHint = ch;
  };
};

exports.getContentHint = function(mst) {
  return function() {
    return mst.contentHint;
  };
};

exports.setEnabled = function(mst, enabled) {
  return function() {
    msg.enabled = enabled;
  };
};

exports.getEnabled = function(mst) {
  return function() {
    return mst.enabled;
  };
};

exports.getId = function(mst) {
  return function() {
    return mst.id;
  };
};

exports.isIsolated = function(mst) {
  return function() {
    return mst.isolated;
  };
};

exports._getKind = function(mst, video, audio) {
  return function() {
    const kind = mst.kind;
    if (kind === "video") {
      return video.value;
    }
    if (kind === "audio") {
      return audio.value;
    }
  };
};

exports.getLabel = function(mst) {
  return function() {
    return mst.label;
  };
};

exports.isMuted = function(mst) {
  return function() {
    return mst.muted;
  };
};

exports.isReadOnly = function(mst) {
  return function() {
    return mst.readonly;
  };
};

exports._getReadyState = function(mst, live, ended) {
  return function() {
    const readyState = mst.readyState;
    if (readyState === "live") {
      return live.value;
    }
    if (readyState === "ended") {
      return ended.value;
    }
  };
};

exports.isRemote = function(mst) {
  return function() {
    return mst.remote;
  };
};

exports._setOnStarted = function(cb, mst) {
  mst.onstarted = cb;
};

exports._setOnEnded = function(cb, mst) {
  mst.onended = cb;
};
