import path from 'path';
import {generateContext} from 'zeropack-core';

export default (baseConfig, env, defaultConfig) => {
  console.log('baseConfig', baseConfig);
  console.log('defaultConfig', defaultConfig);
  {webpackConfig} = generateContext();
  webpackConfig.mode = 'development';
  webpackConfig.entry = baseConfig.entry;
  webpackConfig.output = baseConfig.output;
  webpackConfig.plugins.push(...baseConfig.plugins);
  console.log('webpackConfig', webpackConfig);
  return webpackConfig;
};
