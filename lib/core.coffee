exports.player = require './player.coffee'

# a mock for an audio context until you set one.
core = {}
core.context =
  destination: null, 
  createOscillator: -> 
    connect: ->
    noteOn: ->
    disconnect: ->
    frequency: 
      value: null

exports.init = (context)->
  if (context)
    core.context = context
  exports.player.init()

exports.run = (input)->
  exports.player.run(input.points, core.context)

if (typeof(window) != 'undefined')
  # globally export our functions
  window.run = exports.run
  con = AudioContext || webkitAudioContext
  exports.init(new con())
