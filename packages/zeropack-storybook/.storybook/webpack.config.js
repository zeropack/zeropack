require('coffeescript/register');
const path = require('path');

const { generateContext } = require('zeropack-core'); // requires coffeescript

const { Arr, Obj } = require('./utils');

module.exports = (baseConfig, env) => {
  const { webpackConfig: zeropackConfig } = generateContext();

  let config = Obj.merge(
    Obj.pick(baseConfig, 'mode', 'devtool', 'entry', 'output', 'performance'),
    Obj.pick(zeropackConfig, 'context', 'module'), {
    resolve: {
      extensions: Arr.deepUniq('resolve.extensions', baseConfig, zeropackConfig),
      modules: Arr.deepUniq('resolve.modules', baseConfig, zeropackConfig),
      alias: Obj.merge(Obj.deepPropMerge('resolve.alias', baseConfig, zeropackConfig), {
        ZeropackContext: zeropackConfig.context
      }),
    },
    plugins: [
      ...baseConfig.plugins,
      ...Arr.pluginsWithout(zeropackConfig, 'HtmlWebpackPlugin')
    ],
    node: {
      fs: 'empty' // Fixed: Can't resolve 'fs'
    },
  });

  // hacks with include exclude for babel
  config.module.rules[0].include = baseConfig.module.rules[0].include;
  config.module.rules[0].exclude = [
    config.module.rules[0].exclude,
    ...baseConfig.module.rules[0].exclude
  ];
  config.module.rules[1].include = baseConfig.module.rules[0].include;
  config.module.rules[1].exclude = baseConfig.module.rules[0].exclude;

  // TODO: extend babel config in zeropack from storybook docgen
  console.log('happypack babel:', zeropackConfig.plugins[4].config.loaders[1]);

  return config;
};
