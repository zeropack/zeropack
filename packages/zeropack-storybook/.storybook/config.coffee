import * as storybook from '@storybook/react'
import { withOptions } from '@storybook/addon-options'
import startCase from 'lodash/startCase'

import packageJson from 'PackageJson'

# addon-options
storybook.addDecorator(
  withOptions({
    name: "#{startCase(packageJson.name)} - #{packageJson.version}"
    url: packageJson.homepage
    sortStoriesByKind: true
    hierarchyRootSeparator: /\|/
    hierarchySeparator: /\//
  })
)

# load stories
storybook.configure () =>
  storiesContext = require.context('ZeropackContext', true, /\.(story|stories)\.(js|coffee)$/)
  storiesContext.keys().forEach(storiesContext)
, module
