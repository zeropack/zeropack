import {shallow} from 'enzyme'

import App from './app.coffee'

describe 'app', ->
  it 'have hello message', ->
    wrapper = shallow <App />
    expect(wrapper.text()).toEqual 'Hello world!'
