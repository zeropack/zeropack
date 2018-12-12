import * as storybook from '@storybook/react'

console.log('GIT_META', GIT_META);

try
  applyConfig = require('<rootDir>/.storybook/config').default
catch
  applyConfig = require('./defaultConfig').default

applyConfig(storybook)  
