{exec} = require 'child_process'


fs     = require 'fs'
{exec} = require 'child_process'
util   = require 'util'


task 'test', 'Runs all Jasmine specs in spec/ folder', ->
  test()

#task 'compile', 'Compiles coffee in lib/ to js in bin/', ->
#  compile()
#
#task 'stitch', 'Stitches all app .js files', ->
#  stitch()
#
#task 'compress', 'Runs UglifyJS on stitched file in order to compress it', ->
#  compress()
#
#task 'build', 'Does the full build magic', ->
#  test -> compile -> stitch -> compress()
#
#task 'develop', 'Only compile and stitch, don\'t test or compress', ->
#  compile -> stitch()
#
#
test = (callback) ->
  console.log "Running Jasmine specs"
  exec 'jasmine-node --coffee spec/', (err, stdout, stderr) =>
    console.log stdout + stderr

    # hack to work around jasmine-node's bad return vals:
    throw "Failure :(" if ~stdout.indexOf "Expected"

    callback?()
#
#
#compile = (callback) ->
#  exec 'coffee -o public/assets/js/ -c lib/', (err, stdout, stderr) ->
#    throw err if err
#    console.log "Compiled coffee files"
#    callback?()
#
#
#stitch = (callback) ->
#  stitch = require 'stitch'
#  fs = require 'fs'
#
#  adaptation = stitch.createPackage paths: [__dirname + '/bin', __dirname + '/vendor']
#  adaptation.compile (err, source) ->
#    fs.writeFile 'app.js', source, (err) ->
#      throw err if err
#      console.log "Stitched js files"
#      callback?()
#
#
#compress = (callback) ->
#  exec 'uglifyjs --overwrite app.js', (err, stdout, stderr) ->
#    throw err if err
#    console.log "Compressed app.js"
#    callback?()

#
prodSrcCoffeeDir     = 'lib'
#testSrcCoffeeDir     = 'spec/adaptation'

prodTargetJsDir      = 'public/assets/js'
#testTargetJsDir      = 'test'

prodTargetFileName   = 'core'
prodTargetCoffeeFile = "#{prodSrcCoffeeDir}/#{prodTargetFileName}.coffee"
prodTargetJsFile     = "#{prodTargetJsDir}/#{prodTargetFileName}.js"

prodCoffeeOpts = "--bare --output #{prodTargetJsDir} --compile #{prodTargetCoffeeFile}"
#testCoffeeOpts = "--output #{testTargetJsDir}"

prodCoffeeFiles = [
  'preamble'
  'viewport'
  'game'
  'play'
]

task 'build', 'Build a single JavaScript file from prod files', ->
  util.log "Building #{prodTargetJsFile}"
  appContents = new Array remaining = prodCoffeeFiles.length
  util.log "Appending #{prodCoffeeFiles.length} files to #{prodTargetCoffeeFile}"

  for file, index in prodCoffeeFiles then do (file, index) ->
    fs.readFile "#{prodSrcCoffeeDir}/#{file}.coffee"
        , 'utf8'
        , (err, fileContents) ->
      util.log err if err

      appContents[index] = fileContents
      util.log "[#{index + 1}] #{file}.coffee"
      process() if --remaining is 0

  process = ->
    fs.writeFile prodTargetCoffeeFile
        , appContents.join('\n\n')
        , 'utf8'
        , (err) ->
      util.log err if err

      exec "coffee #{prodCoffeeOpts}", (err, stdout, stderr) ->
          util.log err if err
          message = "Compiled #{prodTargetJsFile}"
          util.log message
          fs.unlink prodTargetCoffeeFile, (err) -> util.log err if err
