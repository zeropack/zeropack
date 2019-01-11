path = require 'path'

module.exports =
  preset: 'zeropack-preset-coffee'
  context: path.join(__dirname, 'src')
  outputPath: path.join(__dirname, 'dist')
