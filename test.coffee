assert = require 'assert'
sss = require('./index')('invalid', 'creds')

describe 'sss', ->
  it 'should generate a url', ->
    expect = 'http://www.screenshotshark.com/capture?time=1368143438&gravity=north&viewport=1024x768&full=false&url=http%3A%2F%2Fwww.google.com%2F&op=r%3A200%3A120&token=07023cc625cc654181d2b573378026e068abf837'
    assert.equal sss(time: 1368143438), expect