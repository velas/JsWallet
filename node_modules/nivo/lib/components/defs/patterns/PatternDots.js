'use strict';

exports.__esModule = true;
exports.patternDotsDef = exports.PatternDots = undefined;

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

var PatternDots = exports.PatternDots = (0, _pure2.default)(function (_ref) {
    var id = _ref.id,
        background = _ref.background,
        color = _ref.color,
        size = _ref.size,
        padding = _ref.padding,
        stagger = _ref.stagger;

    var fullSize = size + padding;
    var radius = size / 2;
    var halfPadding = padding / 2;
    if (stagger === true) {
        fullSize = size * 2 + padding * 2;
    }

    return _react2.default.createElement(
        'pattern',
        { id: id, width: fullSize, height: fullSize, patternUnits: 'userSpaceOnUse' },
        _react2.default.createElement('rect', { width: fullSize, height: fullSize, fill: background }),
        _react2.default.createElement('circle', { cx: halfPadding + radius, cy: halfPadding + radius, r: radius, fill: color }),
        stagger && _react2.default.createElement('circle', {
            cx: padding * 1.5 + size + radius,
            cy: padding * 1.5 + size + radius,
            r: radius,
            fill: color
        })
    );
});

PatternDots.propTypes = {
    id: _propTypes2.default.string.isRequired,
    color: _propTypes2.default.string.isRequired,
    background: _propTypes2.default.string.isRequired,
    size: _propTypes2.default.number.isRequired,
    padding: _propTypes2.default.number.isRequired,
    stagger: _propTypes2.default.bool.isRequired
};

PatternDots.defaultProps = {
    color: '#000000',
    background: '#ffffff',
    size: 4,
    padding: 4,
    stagger: false
};

var patternDotsDef = exports.patternDotsDef = function patternDotsDef(id) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return _extends({
        id: id,
        type: 'patternDots'
    }, options);
};