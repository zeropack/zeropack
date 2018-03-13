STATIC_FILES_REG_EX = /\.(ttf|eot|svg|png|jpg|jpeg|gif|woff(2)?)(\?[a-z0-9=&.]+)?$/

file =
  loader: 'file-loader'

module.exports = ({webpackConfig}) ->
  rule =
    id: 'file'
    test: STATIC_FILES_REG_EX
    use: [file]
  webpackConfig.module.rules.push rule
