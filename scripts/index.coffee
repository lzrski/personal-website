jQuery      = require 'jquery'
{debounce}  = require 'lodash'

jQuery ($) =>
  # Magic line
  # Inspired by https://css-tricks.com/jquery-magicline-navigation/

  # We deal with a #menu ul element
  menu = $('#menu')

  # Add a magic line element
  line = $ "<div class = 'magic-line'>"
  menu.append line

  # General movement function
  moveTo = (item) ->
    item  = $(item).find 'span'
    left  = item.position().left
    width = item.width()

    line.css { left, width }

  # Handler for hover event
  reset = debounce (=> moveTo menu.find '.caption'), 200
  enter = (event) =>
    do reset.cancel
    moveTo event.target

  menu
    .find 'li'
    .hover enter, reset

  # Set initial position
  $(window)
    .on 'load'  , reset
    .on 'resize', reset

  beforePrint = =>
    $('h1').text 'Printing?'

  afterPrint = =>
    $('h1').text 'Done printing?'

  if window.matchMedia?
    mediaQueryList = window.matchMedia 'print'
    mediaQueryList.addListener (mql) =>
      if mql.matches then do beforePrint
      else do afterPrint

  window.onbeforeprint  = beforePrint;
  window.onafterprint   = afterPrint;
