import React, {PureComponent} from 'react'

class App extends PureComponent{
  render() {
    let data = {message: 'Hello world!'}
    let {message} = {...data};
    return <h1>{message}</h1>
  }
}

export default App
