Webpack = require 'webpack'
path = require 'path'

module.exports = (context) ->
  ENV = {}
  try
    appData = require path.resolve(process.cwd(), ".app.data.#{process.env.BUILDER_ENV}")
    for k, v of appData
      ENV[k] = JSON.stringify(v)
  catch e
    console.error e.message
  context.webpackConfig.plugins.push new Webpack.DefinePlugin {ENV}
