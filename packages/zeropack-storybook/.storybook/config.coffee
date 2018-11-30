import * as storybook from '@storybook/react'
import { withOptions } from '@storybook/addon-options'
import { withInfo } from '@storybook/addon-info'

import startCase from 'lodash/startCase'

import packageJson from '<rootDir>/package.json'

console.log('GIT_META', GIT_META);

# addon-options
storybook.addDecorator(
  withOptions({
    name: "#{startCase(packageJson.name)} - #{packageJson.version}"
    url: packageJson.homepage
    sortStoriesByKind: false
    hierarchyRootSeparator: /\|/
    hierarchySeparator: /\//
  })
)
storybook.addDecorator withInfo({header: false})

# load stories
try
  loadStories = require('<rootDir>/.storybook/loadStories').default
catch
  loadStories = () =>
    storiesContext = require.context 'ZeropackContext', true, /\.(story|stories)\.(js|coffee)$/
    storiesContext.keys().forEach storiesContext

storybook.configure loadStories, module
