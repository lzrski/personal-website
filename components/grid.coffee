View        = require 'teacup-view'

grid_item = View ({title}) ->
  @li class: "grid-item", =>
    @img src: 'https://www.fillmurray.com/200/200'
    @p title

module.exports = View ({ items }) ->
  @ul class: 'grid', =>
    grid_item item for item in items
