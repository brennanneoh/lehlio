player = undefined
tag = document.createElement 'script'
tag.src = 'https://www.youtube.com/iframe_api'
firstScriptTag = document.getElementsByTagName('script')[0]
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag)

@onYouTubeIframeAPIReady = () ->
  player = new YT.Player 'player',
    height: '390'
    width: '640'
    videoId: 'sj_BwW7BaP4'
    events:
      onReady: onPlayerReady
      onStateChange: onPlayerStateChange

onPlayerReady = () ->
  event.target.playVideo()

done = false
onPlayerStateChange = () ->
  if event.data is YT.PlayerState.PLAYING and not done
    setTimeout stopVideo, 6000
    done = true

stopVideo = () ->
  player.stopVideo()
