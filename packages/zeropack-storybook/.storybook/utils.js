const _ = require('lodash');

const Arr = {
  uniqueMerge: (obj1, obj2, deepKey) => (
    [...new Set([
      ..._.get(obj1, deepKey),
      ..._.get(obj2, deepKey)
    ])]
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
