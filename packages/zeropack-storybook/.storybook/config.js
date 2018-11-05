import * as storybook from '@storybook/react';
// import {setOptions} from '@storybook/addon-options';
// import { generateContext } from 'zeropack-core';
import path from 'path';

// const { webpackConfig } = generateContext();

// addon-options
//setOptions({
//  name: '?',
//  url: '?',
//  sortStoriesByKind: true,
//});

// load stories
storybook.configure(() => {
  // console.log('!!! context', webpackConfig.context);
  const storiesContext = require.context(
    // '.', // context already set for src in webpack config
    // or need to try webpackConfig.context
    // webpackConfig.context,
    // this is last try path.resolve(process.cwd(), 'src'),
    path.resolve(process.cwd(), 'src'),
    true,
    /\.(story|stories)\.(js|coffee)$/,
  );
  storiesContext.keys().forEach(storiesContext);
}, module);
