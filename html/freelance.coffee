View = require 'teacup-view'

module.exports = new View ->

  @div class: 'bottom-container', =>
    @header class: "bottom-header", =>
      @h1 =>
        @raw "We will create your dream web application."
      @h3 "As a team of developers we want to provide the best quality. Fill in contact form and we will contact you with our offer."
      @raw """
        <a class="typeform-share button" href="https://dorilori.typeform.com/to/KJMtfy" data-mode="1" target="_blank">Contact us</a>
        <script>
          (function() {
            var qs, js, q, s, d = document,
              gi = d.getElementById,
              ce = d.createElement,
              gt = d.getElementsByTagName,
              id = 'typef_orm',
              b = 'https://s3-eu-west-1.amazonaws.com/share.typeform.com/';
            if (!gi.call(d, id)) {
              js = ce.call(d, 'script');
              js.id = id;
              js.src = b + 'share.js';
              q = gt.call(d, 'script')[0];
              q.parentNode.insertBefore(js, q)
            }
          })()
        </script>
      """

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
          src   : '/Dorota-Cieslinska-photo.jpg'
          alt   : 'Dorota Cieslinska'
          text  : 'Dorota Cieslinska'
        @h3 'Dorota Cieslinska'
        @p 'Frontend developer'
    # @p "Copyright Tadeusz Lazurski & Dorota Cieslinska 2015"
