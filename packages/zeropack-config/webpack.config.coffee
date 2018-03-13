path = require 'path'

module.exports =
  #context
  entry: {}
  output:
    #path
    filename: '[hash].[name].bundle.js'
    chunkFilename: '[hash].[name].[id].chunk.js'
    publicPath: '/'
  module:
    rules: []
  resolve:
    modules: ['node_modules', path.resolve(__dirname, '..', '..', 'node_modules')]
    extensions: []
    alias: {}
  resolveLoader:
    modules: [path.resolve(__dirname, '..', '..', 'node_modules'), 'node_modules']
  plugins: []
