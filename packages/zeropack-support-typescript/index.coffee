{babel} = require 'zeropack-support-babel/defaultBabelLoader'

ts =
  loader: 'ts-loader'
  options:
    silent: true
    happyPackMode: true

module.exports = ({webpackConfig}) ->
  rule =
    id: 'typescript'
    test: /\.(ts|tsx)$/
    use: [babel, ts]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.unshift '.ts', '.tsx'
