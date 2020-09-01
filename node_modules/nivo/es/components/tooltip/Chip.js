var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import React from 'react';
import PropTypes from 'prop-types';
import pure from 'recompose/pure';

var Chip = function Chip(_ref) {
    var size = _ref.size,
        color = _ref.color,
        style = _ref.style;
    return React.createElement('span', { style: _extends({ display: 'block', width: size, height: size, background: color }, style) });
};

Chip.propTypes = {
    size: PropTypes.number.isRequired,
    color: PropTypes.string.isRequired,
    style: PropTypes.object.isRequired
};

Chip.defaultProps = {
    size: 12,
    style: {}
};

export default pure(Chip);