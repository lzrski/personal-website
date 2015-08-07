$ = require 'jquery'

# Brighten blend on play button click
$('#play').click (event) ->
  do event.preventDefault

  $('#container').addClass 'play'

# TODO: https://css-tricks.com/jquery-magicline-navigation/
