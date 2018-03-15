Webpack = require 'webpack'
CleanWebpackPlugin = require 'clean-webpack-plugin'

module.exports = ({webpackConfig}) ->
  plugins = [
    new Webpack.optimize.UglifyJsPlugin()
    new Webpack.DefinePlugin {
      'process.env.NODE_ENV': '"production"'
      'process.env.BROWSER': true
    }
    new CleanWebpackPlugin [webpackConfig.output.path], allowExternal: true, verbose: false
  ]
  webpackConfig.mode = 'production'
  webpackConfig.plugins.unshift plugins...
  compiler = Webpack webpackConfig
  compiler.run (err, stats) ->
    console.log stats.toString
      chunks: false
      colors: true
      children: false
    #fs = require('fs');
    #data = stats.toJson()
    #fs.writeFile 'stats.json', JSON.stringify(data,2,2)
