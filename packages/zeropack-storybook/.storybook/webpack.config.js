require('coffeescript/register');
const Webpack = require('webpack');
const path = require('path');
const _ = require('lodash');

const { generateContext } = require('zeropack-core'); // requires coffeescript

const { Arr, Obj } = require('./utils');

const mergePresets = (presets) => {
  const normalized = _.map(presets, (v) => _.isString(v) ? [v, {}] : v)
  const grouped =_.groupBy(normalized, (v) => v[0]);
  return _.map(grouped, (data, name) => {
    const options = _.assign({}, ..._.map(data, (itemOptions)=>itemOptions[1]));
    return _.isEmpty(options) ? name : [name, options]
  })
};

module.exports = (baseConfig, env) => {
  const { webpackConfig: zeropackConfig } = generateContext();

  // base rules|loaders
  const [baseBabelRule, baseBabelLoader] = Arr.findRuleAndLoader(baseConfig, 'babel-loader');

  const mergedWebpackConfig = Obj.merge(
    Obj.pick(baseConfig, 'mode', 'devtool', 'entry', 'output', 'performance'),
    Obj.pick(zeropackConfig, 'context', 'module'),
    {
      resolve: {
        extensions: Arr.deepUniq('resolve.extensions', baseConfig, zeropackConfig),
        modules: Arr.deepUniq('resolve.modules', baseConfig, zeropackConfig),
        alias: Obj.merge(Obj.deepPropMerge('resolve.alias', baseConfig, zeropackConfig), {
          ZeropackContext: zeropackConfig.context,
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
              const presets = mergePresets(Arr.deepUniq('options.presets', baseBabelLoader, babelLoader));
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

  // set development mode for avoiding minification
  mergedWebpackConfig.mode = 'development';
  mergedWebpackConfig.plugins.unshift(new Webpack.DefinePlugin({
    'process.env.NODE_ENV': '"development"',
    'process.env.BROWSER': true,
    '__DEV__': true,
  }));

  return mergedWebpackConfig;
};
