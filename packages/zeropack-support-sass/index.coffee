{style, css, postCss} = require 'zeropack-support-css/defaultStyleLoader'

sass =
  loader: 'sass-loader'

module.exports = ({webpackConfig}) ->
  rule =
    id: 'sass'
    test: /\.scss$/,
    use: [style, css, postCss, sass]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.push '.scss'
