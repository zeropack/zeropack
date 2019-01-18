{style, css, postCss} = require 'zeropack-support-css/defaultStyleLoader'

stylus =
  loader: 'stylus-loader'

module.exports = ({webpackConfig}) ->
  rule =
    id: 'stylus'
    test: /\.styl$/,
    use: [style, css, postCss, stylus]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.push '.styl'
