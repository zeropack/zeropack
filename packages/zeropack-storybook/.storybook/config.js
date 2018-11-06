import * as storybook from '@storybook/react';
// import {setOptions} from '@storybook/addon-options';

// addon-options
//setOptions({
//  name: '?',
//  url: '?',
//  sortStoriesByKind: true,
//});

function loadStories() {
  const storiesContext = require.context('ZeropackContext', true, /\.(story|stories)\.(js|coffee)$/);
  storiesContext.keys().forEach(storiesContext);
}

storybook.configure(loadStories, module);
