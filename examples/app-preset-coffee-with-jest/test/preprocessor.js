var coffee = require('coffeescript');

const config = {
  babelrc: false,
  plugins: [
    '@babel/plugin-transform-modules-commonjs',
    '@babel/plugin-proposal-object-rest-spread'
  ],
  presets: [
    "@babel/env", "@babel/react"
  ]
};
const babelJest = require("babel-jest").createTransformer(config);

module.exports = {
  process: function(src, path, ...rest) {
    if (path.match(/\.(coffee|cjsx)$/)) {
      var compiledResult = coffee.compile(src, {
        header: false,
        sourceMap: true, // {js, v3SourceMap, sourceMap}
        filename: path, // include filename to source map
        bare: true,
        transpile: {
          plugins: [
            '@babel/transform-modules-commonjs',
            '@babel/proposal-object-rest-spread'
          ],
          presets: [
            "@babel/env", "@babel/react"
          ]
        }
      });

      return { // convert to jest format
        code: compiledResult.js,
        map: compiledResult.v3SourceMap
      };
    }
    else if (path.match(/\.jsx?$/)) {
      return babelJest.process(src, path, ...rest);
    }
    return src;
  }
};
