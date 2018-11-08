export default () =>
  require './global.scss'

  storiesContext = require.context '../packages', true, /\.(story|stories)\.(js|coffee)$/
  storiesContext.keys().forEach storiesContext
