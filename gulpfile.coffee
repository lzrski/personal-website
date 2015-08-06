gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
mocha       = require 'gulp-mocha'
sourcemaps  = require 'gulp-sourcemaps'
del         = require 'del'
webserver   = require 'gulp-webserver'
stylus      = require 'gulp-stylus'
through     = require 'through2'


gulp.task 'clean', (done) ->
  del 'build/**/*', done

# Use default options for teacup function
gulp.task 'html', do require './gulpfile.d/teacup'

# TODO: Move coffee to gulpfile.d
gulp.task 'coffee', ->
  development = process.env.NODE_ENV is 'development'

  gulp
    .src 'scripts/**/*.coffee'
    .pipe sourcemaps.init()
    .pipe coffee()
    # Only write source maps if env is development.
    # Otherwise just pass through.
    .pipe if development then sourcemaps.write '.' else through.obj()
    .pipe gulp.dest 'build/'

# TODO: Move test to gulpfile.d
gulp.task 'test', ->
  development = process.env.NODE_ENV is 'development'

  gulp
    .src 'test/*.coffee', read: no
    .pipe mocha
      reporter  : 'spec'
      compilers : 'coffee:coffee-script'
    .once 'error', (error) ->
      console.error 'Tests failed', error
      if development
        return @emit 'end'
      else
        process.exit 1

gulp.task 'assets', ->
  gulp
    .src 'assets/**/*'
    .pipe gulp.dest 'build'

gulp.task 'styl', ->
  gulp
    .src './styles/main.styl'
    .pipe stylus()
    .pipe gulp.dest './build'

gulp.task 'build', gulp.series [
  'clean'
  gulp.parallel [
    'assets'
    'html'
    'styl'
    'coffee'
  ]
  'test'
]

gulp.task 'serve', ->
  gulp
    .src 'build'
    .pipe webserver livereload: yes

gulp.task 'watch', (done) ->
  gulp.watch [
    'test/**/*'
    'package.json'
  ], gulp.series [
    'test'
  ]

  # TODO: More granular watch
  gulp.watch [
    'assets/**/*'
    'scripts/**/*',
    'html/**/*'
    'styles/**/*'
    'package.json'
  ], gulp.series [
    'build'
  ]


gulp.task 'develop', gulp.series [
  (done) ->
    process.env.NODE_ENV ?= 'development'
    do done
  'build'
  'serve'
  'watch'
]
