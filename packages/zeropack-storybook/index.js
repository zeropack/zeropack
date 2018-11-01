const path = require('path');
const { exec } = require('child_process');

const action = process.argv[2];
const actions = ['start', 'end'];
if (!actions.includes(action)) {
  console.error(`Action '${action}' not available, please use one of: ${actions.join(', ')}`);
  process.exit(1);
}

const userArgs = process.argv.slice(3);
const args = [
  '-p 9090',
  `-c ${path.resolve(__dirname, '.storybook')}`,
  ...userArgs
];
const cmd = `npx ${action}-storybook ${args.join(' ')}`;
const sbProc = exec(cmd, {maxBuffer : 500 * 1024}, (error) => {
  console.error(error);
});
sbProc.stdout.pipe(process.stdout);
sbProc.stderr.pipe(process.stderr);
