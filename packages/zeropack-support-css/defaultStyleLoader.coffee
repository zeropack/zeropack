style =
  loader: 'style-loader'

css =
  loader: 'css-loader'
  options:
    minimize: true

postCss =
  loader: 'postcss-loader'
  options:
    config:
      path: require('path').join(__dirname, 'postcss.config.js')

module.exports = {style, css, postCss}
