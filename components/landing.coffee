View     = require 'teacup-view'

module.exports = new View (attributes) ->
  @section attributes, => @div class: "container", =>
    @header =>
      @h1 =>
        @raw "<strong>Zawadzka, Agnieszka</strong>: psycholog, trener, coach, dydaktyk, pozytywna osoba."

      @img
        class : 'main-image'
        src   : '/agnieszka-zawadzka-circle-transparent.png'
        alt   : 'Agnieszka Zawadzka'

    @tag 'main', =>

      @markdown """
        Za niewielką opłatą może wprowadzić **wartościową zmianę** w towim życiu - nie tylko zawodowym.
      """

    @footer =>
      @ul id: 'menu', =>
        @li class: 'caption', => @span "Poznajmy się"
        (@li => @a { href },  => @span label) for label, href of {
          'ICF'           : 'https://icf.org.pl/project-details/agnieszka-zawadzka/'
          'LinkedIn'      : 'https://www.linkedin.com/in/agnieszka-zawadzka-255a9ab8/'
          'E-Mail'        : 'mailto:azawadzka.pl@gmail.com'
        }
