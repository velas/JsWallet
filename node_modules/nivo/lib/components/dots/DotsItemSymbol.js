'use strict';

exports.__esModule = true;

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _pure = require('recompose/pure');

var _pure2 = _interopRequireDefault(_pure);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var DotsItemSymbol = function DotsItemSymbol(_ref) {
    var size = _ref.size,
        color = _ref.color,
        borderWidth = _ref.borderWidth,
        borderColor = _ref.borderColor;
    return _react2.default.createElement('circle', {
        r: size / 2,
        fill: color,
        stroke: borderColor,
        strokeWidth: borderWidth,
        style: { pointerEvents: 'none' }
    });
}; /*
    * This file is part of the nivo project.
    *
    * Copyright 2016-present, Raphaël Benitte.
    *
    * For the full copyright and license information, please view the LICENSE
    * file that was distributed with this source code.
    */


DotsItemSymbol.propTypes = {
    size: _propTypes2.default.number.isRequired,
    color: _propTypes2.default.string.isRequired,
    borderWidth: _propTypes2.default.number.isRequired,
    borderColor: _propTypes2.default.string.isRequired
};

exports.default = (0, _pure2.default)(DotsItemSymbol);