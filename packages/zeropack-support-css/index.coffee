
style =
  loader: 'style-loader'

css =
  loader: 'css-loader'
  options:
    minimize: true

module.exports = ({webpackConfig}) ->
  rule =
    id: 'css'
    test: /\.css$/,
    use: [style, css]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.push '.css'
