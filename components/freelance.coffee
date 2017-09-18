View     = require 'teacup-view'

module.exports = new View (attributes) ->
  @section attributes, => @div class: "container", =>

    @markdown """
      # We are a **full stack** team of **two web programmers** available to be hired for your project.

    """

    @div class: 'team', =>
      @a
        href  : "https://linkedin.com/in/lazurski"
        target: "_blank"
        class : "teammate tadeusz"
        =>
          @img
            src   : '/tadeusz-lazurski-circle-transparent.png'
            alt   : 'Tadeusz Łazurski face - less than a half of it'
          @h3 'Tadeusz Lazurski'
          @p '+31 626 259 386'

      @a
        href  : "https://linkedin.com/in/pinxt"
        target: "_blank"
        class : "teammate marcel"
        =>
          @img
            src   : '/marcel-van-pinxteren-circle-transparent.png'
            alt   : 'Marcel van Pinxteren'
          @h3 'Marcel van Pinxteren'
          @p '+31 657 33 45 86'

    @article =>
      @markdown """
        ## Area of expertise

        We can help you choose **right feature set** and **technology stack** for your product. We have experience in **project management** and **product development** in various types of organisations. We can work remotely or at your office in the Netherlands.
      """
