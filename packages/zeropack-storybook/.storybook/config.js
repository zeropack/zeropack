import path from 'path';
import {configure} from '@storybook/react';
// import {setOptions} from '@storybook/addon-options';
import {generateContext} from 'zeropack-core';

// addon-options
//setOptions({
//  name: '?',
//  url: '?',
//  sortStoriesByKind: true,
//});

// load stories
configure(() => {
  {webpackConfig} = generateContext();
  console.log('webpackConfig in config.js', webpackConfig);
  const storiesContext = require.context(
    path.resolve(process.cwd(), 'src'),
    true,
    /\.(story|stories)\.(js|coffee)$/,
  );
  storiesContext.keys().forEach(storiesContext);
}, module);
