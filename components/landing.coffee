View     = require 'teacup-view'
typeform = require './typeform'

module.exports = new View (attributes) ->
  @section attributes, => @div class: "container", =>
    @header =>
      @h1 =>
        @raw "<strong>Hello</strong>, my name is Tadeusz."
        do @br
        @raw "I'm a <strong>full stack web developer</strong>."

      @img
        class : 'main-image'
        src   : '/tadeusz-lazurski-circle-transparent.png'
        alt   : 'Tadeusz Łazurski face - less than a half of it'

    @tag 'main', =>

      @markdown """
        Together with my partner (a frontend developer) we enjoy solving problems using **Node.js**, **React.js** and **CoffeeScript** in the wonderful Amsterdam. You can **[hire us for your project](#freelance)**.
      """

    @footer =>
      @ul id: 'menu', =>
        @li class: 'caption', => @span "Get in touch via"
        (@li => @a { href },  => @span label) for label, href of {
          'GitHub'        : 'https://github.com/lzrski'
          'StackOverflow' : 'https://careers.stackoverflow.com/lazurski'
          'Twitter'       : 'https://twitter.com/lazurski'
          'LinkedIn'      : 'https://linkedin.com/in/lazurski'
        }

      # @a
      #   class : 'source'
      #   href  : 'https://github.com/lzrski/personal-website'
      #   'Fork this website at GitHub'
