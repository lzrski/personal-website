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

# Database
Firebase   = require 'firebase'
# TODO: Read URL from configuration
database   = new Firebase 'https://lazurski-pl-form.firebaseio.com/'

jQuery ($) =>
  # On submit send form data to Firebase
  form = $ '#contact'
  thnx = $ '#thank-you'

  form.on 'submit', (event) =>
    do event.preventDefault
    form
      .find 'button'
      .prop 'disabled', yes

    inquiry = {}

    form
      .find 'input, textarea'
      .each (i, element) =>
        inquiry[element.name] = element.value

    database.push inquiry, (error) =>
      if error then return alert error
      form.addClass 'sent'
      thnx.addClass 'visible'
