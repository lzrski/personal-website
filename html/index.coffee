View      = require 'teacup-view'


module.exports = new View ->
  @doctype 5

  @html lang: 'en', =>
    @head =>
      @link rel: 'stylesheet', href: '/index.css'
      @meta name: "viewport", content: "width=device-width, initial-scale=1.0"


    @body =>
      @landing    id: 'landing'
      @freelance  id: 'freelance'
      @footer => @markdown """
        Copyright Tadeusz Lazurski & Marcel van Pinxteren 2017

        This website is open-source. You can [fork it on GitHub](https://github.com/lzrski/personal-website).
      """

      @script async: yes, src: '/bundle.js'
      # @script async: yes, src: '/google-analytics.js'
      # @script async: yes, src: "/typeform.js"
