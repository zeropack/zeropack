path = require 'path'

STATIC_FILES_REG_EX = /\.(ttf|eot|svg|png|jpg|jpeg|gif|woff(2)?)(\?[a-z0-9=&.]+)?$/

module.exports =
  preset: 'zeropack-preset-coffee'
  ignoreMiddlewares: ['zeropack-support-file']
  plugins: [
    ({webpackConfig}) ->
      rule =
        id: 'file'
        test: STATIC_FILES_REG_EX
        use: [{
                loader: 'file-loader'
                options:
                  name: '[name].[ext]'
              }]
      webpackConfig.module.rules.push rule
  ]
  context: path.join(__dirname, 'src')
  outputPath: path.join(__dirname, 'dist')
