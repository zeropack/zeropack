
style =
  loader: 'style-loader'

css =
  loader: 'css-loader'
  options:
    minimize: true

resolveUrl =
  loader: 'resolve-url-loader'

postCss =
  loader: 'postcss-loader'
  options:
    plugins: [
      require('autoprefixer')()
    ]


module.exports = ({webpackConfig}) ->
  rule =
    id: 'css'
    test: /\.css$/,
    use: [style, css, resolveUrl, postCss]
    
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.push '.css'
