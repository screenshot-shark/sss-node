crypto = require 'crypto'
_      = require 'underscore'

exports.validate = (options, hmac) ->
  cmp = crypto
    .createHash('sha1', secret)
    .update("#{options.time}:#{options.url}:#{options.op}")
    .digest('hex')
  cmp == hmac

exports.screenshot = (options) ->
  options = _.extend options,
    time: Math.round new Date().getTime() / 1000
    gravity: 'north'
    viewport: '1024x768'
    full: false
    url: 'http://www.google.com/'
    op: 'r:200:120'
  options.token = crypto
    .createHash('sha1', secret)
    .update("#{options.time}:#{options.url}:#{options.op}")
    .digest('hex')
  query = querystring.stringify options
  "http://localhost:8080/capture?#{query}"
