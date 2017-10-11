{babel} = require 'zeropack-support-babel/defaultBabelLoader'

coffee =
  loader: 'coffee-loader'

module.exports = ({webpackConfig}) ->
  rule =
    id: 'coffeescript'
    test: /\.(coffee|cjsx)$/
    use: [babel, coffee]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.unshift '.cjsx', '.coffee'
