window.player = undefined

window.videos = [
  { artist: 'The Sam Willows', videoId: 'B1Pkln6QSdo' }
  { artist: 'dru chen', videoId: 'sj_BwW7BaP4' }
  { artist: 'iNCH', videoId: '4voFWitEdHA' }
  { artist: 'Wiltay', videoId: 'JmE-shAP_2k' }
  { artist: 'Nathan Hartano', videoId: 'aPNrKhUlOzI' }
  { artist: 'Shirlyn Tan', videoId: 'f59ATP8-jNc' }
]

tag = document.createElement 'script'
tag.src = 'https://www.youtube.com/iframe_api'
firstScriptTag = document.getElementsByTagName('script')[0]
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag)

window.onYouTubeIframeAPIReady = () ->
  window.player = new YT.Player 'player',
    videoId: window.videos[_.random(@videos.length - 1)].videoId
    playerVars:
      controls: 0
      showinfo: 0
      iv_load_policy: 3
      rel: 0
      modestbranding: 1
    events:
      onReady: onPlayerReady
      onStateChange: onPlayerStateChange

onPlayerReady = (event) ->
  return # do something here

done = false
onPlayerStateChange = () ->
  if event.data is YT.PlayerState.PLAYING and not done
    setTimeout stopVideo, 6000
    done = true

stopVideo = () ->
  player.stopVideo()
