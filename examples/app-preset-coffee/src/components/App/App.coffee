import React, {PureComponent} from 'react'

import './App.scss'

import Panel from '../Panel'

class App extends PureComponent
  render: ->
    data = message: 'Hello world!'
    {message} = {...data}

    <Panel>
      <h1>{message}</h1>
    </Panel>

export default App
