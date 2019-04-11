Webpack = require 'webpack'
CleanWebpackPlugin = require 'clean-webpack-plugin'

module.exports = ({webpackConfig}) ->
  webpackConfig.mode = 'development'
  webpackConfig.devtool = 'eval'
  webpackConfig.plugins.unshift new Webpack.DefinePlugin {
    'process.env.NODE_ENV': '"development"'
    'process.env.BROWSER': true
    '__DEV__': true
  }
  webpackConfig.plugins.push new CleanWebpackPlugin [webpackConfig.output.path], allowExternal: true, verbose: false
  compiler = Webpack webpackConfig
  compiler.watch {}, (err, stats) ->
    console.log stats.toString
      chunks: false
      colors: true
      children: false
