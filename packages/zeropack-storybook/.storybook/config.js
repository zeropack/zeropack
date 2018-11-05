import 'coffeescript/register';
import * as storybook from '@storybook/react';
// import {setOptions} from '@storybook/addon-options';
import { generateContext } from 'zeropack-core'; // requires coffeescript
import path from 'path';

console.log('!!!!!!!!!!!! CONFIG !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

// addon-options
//setOptions({
//  name: '?',
//  url: '?',
//  sortStoriesByKind: true,
//});

// load stories
storybook.configure(() => {
  const { webpackConfig } = generateContext();
  console.log('webpackConfig in config.js', webpackConfig);
  const storiesContext = require.context(
    '.', // context already set for src in webpack config
    // or need to try webpackConfig.context
    // this is last try path.resolve(process.cwd(), 'src'),
    true,
    /\.(story|stories)\.(js|coffee)$/,
  );
  storiesContext.keys().forEach(storiesContext);
}, module);
