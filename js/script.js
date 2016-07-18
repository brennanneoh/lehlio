(function() {
  var done, firstScriptTag, onPlayerReady, onPlayerStateChange, stopVideo, tag;

  window.player = void 0;

  window.videos = [
    {
      artist: 'The Sam Willows',
      videoId: 'B1Pkln6QSdo'
    }, {
      artist: 'dru chen',
      videoId: 'sj_BwW7BaP4'
    }, {
      artist: 'iNCH',
      videoId: '4voFWitEdHA'
    }, {
      artist: 'Wiltay',
      videoId: 'JmE-shAP_2k'
    }, {
      artist: 'Nathan Hartano',
      videoId: 'aPNrKhUlOzI'
    }
  ];

  tag = document.createElement('script');

  tag.src = 'https://www.youtube.com/iframe_api';

  firstScriptTag = document.getElementsByTagName('script')[0];

  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  window.onYouTubeIframeAPIReady = function() {
    var dimension;
    dimension = (function() {
      switch (false) {
        case !(screen.width > 1440):
          return {
            width: '960',
            height: '720'
          };
        case !(screen.width > 480):
          return {
            width: '640',
            height: '480'
          };
      }
    })();
    return window.player = new YT.Player('player', {
      width: dimension.width,
      height: dimension.height,
      videoId: window.videos[_.random(this.videos.length - 1)].videoId,
      playerVars: {
        controls: 0,
        showinfo: 0,
        rel: 0,
        modestbranding: 1
      },
      events: {
        onReady: onPlayerReady,
        onStateChange: onPlayerStateChange
      }
    });
  };

  onPlayerReady = function(event) {};

  done = false;

  onPlayerStateChange = function() {
    if (event.data === YT.PlayerState.PLAYING && !done) {
      setTimeout(stopVideo, 6000);
      return done = true;
    }
  };

  stopVideo = function() {
    return player.stopVideo();
  };

}).call(this);
