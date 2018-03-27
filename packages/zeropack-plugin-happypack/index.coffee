os = require 'os'
HappyPack = require 'happypack'
happyThreadPool = HappyPack.ThreadPool size: os.cpus().length

BLACKLIST = ['file']

module.exports = ({webpackConfig}) ->
  plugins = []
  rules = webpackConfig.module.rules.map (rule) ->
    if rule.id in BLACKLIST
      return rule
    styleLoader = null
    if rule.use?[0]?.loader is 'style-loader'
      styleLoader = rule.use.shift()
    else
      rule.use.unshift 'cache-loader'
    plugins.push new HappyPack
      id: rule.id
      threadPool: happyThreadPool
      loaders: rule.use
      verbose: false
    rule.use = ["happypack/loader?id=#{rule.id}"]
    if styleLoader
      rule.use.unshift styleLoader
    rule

  webpackConfig.module.rules = rules
  webpackConfig.plugins.push plugins...
