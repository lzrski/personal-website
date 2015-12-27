View      = require 'teacup-view'

module.exports = new View ->
  @doctype 5

  @html =>
    @head =>
      @link rel: 'stylesheet', href: '/index.css'
      @meta name: "viewport", content: "width=device-width, initial-scale=1.0"

    @body =>
      @landing    id: 'landing'
      @freelance  id: 'freelance'

      @script async: yes, src: '/bundle.js'
      @script async: yes, src: '/google-analytics.js'
      @script async: yes, src: "/typeform.js"
