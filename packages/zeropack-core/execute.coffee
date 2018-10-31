{generateContext, applyMiddleware} = require './index.coffee'

context = generateContext()

actionName = process.argv[2]

action = context.builderConfig.actions[actionName]

if action.plugins
  action.plugins.map applyMiddleware

applyMiddleware action.action
