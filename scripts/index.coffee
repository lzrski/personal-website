$ = jQuery  = require 'jquery'

jQuery(window).load =>
  # Magic line
  # Inspired by https://css-tricks.com/jquery-magicline-navigation/

  # We deal with a #menu ul element
  menu = $('#menu')

  # Add a magic line element
  line = $ "<div class = 'magic-line'>"
  menu.append line

  moveTo = (item) ->
    item  = $(item).find 'span'
    left  = item.position().left
    width = item.width()

    line.css { left, width }

  # Set initial position to active element
  moveTo menu.find '.caption'

  # Handle hover event
  into  = (event) -> moveTo event.target
  away  = (event) -> moveTo menu.find '.caption'

  menu
    .find 'li'
    .hover into, away
