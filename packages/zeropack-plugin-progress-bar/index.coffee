ProgressPlugin = require 'webpack/lib/ProgressPlugin'

module.exports = ({webpackConfig}) ->
  webpackConfig.plugins.unshift new ProgressPlugin (progress, status, modulesCount, activeCount, path) ->
    if process?.stdout?.isTTY
      process.stdout.clearLine()
      process.stdout.cursorTo 0
      process.stdout.write "Build progress: #{Math.round(progress*100)}% #{status} #{modulesCount||''} #{activeCount||''}"
    else
      null
