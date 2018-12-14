const _ = require('lodash');

const Arr = {
  mapGet: (objects, deepKey) => (
    objects.map(
      obj => _.get(obj, deepKey)
    )
  ),
  deepUniq: (deepKey, ...objects) => (
    _.union(...Arr.mapGet(objects, deepKey))
  ),
  findLoader: (loaders, loaderName) => (
    _.find(loaders, loader =>
      typeof loader === 'object' && loader.loader === loaderName
    )
  ),
  findRuleAndLoader: (config, loaderName) => {
    let loader;
    const rule = _.find(config.module.rules, rule =>
      loader = Arr.findLoader(rule.use, loaderName)
    );
    return [rule, loader];
  },
  reducePlugins: (config, cb) => (
    _.reduce(config.plugins, (plugins, plugin) => {
      if (plugin.constructor && plugin.constructor.name) {
        cb(plugins, _.cloneDeep(plugin), plugin.constructor.name);
      } else {
        plugins.push(plugin);
      }
      return plugins;
    }, [])
  )
};

const Obj = {
  pick: (obj, ...keys) => _.pick(obj, keys),
  merge: (...objects) => _.assign({}, ...objects),
  deepPropMerge: (deepKey, ...objects) => (
    Obj.merge(...Arr.mapGet(objects, deepKey))
  ),
};

module.exports = { Arr, Obj };
