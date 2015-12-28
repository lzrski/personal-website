through     = require 'through2'

module.exports = -> through.obj (file, enc, done) ->
  file.stat.mtime = new Date
  done null, file
