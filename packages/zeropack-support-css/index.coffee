{style, css, postCss} = require './defaultStyleLoader'

module.exports = ({webpackConfig}) ->
  rule =
    id: 'css'
    test: /\.css$/,
    use: [style, css, postCss]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.push '.css'
