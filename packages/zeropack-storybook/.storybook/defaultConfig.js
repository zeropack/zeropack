
import { configure, addParameters, addDecorator } from '@storybook/react';
import { withInfo } from '@storybook/addon-info';
import packageJson from '<rootDir>/package.json';

import startCase from 'lodash/startCase';

export default () => {
  addDecorator(
    withInfo({
      header: false,
    })
  );
  addParameters({
    // addon-options
    options: {
      theme: {
        brandTitle: `${startCase(packageJson.name)} - ${packageJson.version}`,
        brandUrl: packageJson.homepage,
      },
      sortStoriesByKind: false,
      hierarchyRootSeparator: '|',
      hierarchySeparator: /\/|\./,
    },
  });

  // const currentLocationHref = window.location.href;
  const storiesContext = require.context('ZeropackContext', true, /\.(story|stories)\.(js|coffee)$/);

  const loadStories = () => {
    storiesContext.keys().forEach(storiesContext);
  }

  configure(loadStories, module);

  if (module.hot) {
    module.hot.accept(storiesContext.id, () => {
      // Styles is not reloaded
      configure(loadStories, module);
    });
  }
}
