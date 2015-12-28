# Eats teacup-views and spits html

gulp          = require 'gulp'
through       = require 'through2'
rename        = require "gulp-rename"
prettify      = require 'gulp-prettify'
View          = require 'teacup-view'
{ basename }  = require 'path'
{ camelize }  = require 'underscore.string'

{
  src
  dest
  parallel
  series
  task
  watch
} = gulp

defaults =
  sources     : 'html/**/*'
  components  : null
  destination : 'build'

module.exports = (options = {}) ->
  options[key]  ?= value for key, value of defaults

  load_components = ->
    { components } = options
    return if not components

    gulp
      .src components, read: no
      .pipe through.obj (file, enc, done) ->
        # each file should be a module containing Teacup View instance
        # i.e. a function, that when called returns HTML string

        # Clear cache, otherwise watch will always produce same output
        require.cache[file.path] = null
        component = {}
        name      = camelize (basename file.path, '.coffee')
        value     = require file.path
        component[name] = value

        View.load_components component

        do done

  render = ->
    { NODE_ENV } = process.env

    gulp
      .src options.sources, read: no
      .pipe through.obj (file, enc, done) ->
        # each file should be a module containing Teacup View instance
        # i.e. a function, that when called returns HTML string

        # Clear cache, otherwise watch will always produce same output
        require.cache[file.path] = null
        view = require file.path

        html = do view
        file.contents = new Buffer html

        @push file

        do done

      .pipe rename extname: '.html'
      .pipe if NODE_ENV is 'development' then prettify indent_size: 2 else through.obj()
      .pipe dest options.destination

  task 'teacup', series [
    load_components
    render
  ]
