{babel} = require './defaultBabelLoader'

module.exports = ({webpackConfig}) ->
  rule =
    id: 'babel'
    test: /\.(js|jsx)$/
    use: [babel]
    exclude: /(node_modules|bower_components)/
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.unshift '.js', 'jsx'
