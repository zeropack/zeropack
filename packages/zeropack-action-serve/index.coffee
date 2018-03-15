Webpack = require 'webpack'
WebpackDevServer = require 'webpack-dev-server'

module.exports = ({webpackConfig, builderConfig}) ->
  {host, port} = builderConfig.devServer
  webpackConfig.mode = 'development'
  webpackConfig.devtool = 'eval'
  webpackConfig.entry[builderConfig.name].unshift "webpack-dev-server/client?http://#{host}:#{port}/"
  webpackConfig.plugins.unshift new Webpack.DefinePlugin {
    'process.env.NODE_ENV': '"development"'
    'process.env.BROWSER': true
    '__DEV__': true
  }
  compiler = Webpack webpackConfig
  server = new WebpackDevServer compiler,
    historyApiFallback: true
    contentBase: webpackConfig.context
    overlay: true
    stats:
      chunks: false
      colors: true
      children: false
  server.listen port
