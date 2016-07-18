window.player = undefined

window.videos = [
  { artist: 'The Sam Willows', videoId: 'B1Pkln6QSdo' }
  { artist: 'dru chen', videoId: 'sj_BwW7BaP4' }
  { artist: 'iNCH', videoId: '4voFWitEdHA' }
  { artist: 'Wiltay', videoId: 'JmE-shAP_2k' }
  { artist: 'Nathan Hartano', videoId: 'aPNrKhUlOzI' }
]

tag = document.createElement 'script'
tag.src = 'https://www.youtube.com/iframe_api'
firstScriptTag = document.getElementsByTagName('script')[0]
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag)

window.onYouTubeIframeAPIReady = () ->
  dimension = switch
    when screen.width > 1440 then { width: '960', height: '720' }
    when screen.width > 480 then { width: '640', height: '480' }

  window.player = new YT.Player 'player',
    width: dimension.width
    height: dimension.height
    videoId: window.videos[_.random(@videos.length - 1)].videoId
    playerVars:
      controls: 0
      showinfo: 0
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
