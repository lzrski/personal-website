View     = require 'teacup-view'
typeform = require './typeform'

module.exports = new View ->

  @div class: 'freelance-container', =>

    @h1 "We are a team of two full stack team of web developers available to be hired for your project."

    typeform()

    @tag 'main', class: 'about', =>
      @div class: "tadeusz", =>
        @img
          class : 'bottom-image'
          src   : '/tadeusz-lazurski-circle-transparent.png'
          alt   : 'Tadeusz Łazurski face - less than a half of it'
          text  : 'Tadeusz Łazurski'
        @h3 'Tadeusz Łazurski'
        @p 'Full stack developer'
      @div class: "dorota", =>
        @img
          class : 'bottom-image'
          src   : '/dorota-cieslinska-circle-transparent.png'
          alt   : 'Dorota Cieslinska'
          text  : 'Dorota Cieslinska'
        @h3 'Dorota Cieslinska'
        @p 'Frontend developer'

    @h2 "Area of expertise"

    @h4 "Product design"
    @p "We can help you choose right feature set and technology stack for your product."
    @p "We have experience in project management and product development in various types of organisations."

    @h4 "Frontend technologies"
    @ul =>
      @li tech for tech in [
        "JavaScript"
        "HTML"
        "CSS"
        "React.js"
        "CoffeeScript"
        "Backbone.js"
        "jQuery"
      ]

    @h4 "Backend technologies"
    @ul =>
      @li tech for tech in [
        "Node.js"
        "RethinkDB"
        "ElasticSearch"
        "SocketIO"
        "Docker"
        "MongoDB"
        "SQL"
      ]

    @h2 "How are we working"

    @p "You can outsource your entire project or it's part to us or hire us to strenghten your existing team."

    @p "We can work remotely or at your office in the Amsterdam area."





    # TODO: @p "Copyright Tadeusz Lazurski & Dorota Cieslinska 2015"
