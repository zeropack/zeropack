require './index.scss'

import React from 'react'
import {render} from 'react-dom'
import App from './app1'

appNode = document.getElementById 'app'
render <App/>, appNode
