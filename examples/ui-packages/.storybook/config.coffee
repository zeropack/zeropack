import packageJson from '../package.json'
import { withOptions } from '@storybook/addon-options'
import { withInfo } from '@storybook/addon-info'

loadStories = ->
  require './global.scss'

  storiesContext = require.context '../packages', true, /\.(story|stories)\.(js|coffee)$/
  storiesContext.keys().forEach storiesContext

export default (storybook) ->
  storybook.addDecorator(
    withOptions({
      name: 'test UI packages'
      url: packageJson.homepage
      sortStoriesByKind: false
      hierarchyRootSeparator: /\|/
      hierarchySeparator: /\//
    })
  )
  storybook.addDecorator withInfo({header: false})

  storybook.configure loadStories, module
