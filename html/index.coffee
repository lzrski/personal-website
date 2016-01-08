View      = require 'teacup-view'


module.exports = new View ->
  @doctype 5

  @html lang: 'en', =>
    @head =>
      @script src:"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"

      @link rel: 'stylesheet', href: '/index.css'
      @meta name: "viewport", content: "width=device-width, initial-scale=1.0"


    @body =>
      @landing    id: 'landing'
      @freelance  id: 'freelance'
      @footer => @markdown """
        Copyright Tadeusz Lazurski & Dorota Cieslinska 2015

        This website is open-source. You can [fork it on GitHub](https://github.com/lzrski/personal-website).
      """

      @script async: yes, src: '/bundle.js'
      @script async: yes, src: '/google-analytics.js'
      @script async: yes, src: "/typeform.js"
