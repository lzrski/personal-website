jQuery = require 'jquery'


jQuery ($) =>
  # Magic line
  # Inspired by https://css-tricks.com/jquery-magicline-navigation/

  # We deal with a #menu ul element
  menu = $('main #menu')

  # Add a magic line element
  line = $ "<div class = 'magic-line'>"
  menu.append line

  moveTo = (item) ->
    left    = 0
    width   = 0

    try
      item  = $(item).find 'span'
      left  = item.position().left
      width = item.width()
    catch error

    finally
      line.css { left, width }

  # Set initial position to active element
  moveTo menu.find '.active'

  # Handle hover event
  into  = (event) -> moveTo event.target
  away  = (event) -> moveTo menu.find '.active'

  menu
    .find 'li'
    .hover into, away
