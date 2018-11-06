import * as storybook from '@storybook/react';
// import {setOptions} from '@storybook/addon-options';

// addon-options
// setOptions({
//   name: 'Analytics UI',
//   url: 'http://git.nextiva.xyz/projects/ANA/repos/analytics-ui/browse',
//   sortStoriesByKind: true,
// });

function loadStories() {
  const storiesContext = require.context('ZeropackContext', true, /\.(story|stories)\.(js|coffee)$/);
  storiesContext.keys().forEach(storiesContext);
}

storybook.configure(loadStories, module);
