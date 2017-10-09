
style =
  loader: 'style-loader'

css =
  loader: 'css-loader'
  options:
    minimize: true

sass =
  loader: 'sass-loader'

module.exports = ({webpackConfig}) ->
  rule =
    id: 'sass'
    test: /\.scss$/,
    use: [style, css, sass]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.push '.scss'
