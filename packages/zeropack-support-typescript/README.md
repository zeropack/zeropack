## zeropack-support-typescript

It's simple wrapper for [ts-loader](https://github.com/TypeStrong/ts-loader)
with minimal config:
```
  options:
    silent: true
    happyPackMode: true
```

### how to rewrite config
zeropack.config.coffee:
```
  "zeropack-support-typescript":
    options: # ts-loader options
      silent: false
      #happyPackMode: false
```

### what about type checking?
if [happyPackMode](https://github.com/TypeStrong/ts-loader#happypackmode-boolean-defaultfalse)
is enabled than [transpileOnly](https://github.com/TypeStrong/ts-loader#transpileonly-boolean-defaultfalse) 
is enabled too and WARNING! stops registering all errors to webpack.

You can use [fork-ts-checker-webpack-plugin](https://github.com/Realytics/fork-ts-checker-webpack-plugin)
to get full type checking again with `forkTsChecker` 
[option](https://github.com/Realytics/fork-ts-checker-webpack-plugin#options):  
```
  "zeropack-support-typescript":
    forkTsChecker:
      tsconfig: path.join(__dirname, 'tsconfig.json')
      checkSyntacticErrors: true
    options:
      silent: false
      transpileOnly: true
```
```
npm install --save-dev fork-ts-checker-webpack-plugin
```

