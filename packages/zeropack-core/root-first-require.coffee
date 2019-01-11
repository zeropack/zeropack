path = require 'path'
module.exports = (name) ->
  routes = [
    name,
    path.join(process.cwd(), 'node_modules', name),
    path.resolve(__dirname, '..', name)
  ]
  result = null
  errors = new Set()
  for route in routes
    try
      result = require route
    catch e
      errors.add e.message if e?.message
    return result if result
  console.log 'Unable to load', name
  if errors.log
    console.info Array.from(errors).join("\n")

  process.exit 1
