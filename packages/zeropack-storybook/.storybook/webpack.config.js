require('coffeescript/register');
const path = require('path');
const { generateContext } = require('zeropack-core'); // requires coffeescript

module.exports = (baseConfig, env) => {
  let { webpackConfig } = generateContext();
  webpackConfig.entry = baseConfig.entry;
  webpackConfig.output = baseConfig.output;
  webpackConfig.plugins.push(...baseConfig.plugins);
  return webpackConfig;
};
