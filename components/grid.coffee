View        = require 'teacup-view'

grid_item = View ({ src, title }) ->
  @li class: "grid-item", =>
    @img { src }
    @p title

module.exports = View ({ items }) ->
  @ul class: 'grid', =>
    grid_item item for item in items
