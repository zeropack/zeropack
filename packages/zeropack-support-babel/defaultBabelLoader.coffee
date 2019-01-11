
babelPlugin = (plugin) ->
  require.resolve "babel-plugin-#{plugin}"

babelPreset = (preset) ->
  require.resolve "babel-preset-#{preset}"

babel =
  loader: 'babel-loader'
  options:
    presets: [
      babelPreset('env'),
      babelPreset('react')
    ]
    plugins: [
      babelPlugin('transform-modules-commonjs'),
      babelPlugin('proposal-object-rest-spread'),
      babelPlugin('transform-runtime')
    ]

module.exports = {babel}
