View     = require 'teacup-view'

module.exports = new View ->
  @h1 "Form"
  # @section =>
  #   @div class: "container", =>
  #     @form =>
  #       @input type: "email", name: "email"
  #       @input type: "text", name: "company"
  #       @input type: "text", name: "description"
  #       @input type: "submit", value: "Save"
