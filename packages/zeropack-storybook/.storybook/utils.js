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
  pluginsWithout: (config, ...exclude) => (
    _.filter(config.plugins, plugin =>
      !plugin.constructor || !exclude.includes(plugin.constructor.name)
    )
  ),
};

const Obj = {
  pick: (obj, ...keys) => _.pick(obj, keys),
  merge: (...objects) => _.assign({}, ...objects),
  deepPropMerge: (deepKey, ...objects) => (
    Obj.merge(...Arr.mapGet(objects, deepKey))
  ),
};



module.exports = { Arr, Obj };
