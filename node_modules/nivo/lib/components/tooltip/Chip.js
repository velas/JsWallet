'use strict';

exports.__esModule = true;

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; }; /*
                                                                                                                                                                                                                                                                   * This file is part of the nivo project.
                                                                                                                                                                                                                                                                   *
                                                                                                                                                                                                                                                                   * Copyright 2016-present, Raphaël Benitte.
                                                                                                                                                                                                                                                                   *
                                                                                                                                                                                                                                                                   * For the full copyright and license information, please view the LICENSE
                                                                                                                                                                                                                                                                   * file that was distributed with this source code.
                                                                                                                                                                                                                                                                   */


var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _pure = require('recompose/pure');

var _pure2 = _interopRequireDefault(_pure);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var Chip = function Chip(_ref) {
    var size = _ref.size,
        color = _ref.color,
        style = _ref.style;
    return _react2.default.createElement('span', { style: _extends({ display: 'block', width: size, height: size, background: color }, style) });
};

Chip.propTypes = {
    size: _propTypes2.default.number.isRequired,
    color: _propTypes2.default.string.isRequired,
    style: _propTypes2.default.object.isRequired
};

Chip.defaultProps = {
    size: 12,
    style: {}
};

exports.default = (0, _pure2.default)(Chip);