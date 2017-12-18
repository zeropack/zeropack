{babel} = require 'zeropack-support-babel/defaultBabelLoader'

ts =
  loader: 'ts-loader'
  options:
    silent: true
    happyPackMode: true

tryUseConfig = ({webpackConfig, builderConfig, tsOptions}) ->
  pluginOption = builderConfig['zeropack-support-typescript'] || {}
  loaderOptions = pluginOption.options || {}
  # merge loader options
  Object.assign tsOptions.options, loaderOptions

  if forkTsCheckerOptions = pluginOption.forkTsChecker
    ForkTsCheckerWebpackPlugin = require 'fork-ts-checker-webpack-plugin'
    webpackConfig.plugins.unshift new ForkTsCheckerWebpackPlugin(forkTsCheckerOptions)

module.exports = ({webpackConfig, builderConfig}) ->
  tryUseConfig {webpackConfig, builderConfig, tsOptions: ts}

  rule =
    id: 'typescript'
    test: /\.(ts|tsx)$/
    use: [babel, ts]
  webpackConfig.module.rules.push rule
  webpackConfig.resolve.extensions.unshift '.ts', '.tsx'
