View     = require 'teacup-view'

module.exports = new View (attributes) ->
  @section attributes, =>

    @h1 "We are a full stack team of two web developers available to be hired for your project."

    @div class: 'team', =>
      @a
        href  : "#landing"
        class : "teammate tadeusz"
        =>
          @img
            src   : '/tadeusz-lazurski-circle-transparent.png'
            alt   : 'Tadeusz Łazurski face - less than a half of it'
          @h3 'Tadeusz Łazurski'
          @p 'Full stack developer'

      @a
        href  : "http://lori2lori.rocks"
        class : "teammate dorota"
        =>
          @img
            src   : '/dorota-cieslinska-circle-transparent.png'
            alt   : 'Dorota Cieslinska'
          @h3 'Dorota Cieslinska'
          @p 'Frontend developer'

    @article =>
      @h2 "Area of expertise"

      @h4 "Product design"

      @p "We can help you choose right feature set and technology stack for your product."

      @p "We have experience in project management and product development in various types of organisations."

      @h4 "Frontend technologies"

      @grid items: [
        title: "JavaScript"
      ,
        title: "HTML"
      ,
        title: "CSS"
      ,
        title: "React.js"
      ,
        title: "CoffeeScript"
      ,
        title: "Backbone.js"
      ,
        title: "jQuery"
      ]

      @h4 "Backend technologies"

      @grid items: [
        title: "Node.js"
      ,
        title: "RethinkDB"
      ,
        title: "ElasticSearch"
      ,
        title: "SocketIO"
      ,
        title: "Docker"
      ,
        title: "MongoDB"
      ,
        title: "SQL"
      ]

      @h2 "How are we working"

      @p "You can outsource your entire project or it's part to us or hire us to strenghten your existing team."

      @p "We can work remotely or at your office in the Amsterdam area."

    do @typeform

    @footer =>
      @p "Copyright Tadeusz Lazurski & Dorota Cieslinska 2015"
      @p "This website is open-source. You can fork it on GitHub."
