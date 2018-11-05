const _ = require('lodash');

const Arr = {
  deepUniq: (deepKey, ...objects) => (
    _.union(...objects.map(
      obj => _.get(obj, deepKey)
    ))
  ),
  pluginsWithout: (config, pluginName) => (
    _.filter(config.plugins, plugin =>
      !plugin.constructor || plugin.constructor.name != pluginName
    )
  ),
};

const Obj = {
  pick: (obj, ...keys) => _.pick(obj, keys),
  merge: (...objects) => _.assign({}, ...objects),
  deepPropMerge: (obj1, obj2, deepKey) => (
    Obj.merge(
      _.get(obj1, deepKey),
      _.get(obj2, deepKey)
    )
  ),
};

module.exports = { Arr, Obj };
