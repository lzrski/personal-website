View        = require 'teacup-view'
MD          = require 'markdown-it'

md = MD breaks: yes, typographer: yes

module.exports = View (content) -> @raw md.render content 
