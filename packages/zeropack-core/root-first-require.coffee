path = require 'path'
module.exports = (name) ->
  routes = [
    name,
    path.join(process.cwd(), 'node_modules', name),
    path.resolve(__dirname, '..', name)
  ]
  result = null
  for route in routes
    try
      result = require route
    return result if result
  console.log 'Unable to load', name
  process.exit 1
