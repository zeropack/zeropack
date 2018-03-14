require './index.scss'

React = require 'react'
import {render} from 'react-dom'

app = <h1>Hello world</h1>
appNode = document.getElementById 'app'
render app, appNode
