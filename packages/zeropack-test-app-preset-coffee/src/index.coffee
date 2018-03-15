require './index.scss'

import React from 'react'
import {render} from 'react-dom'
import App from './app'

appNode = document.getElementById 'app'
render <App/>, appNode
