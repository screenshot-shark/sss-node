querystring = require 'querystring'
crypto = require 'crypto'
_      = require 'underscore'

module.exports = (apiKey, secret) ->
  (options) ->
    options = _.extend
      key: apiKey
      gravity: 'north'
      viewport: '1024x768'
      full: false
      url: 'http://www.google.com/'
      op: 'r:200:120'
    , options
    options.token = crypto
      .createHash('sha1', secret)
      .update("#{options.key}:#{options.url}:#{options.op}")
      .digest('hex')
    query = querystring.stringify options
    "http://screenshotshark.com/capture?#{query}"
