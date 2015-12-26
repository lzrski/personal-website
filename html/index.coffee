View      = require 'teacup-view'
freelance = require './freelance'

module.exports = new View ->
  @doctype 5

  @html =>
    @head =>
      @link rel: 'stylesheet', href: '/index.css'
      @meta name: "viewport", content: "width=device-width, initial-scale=1.0"

    @body =>
      @div id: 'container', =>

        # created new div for first page:
        @div class: "landing-container", =>
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

            @p => @raw "I enjoy solving problems using <strong>Node.js</strong>, <strong>React.js</strong> and <strong>CoffeeScript</strong> at <a href='http://beestar.eu/'><strong>Beestar</strong></a> - an IoT company based in wonderful Amsterdam."

            @p =>
              @text "Together with my partner, a frontend developer, we are also available for "
              @a href: '/', 'freelance contracts'
              @text '.'
            # icon for scrolling
            # TODO: scroll: on click move to the next page


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

        freelance()

      @script src: '/bundle.js'
      @script src: '/google-analytics.js'
