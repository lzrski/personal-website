View = require 'teacup-view'

module.exports = new View ->
  @doctype 5

  @html =>
    @body =>
      @header =>
        @div id: 'logo', =>
          @h1 'Spookers'
        @nav id: 'menu', =>
          for item in [
            'Home'
            'About us'
            'We are haunting!'
            'After life party'
            'Contact'
          ]
            @a href: '#', item
        @a id: 'sign-up', href: '#', 'Sign up'
        @button id: 'hamburger', 'Menu'

      @tag 'main', =>
        @h2 =>
          @text 'Nunc labortis magna dolor, in pretium massa'
          @strong 'portittor sit. amet.'

        @button id: 'video', 'Play'

        @p "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin gravida neque at nunc lacinia, quis tempus tortor fermentum. Aenean dapibus odio vel bibendum vehicula. Fusce pulvinar laoreet ligula ac scelerisque. Integer vel interdum ex. In semper justo in euismod facilisis."

        @a class: 'more', href: '#more', 'Find out more'
