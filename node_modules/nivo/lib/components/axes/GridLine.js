'use strict';

exports.__esModule = true;

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
var GridLine = function GridLine(props) {
    return _react2.default.createElement('line', props);
};

GridLine.propTypes = {
    x1: _propTypes2.default.number.isRequired,
    x2: _propTypes2.default.number.isRequired,
    y1: _propTypes2.default.number.isRequired,
    y2: _propTypes2.default.number.isRequired
};

GridLine.defaultProps = {
    x1: 0,
    x2: 0,
    y1: 0,
    y2: 0
};

exports.default = GridLine;