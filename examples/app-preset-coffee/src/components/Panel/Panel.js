import React, { PureComponent } from 'react';

import './Panel.styl'

class Panel extends PureComponent {
  render() {
    const { children } = this.props;

    return (
      <div className='panel'>{children}</div>
    );
  }
}

export default Panel;
