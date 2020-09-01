'use strict';

exports.__esModule = true;
exports.patternLinesDef = exports.PatternLines = undefined;

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

var _polar = require('../../../lib/polar');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var PatternLines = exports.PatternLines = (0, _pure2.default)(function (_ref) {
    var id = _ref.id,
        _spacing = _ref.spacing,
        _rotation = _ref.rotation,
        background = _ref.background,
        color = _ref.color,
        lineWidth = _ref.lineWidth;

    var rotation = Math.round(_rotation) % 360;
    var spacing = Math.abs(_spacing);

    if (rotation > 180) rotation = rotation - 360;else if (rotation > 90) rotation = rotation - 180;else if (rotation < -180) rotation = rotation + 360;else if (rotation < -90) rotation = rotation + 180;

    var width = spacing;
    var height = spacing;
    var path = void 0;

    if (rotation === 0) {
        path = '\n                M 0 0 L ' + width + ' 0\n                M 0 ' + height + ' L ' + width + ' ' + height + '\n            ';
    } else if (rotation === 90) {
        path = '\n                M 0 0 L 0 ' + height + '\n                M ' + width + ' 0 L ' + width + ' ' + height + '\n            ';
    } else {
        width = Math.abs(spacing / Math.sin((0, _polar.degreesToRadians)(rotation)));
        height = spacing / Math.sin((0, _polar.degreesToRadians)(90 - rotation));

        if (rotation > 0) {
            path = '\n                    M 0 ' + -height + ' L ' + width * 2 + ' ' + height + '\n                    M ' + -width + ' ' + -height + ' L ' + width + ' ' + height + '\n                    M ' + -width + ' 0 L ' + width + ' ' + height * 2 + '\n                ';
        } else {
            path = '\n                    M ' + -width + ' ' + height + ' L ' + width + ' ' + -height + '\n                    M ' + -width + ' ' + height * 2 + ' L ' + width * 2 + ' ' + -height + '\n                    M 0 ' + height * 2 + ' L ' + width * 2 + ' 0\n                ';
        }
    }

    return _react2.default.createElement(
        'pattern',
        { id: id, width: width, height: height, patternUnits: 'userSpaceOnUse' },
        _react2.default.createElement('rect', {
            width: width,
            height: height,
            fill: background,
            stroke: 'rgba(255, 0, 0, 0.1)',
            strokeWidth: 0
        }),
        _react2.default.createElement('path', { d: path, strokeWidth: lineWidth, stroke: color, strokeLinecap: 'square' })
    );
});

PatternLines.propTypes = {
    id: _propTypes2.default.string.isRequired,
    spacing: _propTypes2.default.number.isRequired,
    rotation: _propTypes2.default.number.isRequired,
    background: _propTypes2.default.string.isRequired,
    color: _propTypes2.default.string.isRequired,
    lineWidth: _propTypes2.default.number.isRequired
};

PatternLines.defaultProps = {
    spacing: 5,
    rotation: 0,
    color: '#000000',
    background: '#ffffff',
    lineWidth: 2
};

var patternLinesDef = exports.patternLinesDef = function patternLinesDef(id) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return _extends({
        id: id,
        type: 'patternLines'
    }, options);
};