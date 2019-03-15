import React, {PureComponent} from 'react'

import './App.scss'

import Panel from '../Panel'
import Img from '../../image_404.png'

class App extends PureComponent
  render: ->
    data = message: 'Hello world!'
    {message} = {...data}
    <Panel>
      <h1>{message}</h1>
      <img src={Img} />
    </Panel>

export default App
