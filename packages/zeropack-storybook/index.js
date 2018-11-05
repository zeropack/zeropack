const path = require('path');
const { spawn, exec } = require('child_process');

const action = process.argv[2];
const actions = ['start', 'build'];
if (!actions.includes(action)) {
  console.error(`Action '${action}' not available, please use one of: ${actions.join(', ')}`);
  process.exit(1);
}

const userArgs = process.argv.slice(3);
const args = [
  `${action}-storybook`,
  '-p 9090',
  `-c ${path.resolve(__dirname, '.storybook')}`,
  ...userArgs
];

// TODO: with spawn
// const sbProc = spawn('npx', args);
const sbProc = exec(`npx ${args.join(' ')}`, { maxBuffer: 10 * 1024 * 1024 }, error => {
  console.error('storybook process error:', error);
});

sbProc.stdout.pipe(process.stdout);
sbProc.stderr.pipe(process.stderr);
sbProc.on('close', code => {
  console.log(`storybook process exited with code ${code}`);
  process.exit(code);
});
