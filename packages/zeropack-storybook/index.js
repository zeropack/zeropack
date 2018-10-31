const path = require('path');
const { exec } = require('child_process');

// # let binPath = process.execPath + ' ' + path.resolve(require.resolve('@storybook/react'), '..', '..', 'server', 'index.js');
// # let args = ['-p 9001', '-c ' + path.resolve(require.resolve('../storybook-config/config.js'), '..')]
// # binPath = binPath + ' ' + args.join(' ')
// # let sbServer = exec(binPath, {maxBuffer : 500 * 1024}, (error) => {
// #   console.log(error)
// # });
// # console.log(binPath);
// # sbServer.stdout.pipe(process.stdout);
// # sbServer.stderr.pipe(process.stderr);
// # sbServer.on('exit', (e) =>{
// #   console.log(e)
// # });

console.log(process.execPath);

// # const sbProcess = exec("")
