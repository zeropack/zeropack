import React from 'react';

Button = (props) ->
  <button onClick={props.onClick}>{props.children}</button>

export default Button
