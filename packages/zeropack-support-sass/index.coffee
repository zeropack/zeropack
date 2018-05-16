
style =
  loader: 'style-loader'

css =
  loader: 'css-loader'
  options:
    minimize: true

resolveUrl =
  loader: 'resolve-url-loader'

sass =
  loader: 'sass-loader'

postCss =
  loader: 'postcss-loader'
  options:
    plugins: [
      require('autoprefixer')()
    ]

module.exports = ({webpackConfig}) ->
  rule =
    id: 'sass'
    test: /\.scss$/,
    use: [style, css, resolveUrl, postCss, sass]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.push '.scss'
