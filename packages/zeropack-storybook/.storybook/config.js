const storybook = require('@storybook/react');

console.log('GIT_META', GIT_META);

let applyConfig;
try {
  applyConfig = require('<rootDir>/.storybook/config').default
} catch (e) {
  applyConfig = require('./defaultConfig').default
}

applyConfig(storybook);
