View = require 'teacup-view'

module.exports = new View ->
  @doctype 5

  @html =>
    @head =>
      @link rel: 'stylesheet', href: 'index.css'
      @meta name: "viewport", content: "width=device-width, initial-scale=1.0"

    @body =>
      @div id: 'container', =>
        @header =>
          @h1 class: 'title', 'Tadeusz Łazurski'

          @nav =>
            @ul id: 'menu', =>
              for path, label of {
                'home'    : 'Home'
                'about'   : 'About us'
                'haunt'   : 'We\'re haunting!'
                'party'   : 'After life party'
                'contact' : 'Contact'
              }
                @li
                  class: 'active' if path is 'home'
                  =>
                    @a href: "##{path}", label

            @a id: 'sign-up', href: '#', 'Sign up'

            @button id: 'hamburger', =>
              @object type: 'image/svg+xml', data: 'hamburger.svg', =>
                'Menu'

        @tag 'main', =>
          @h2 =>
            @raw "<strong>Hello</strong>, my name is Tadeusz."
            do @br
            @raw "I'm a <strong>full stack web developer</strong>."

          @img
            class : 'main-image'
            src   : 'tadeusz-lazurski-circle-transparent.png'
            alt   : 'Tadeusz Łazurski face - less than a half of it'

          @p => @raw "Currently I'm interested in full time position in Europe, preferably involving <strong>Node.js</strong>, <strong>React.js</strong> and <strong>CoffeeScript</strong>."

          @a class: 'more', href: '#more', 'Find out more'


      @script src: 'bundle.js'
