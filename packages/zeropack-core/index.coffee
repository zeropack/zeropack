path = require 'path'
rootFirstRequire = require './root-first-require'

process.env.BUILDER_ENV ||= 'development'

require('dotenv').config
  path: path.resolve(process.cwd(), ".env.#{process.env.BUILDER_ENV}")
  silent: true

context =
  webpackConfig: {}
  builderConfig: {}

applyMiddleware = (name) ->
  rootFirstRequire(name)(context)

applyMiddleware 'zeropack-config'

middlewares = []

if context.builderConfig.preset
  preset = rootFirstRequire(context.builderConfig.preset)
  middlewares.push preset.middlewares...

if context.builderConfig.plugins
  middlewares.unshift context.builderConfig.plugins...

actionName = process.argv[2]

action = context.builderConfig.actions[actionName]

if action.plugins
  middlewares.unshift action.plugins...

middlewares.push 'zeropack-fix-schema'
middlewares.push action.action

middlewares.map applyMiddleware
