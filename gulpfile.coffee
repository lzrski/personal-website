gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
mocha       = require 'gulp-mocha'
sourcemaps  = require 'gulp-sourcemaps'
del         = require 'del'
webserver   = require 'gulp-webserver'
stylus      = require 'gulp-stylus'
autoprefixer= require 'gulp-autoprefixer'
through     = require 'through2'
browserify  = require 'browserify'
watchify    = require 'watchify'
coffeeify   = require 'coffeeify'
uglify      = require 'gulp-uglify'
buffer      = require 'vinyl-buffer'
source      = require 'vinyl-source-stream'
exorcist    = require 'exorcist'
_           = require 'lodash'

# Use common tasks
tasks         = require './gulpfile.d'

tasks
  clean   :
    source      : 'build'

  teacup  :
    source      : 'html/**/*'
    components  : 'components/*'
    destination : 'build'

# Fast browserify builds using watchify
b = watchify browserify _.merge {}, watchify.args,
  entries   : './scripts/index.coffee'
  debug     : true
  transform : coffeeify
  extensions: ['.coffee']

b.on 'log', console.log

gulp.task 'scripts', ->
  { NODE_ENV } = process.env

  b
    .bundle()
    .on 'error', (error) ->
      console.trace error
    .pipe exorcist './build/bundle.js.map'
    .pipe source 'bundle.js'
    .pipe buffer()
    .pipe if NODE_ENV is 'development' then through.obj() else uglify()
    .pipe gulp.dest './build/'


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
    .src './styles/index.styl'
    .pipe sourcemaps.init loadMaps: no
    .pipe stylus()
  	.pipe autoprefixer
    	browsers : [ '> 5%', 'last 5 versions' ]
    	cascade  : false
    .pipe sourcemaps.write '.'
    .pipe gulp.dest './build'

gulp.task 'build', gulp.series [
  'clean'
  gulp.parallel [
    'assets'
    'teacup'
    'styl'
    'scripts'
  ]
  'test'
]

gulp.task 'serve', ->
  gulp
    .src 'build'
    .pipe webserver
      host      : '0.0.0.0'
      open      : 'http://localhost:8000/'
      livereload: yes

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
    'components/**/*'
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
