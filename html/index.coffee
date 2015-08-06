View = require 'teacup-view'

module.exports = new View ->
  @doctype 5

  @html =>
    @body =>
      @h1 'Hello, Daft Code :)'
