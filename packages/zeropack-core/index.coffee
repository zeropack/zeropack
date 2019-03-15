path = require 'path'
dotenv = require 'dotenv'
rootFirstRequire = require './root-first-require'

process.env.BUILDER_ENV ||= 'development'

dotenv.config
  path: path.resolve(process.cwd(), ".env.#{process.env.BUILDER_ENV}")
  silent: true

context =
  webpackConfig: {}
  builderConfig: {}

applyMiddleware = (middleware) ->
  if typeof middleware is 'function'
    middleware(context)
  else
    rootFirstRequire(middleware)(context)

generateContext = ->
  applyMiddleware 'zeropack-config'

  middlewares = []

  if context.builderConfig.preset
    preset = rootFirstRequire(context.builderConfig.preset)
    middlewares.push preset.middlewares...

  if context.builderConfig.plugins
    middlewares.unshift context.builderConfig.plugins...

  middlewares.push 'zeropack-fix-schema'

  middlewares
    .filter((middleware) ->
      !context.builderConfig.preventPluginList?.includes(middleware)
    )
    .map applyMiddleware

  context

module.exports = {
  generateContext,
  applyMiddleware
}
