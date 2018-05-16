
style =
  loader: 'style-loader'

css =
  loader: 'css-loader'
  options:
    minimize: true

postCss =
  loader: 'postcss-loader'
  options:
    plugins: [
      require('autoprefixer')()
    ]

sass =
  loader: 'sass-loader'


module.exports = ({webpackConfig}) ->
  rule =
    id: 'sass'
    test: /\.scss$/,
    use: [style, css, postCss, sass]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.push '.scss'
