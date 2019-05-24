import '@storybook/addon-actions/register';
import '@storybook/addon-knobs/register';
import '@storybook/addon-options/register';
import '@storybook/addon-viewport/register';
import '@storybook/addon-notes/register';

try {
  require('<rootDir>/.storybook/addons');
}catch (e){}

