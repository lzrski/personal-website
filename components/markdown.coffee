View        = require 'teacup-view'
MD          = require 'markdown-it'

md = MD breaks: yes, typographer: no

module.exports = View (content) -> @raw md.render content
