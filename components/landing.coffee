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
        Talk with us about your idea.

        First design session is free and with no obligations.
      """

    # @footer =>
    #   @ul id: 'menu', =>
    #     @li class: 'caption', => @span "Get in touch via"
    #     (@li => @a { href },  => @span label) for label, href of {
    #       'GitHub'        : 'https://github.com/lzrski'
    #       'StackOverflow' : 'https://careers.stackoverflow.com/lazurski'
    #       'Twitter'       : 'https://twitter.com/lazurski'
    #       'LinkedIn'      : 'https://linkedin.com/in/lazurski'
    #     }

      # @a
      #   class : 'source'
      #   href  : 'https://github.com/lzrski/personal-website'
      #   'Fork this website at GitHub'
