require('coffeescript/register');
const path = require('path');
const _ = require('lodash');

const { generateContext } = require('zeropack-core'); // requires coffeescript

const { Arr, Obj } = require('./utils');

module.exports = (baseConfig, env) => {
  const { webpackConfig: zeropackConfig } = generateContext();

  // base rules|loaders
  const [baseBabelRule, baseBabelLoader] = Arr.findRuleAndLoader(baseConfig, 'babel-loader');

  return Obj.merge(
    Obj.pick(baseConfig, 'mode', 'devtool', 'entry', 'output', 'performance'),
    Obj.pick(zeropackConfig, 'context', 'module'),
    {
      resolve: {
        extensions: Arr.deepUniq('resolve.extensions', baseConfig, zeropackConfig),
        modules: Arr.deepUniq('resolve.modules', baseConfig, zeropackConfig),
        alias: Obj.merge(Obj.deepPropMerge('resolve.alias', baseConfig, zeropackConfig), {
          ZeropackContext: zeropackConfig.context
        }),
      },
      plugins: [
        ...baseConfig.plugins,
        ...Arr.reducePlugins(zeropackConfig, (plugins, plugin, pluginName) => {
          const exclude = ['HtmlWebpackPlugin'];
          if (exclude.includes(pluginName)) return;

          if (pluginName === 'HappyPlugin') {
            const babelLoader = Arr.findLoader(plugin.config.loaders, 'babel-loader');
            if (babelLoader) {
              const presets = Arr.deepUniq('options.presets', baseBabelLoader, babelLoader);
              const plugins = Arr.deepUniq('options.plugins', baseBabelLoader, babelLoader);
              _.assign(babelLoader.options, { presets, plugins });
              _.defaultsDeep(babelLoader, baseBabelLoader);
            }
          }
          plugins.push(plugin);
        }),
      ],
      node: {
        fs: 'empty' // Fixed: Can't resolve 'fs'
      },
    }
  );
};
