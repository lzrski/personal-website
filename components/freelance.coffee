View     = require 'teacup-view'

module.exports = new View (attributes) ->
  @section attributes, => @div class: "container", =>

    @markdown """
      # Badanie pozytywnego kapitału psychologicznego

    """

    @div class: 'team', =>

    @article =>
      @markdown """

        Absolwentka studiów magisterskich na Wydziale Psychologii Uniwersytetu Warszawskiego ze specjalizacją trenerską **Wspieranie rozwoju osobowości** oraz studiów podyplomowych **Coaching Profesjonalny** – metody i praktyka (Akademia Leona Koźmińskiego). Uczestnik **Interdyscyplinarnych Studiów Doktoranckich** (Uniwersytet SWPS). Zrealizowała liczne kursy doskonalące umiejętności w zakresie prowadzenia coachingu, szkoleń oraz rozwoju kompetencji osobistych, społecznych i zawodowych. Jako **trener i coach** specjalizuje się w tworzeniu szkoleń oraz programów rozwojowych opartych o **psychologię pozytywną** i wyniki badań naukowych (**evidence based approach**).

        **Wykładowca** na Uniwersytecie SWPS, gdzie prowadzi wykłady, seminaria oraz warsztaty na studiach stacjonarnych i podyplomowych. Członek Zespołu Naukowo-Badawczego Centrum Coachingu i Mentoringu Akademii Leona Koźmińskiego. Koordynator merytoryczny seminariów naukowych dedykowanych praktykom zajmującym się rozwojem pt. „**Jak korzystać z psychologii pozytywnej w coachingu**”. Członek Polskiego Towarzystwa Psychologii Pozytywnej. Członek **European Mentoring & Coaching Council** (EMCC). **Prelegent i ekspert** na wielu polskich oraz międzynarodowych konferencjach naukowych. Autorka artykułów naukowych z dziedziny psychologii pozytywnej i zarządzania.

        Obecnie realizuje pracę doktorską, w której zajmuje się badaniem pozytywnego kapitału psychologicznego (PsyCapu) pracowników organizacji oraz jego związkiem z **efektywnością realizacji celów zawodowych** i **odczuwanym dobrostanem**.
      """
