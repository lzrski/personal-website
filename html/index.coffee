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
        Made by [Tadeusz Lazurski](https://www.lazurski.pl/) 2017. Awesome background photo by [Erika Barker](https://ebstock.deviantart.com/).

        This website is open-source. You can [fork it on GitHub](https://github.com/lzrski/personal-website).
      """

      @script async: yes, src: '/bundle.js'
