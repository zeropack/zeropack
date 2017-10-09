module.exports = ({webpackConfig}) ->
  webpackConfig.module.rules = webpackConfig.module.rules.map (rule) ->
    delete rule.id
    rule
