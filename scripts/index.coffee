jQuery = require 'jquery'


jQuery ($) =>
  # Brighten blend on play button click
  $('#play').click (event) ->
    do event.preventDefault

    $('#container').addClass 'play'

  # Magic line
  # Inspired by https://css-tricks.com/jquery-magicline-navigation/

  # We deal with a #menu ul element
  menu = $('header nav #menu')

  # Add a magic line element
  line = $ "<div class = 'magic-line'>"
  menu.append line

  moveTo = (item) ->
    item  = $(item).find 'a'
    left  = item.position().left
    width = item.width()

    line.css { left, width }

  # Set initial position to active element
  moveTo menu.find '.active'

  # Handle hover event
  into  = (event) -> moveTo event.target
  away  = (event) -> moveTo menu.find '.active'

  $('header nav li').hover into, away
