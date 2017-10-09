path = require 'path'
process.env.BUILDER_ENV ||= 'development'
require('dotenv').config
  path: path.resolve(process.cwd(), ".env.#{process.env.BUILDER_ENV}")
  silent: true

context =
  webpackConfig: {}
  builderConfig: {}

applyMiddleware = (name) ->
  require("../#{name}")(context)

middlewares = [
  'builder-config'
  'support-babel'
  'support-coffeescript'
  'support-typescript'
  'support-css'
  'support-sass'
  'support-file'
  'plugin-index-html'
  'plugin-app-data'
  'plugin-git-rev'
  'plugin-progress-bar'
  'plugin-happypack'
  'plugin-extract-text'
  'fix-schema'
  'action-build'
]

middlewares.map applyMiddleware
