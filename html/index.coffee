View = require 'teacup-view'

module.exports = new View ->
  @doctype 5

  @html =>
    @head =>
      @link rel: 'stylesheet', href: '/main.css'

    @body =>
      @div id: 'container', =>
        @header =>
          @div id: 'logo', =>
            @img src: 'logo.png', alt: 'Spookers logo'

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
            @text 'Nunc labortis magna dolor, in pretium massa '
            @strong 'portittor sit. amet.'

          @button id: 'video', 'Play'

          @p "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin gravida neque at nunc lacinia, quis tempus tortor fermentum. Aenean dapibus odio vel bibendum vehicula. Fusce pulvinar laoreet ligula ac scelerisque. Integer vel interdum ex. In semper justo in euismod facilisis."

          @a class: 'more', href: '#more', 'Find out more'
