require('coffeescript/register');
const path = require('path');

const { generateContext } = require('zeropack-core'); // requires coffeescript

const { Arr, Obj } = require('./utils');

module.exports = (baseConfig, env) => {
  const { webpackConfig: zeropackConfig } = generateContext();

  let config = Obj.merge(
    Obj.pick(baseConfig, 'mode', 'devtool', 'entry', 'output', 'performance'),
    Obj.pick(zeropackConfig, 'context'), {
    resolve: {
      extensions: Arr.uniqueMerge(baseConfig, zeropackConfig, 'resolve.extensions'),
      modules: Arr.uniqueMerge(baseConfig, zeropackConfig, 'resolve.modules'),
      alias: Obj.deepPropMerge(baseConfig, zeropackConfig, 'resolve.alias')
    },
    module: {},
    plugins: [],
  });

  // webpackConfig.plugins.push(...baseConfig.plugins);  

  return config;
};
