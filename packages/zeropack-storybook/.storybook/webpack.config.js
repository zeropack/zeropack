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
      extensions: Arr.deepUniq('resolve.extensions', baseConfig, zeropackConfig),
      modules: Arr.deepUniq('resolve.modules', baseConfig, zeropackConfig),
      alias: Obj.deepPropMerge('resolve.alias', baseConfig, zeropackConfig)
    },
    module: {
      rules: zeropackConfig.module.rules
    },
    plugins: [
      ...baseConfig.plugins,
      // TODO: check if need exclude ProgressPlugin
      ...Arr.pluginsWithout(zeropackConfig, 'HtmlWebpackPlugin', 'ProgressPlugin')
    ],
  });

  // TODO: extend babel config in zeropack from storybook
  console.log(zeropackConfig.plugins[4].config);
  console.log('!!!!!!!!!!!!');
  console.log(zeropackConfig.plugins[4].config.loaders[1]);

  return config;
};
