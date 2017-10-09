HtmlWebpackPlugin = require 'html-webpack-plugin'

module.exports = ({webpackConfig}) ->
  webpackConfig.plugins.unshift new HtmlWebpackPlugin({template: 'index.html'})

