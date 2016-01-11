View     = require 'teacup-view'

module.exports = new View (attributes) ->
  @section attributes, => @div class: "container", =>

    @markdown """
      # We are a **full stack** team of **two web programmers** available to be hired for your project.

    """

    @div class: 'team', =>
      @a
        href  : "#landing"
        class : "teammate tadeusz"
        =>
          @img
            src   : '/tadeusz-lazurski-circle-transparent.png'
            alt   : 'Tadeusz Łazurski face - less than a half of it'
          @h3 'Tadeusz Lazurski'
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
      @markdown """
        ## Area of expertise

        We can help you choose **right feature set** and **technology stack** for your product. We have experience in **project management** and **product development** in various types of organisations. You can **outsource your entire project** or it's part to us or hire us to **strenghten your existing team**. We can work remotely or at your office in the Amsterdam area.

        ## Some of the technologies we use
      """

      @grid items: [
        src:   "/logos/logo-js.svg"
        title: "JavaScript"
      ,
        src:   "/logos/logo-html5.svg"
        title: "HTML"
      ,
        src:   "/logos/logo-css3.svg"
        title: "CSS"
      ,
        src:   "/logos/logo-reactjs.svg"
        title: "React.js"
      ,
        src:   "/logos/logo-coffee.svg"
        title: "CoffeeScript"
      ,
        src:   "/logos/logo-backbone.svg"
        title: "Backbone.js"
      ,
        src:   "/logos/logo-jquery.svg"
        title: "jQuery"
      ,
        src:   "/logos/logo-node.svg"
        title: "Node.js"
      ,
        src:   "/logos/logo-rethinkdb.svg"
        title: "RethinkDB"
      ,
        src:   "/logos/logo-elasticsearch.svg"
        title: "ElasticSearch"
      ,
        src:   "/logos/logo-socketio.svg"
        title: "Socket.IO"
      ,
        src:   "/logos/logo-docker.svg"
        title: "Docker"
      ,
        src:   "/logos/logo-mongodb.svg"
        title: "MongoDB"
      ,
        src:   "/logos/logo-mysql.svg"
        title: "SQL"
      ]

    @contact    id: 'contact'
