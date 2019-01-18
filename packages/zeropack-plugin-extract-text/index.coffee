ExtractTextPlugin = require 'extract-text-webpack-plugin'

EXTRACT_IDS = ['css', 'sass', 'stylus']

module.exports = ({webpackConfig}) ->
  webpackConfig.module.rules = webpackConfig.module.rules.map (rule) ->
    if rule.id in EXTRACT_IDS
      rule.use.shift()
      rule.use = ExtractTextPlugin.extract(rule.use)
    rule
  webpackConfig.plugins.push new ExtractTextPlugin '[hash].[name].bundle.css',
    allChunks: true
