View = require 'teacup-view'

module.exports = new View ->

      @raw """
        <a class="typeform-share link" href="https://dorilori.typeform.com/to/KJMtfy" data-mode="1" target="_blank">Contact us</a>
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
