HtmlWebpackPlugin = require 'html-webpack-plugin'

defaultParams =
  template: 'index.html'

module.exports = ({webpackConfig, builderConfig}) ->
  params = builderConfig.HtmlWebpackPlugin || defaultParams
  webpackConfig.plugins.unshift new HtmlWebpackPlugin(params)

