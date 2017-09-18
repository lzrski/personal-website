View     = require 'teacup-view'
typeform = require './typeform'

module.exports = new View (attributes) ->
  @section attributes, => @div class: "container", =>
    @header =>
      @h1 =>
        @raw "<strong>Hello</strong>, we are TandM."
        do @br
        @raw "We provide <strong>agile software product development</strong>."

      # TODO: TandM logo
      # @img
      #   class : 'main-image'
      #   src   : '/tadeusz-lazurski-circle-transparent.png'
      #   alt   : 'Tadeusz Łazurski face - less than a half of it'

    @tag 'main', =>

      @markdown """
        **Talk** with us about your idea. First design session is **free and with no further obligations**. [Learn more](#freelance).
      """
