import App1 from './app1'
import React, {PureComponent} from 'react'

class App extends PureComponent
  render: ->
    data = message: 'Hello world!'
    {message} = {...data}
    <h1>{message}</h1>

export default App
