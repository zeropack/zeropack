Webpack = require 'webpack'
gitRev = require 'git-rev-sync'

module.exports = (context) ->
  GIT_META = {}
  try
    ['short', 'long', 'branch', 'tag'].map (field) ->
      GIT_META[field.toUpperCase()] = JSON.stringify(gitRev[field](process.cwd()))
  catch e
    console.error e.message
  context.webpackConfig.plugins.push new Webpack.DefinePlugin {GIT_META}
