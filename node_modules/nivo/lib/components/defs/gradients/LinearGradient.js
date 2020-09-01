'use strict';

exports.__esModule = true;
exports.linearGradientDef = exports.LinearGradient = undefined;

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

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var LinearGradient = exports.LinearGradient = function LinearGradient(_ref) {
    var id = _ref.id,
        colors = _ref.colors;
    return _react2.default.createElement(
        'linearGradient',
        { id: id, x1: 0, x2: 0, y1: 0, y2: 1 },
        colors.map(function (_ref2) {
            var offset = _ref2.offset,
                color = _ref2.color,
                opacity = _ref2.opacity;
            return _react2.default.createElement('stop', {
                key: offset,
                offset: offset + '%',
                stopColor: color,
                stopOpacity: opacity !== undefined ? opacity : 1
            });
        })
    );
};

LinearGradient.propTypes = {
    id: _propTypes2.default.string.isRequired,
    colors: _propTypes2.default.arrayOf(_propTypes2.default.shape({
        offset: _propTypes2.default.number.isRequired,
        color: _propTypes2.default.string.isRequired
    })).isRequired
};

var linearGradientDef = exports.linearGradientDef = function linearGradientDef(id, colors) {
    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    return _extends({
        id: id,
        type: 'linearGradient',
        colors: colors
    }, options);
};