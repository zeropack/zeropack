
import { withOptions } from '@storybook/addon-options';
import { withInfo } from '@storybook/addon-info';
import packageJson from '<rootDir>/package.json';

import startCase from 'lodash/startCase';

export default (storybook) => {
  storybook.addDecorator(
    withOptions({
      name: `${startCase(packageJson.name)} - ${packageJson.version}`,
      url: packageJson.homepage,
      sortStoriesByKind: false,
      hierarchyRootSeparator: /\|/,
      hierarchySeparator: /\//,
    })
  )
  storybook.addDecorator(withInfo({header: false}));
  const loadStories = () => {
    const storiesContext = require.context('ZeropackContext', true, /\.(story|stories)\.(js|coffee)$/);
    storiesContext.keys().forEach(storiesContext);
  } 
  storybook.configure(loadStories, module);
}
  