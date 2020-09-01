'use strict';

exports.__esModule = true;
exports.DotsItemDefaultProps = undefined;

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _pure = require('recompose/pure');

var _pure2 = _interopRequireDefault(_pure);

var _DotsItemSymbol = require('./DotsItemSymbol');

var _DotsItemSymbol2 = _interopRequireDefault(_DotsItemSymbol);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
var DotsItem = function DotsItem(_ref) {
    var x = _ref.x,
        y = _ref.y,
        symbol = _ref.symbol,
        size = _ref.size,
        color = _ref.color,
        borderWidth = _ref.borderWidth,
        borderColor = _ref.borderColor,
        label = _ref.label,
        labelTextAnchor = _ref.labelTextAnchor,
        labelYOffset = _ref.labelYOffset,
        theme = _ref.theme;
    return _react2.default.createElement(
        'g',
        { transform: 'translate(' + x + ', ' + y + ')', style: { pointerEvents: 'none' } },
        _react2.default.createElement(symbol, {
            size: size,
            color: color,
            borderWidth: borderWidth,
            borderColor: borderColor
        }),
        label && _react2.default.createElement(
            'text',
            {
                textAnchor: labelTextAnchor,
                y: labelYOffset,
                style: {
                    fontSize: theme.dots.fontSize,
                    fill: theme.dots.textColor
                }
            },
            label
        )
    );
};

DotsItem.propTypes = {
    // position
    x: _propTypes2.default.number.isRequired,
    y: _propTypes2.default.number.isRequired,

    // style
    size: _propTypes2.default.number.isRequired,
    color: _propTypes2.default.string.isRequired,
    borderWidth: _propTypes2.default.number.isRequired,
    borderColor: _propTypes2.default.string.isRequired,

    symbol: _propTypes2.default.func.isRequired,

    // label
    label: _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.number]),
    labelTextAnchor: _propTypes2.default.oneOf(['start', 'middle', 'end']),
    labelYOffset: _propTypes2.default.number.isRequired,

    // theming
    theme: _propTypes2.default.shape({
        dots: _propTypes2.default.shape({
            textColor: _propTypes2.default.string.isRequired,
            fontSize: _propTypes2.default.string.isRequired
        }).isRequired
    }).isRequired
};

var DotsItemDefaultProps = exports.DotsItemDefaultProps = {
    symbol: _DotsItemSymbol2.default,

    // label
    labelTextAnchor: 'middle',
    labelYOffset: -12
};

DotsItem.defaultProps = DotsItemDefaultProps;

exports.default = (0, _pure2.default)(DotsItem);