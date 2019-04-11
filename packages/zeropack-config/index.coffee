path = require 'path'
defaultsDeep = require 'lodash.defaultsdeep'

module.exports = (context) ->

  defaultBuilderConfig =
    context: path.join(process.cwd(), 'src')
    outputPath: path.join(process.cwd(), 'dist')
    alias: {}
    name: 'app'
    entry: './index'
    devServer:
      host: 'localhost'
      port: 8080
    actions:
      serve:
        action: 'zeropack-action-serve'
      build:
        action: 'zeropack-action-build'
      watch:
        action: 'zeropack-action-watch'

  userBuilderConfig = {}

  try
    userBuilderConfig = require path.join(process.cwd(), 'zeropack.config')
  catch e
    console.log e.message || e.code

  builderConfig = defaultsDeep {}, userBuilderConfig, defaultBuilderConfig
  webpackConfig = require './webpack.config'

  defaultsDeep webpackConfig,
    context: builderConfig.context
    entry: "#{builderConfig.name}": [builderConfig.entry]
    output:
      path: builderConfig.outputPath
      publicPath: builderConfig.publicPath
    resolve:
      alias: builderConfig.alias

  defaultsDeep context, {webpackConfig, builderConfig}
