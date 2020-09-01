'use strict';

exports.__esModule = true;

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _reactMotion = require('react-motion');

var _GridLine = require('./GridLine');

var _GridLine2 = _interopRequireDefault(_GridLine);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; } /*
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                * This file is part of the nivo project.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                *
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                * Copyright 2016-present, Raphaël Benitte.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                *
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                * For the full copyright and license information, please view the LICENSE
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                * file that was distributed with this source code.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                */


var GridLines = function (_Component) {
    _inherits(GridLines, _Component);

    function GridLines(props) {
        _classCallCheck(this, GridLines);

        var _this = _possibleConstructorReturn(this, _Component.call(this, props));

        _this.willEnter = _this.willEnter.bind(_this);
        _this.willLeave = _this.willLeave.bind(_this);
        return _this;
    }

    GridLines.prototype.willEnter = function willEnter(_ref) {
        var style = _ref.style;
        var type = this.props.type;


        return {
            opacity: 0,
            x1: type === 'x' ? 0 : style.x1.val,
            x2: type === 'x' ? 0 : style.x2.val,
            y1: type === 'y' ? 0 : style.y1.val,
            y2: type === 'y' ? 0 : style.y2.val
        };
    };

    GridLines.prototype.willLeave = function willLeave(_ref2) {
        var style = _ref2.style;
        var _props = this.props,
            motionStiffness = _props.motionStiffness,
            motionDamping = _props.motionDamping;

        var springConfig = {
            stiffness: motionStiffness,
            damping: motionDamping
        };

        return {
            opacity: (0, _reactMotion.spring)(0, springConfig),
            x1: (0, _reactMotion.spring)(style.x1.val, springConfig),
            x2: (0, _reactMotion.spring)(style.x2.val, springConfig),
            y1: (0, _reactMotion.spring)(style.y1.val, springConfig),
            y2: (0, _reactMotion.spring)(style.y2.val, springConfig)
        };
    };

    GridLines.prototype.render = function render() {
        var _props2 = this.props,
            lines = _props2.lines,
            animate = _props2.animate,
            motionStiffness = _props2.motionStiffness,
            motionDamping = _props2.motionDamping,
            theme = _props2.theme;


        if (!animate) {
            return _react2.default.createElement(
                'g',
                null,
                lines.map(function (line) {
                    return _react2.default.createElement(_GridLine2.default, _extends({}, line, theme.grid));
                })
            );
        }

        var springConfig = {
            stiffness: motionStiffness,
            damping: motionDamping
        };

        return _react2.default.createElement(
            _reactMotion.TransitionMotion,
            {
                willEnter: this.willEnter,
                willLeave: this.willLeave,
                styles: lines.map(function (line) {
                    return {
                        key: line.key,
                        style: {
                            opacity: (0, _reactMotion.spring)(1, springConfig),
                            x1: (0, _reactMotion.spring)(line.x1 || 0, springConfig),
                            x2: (0, _reactMotion.spring)(line.x2 || 0, springConfig),
                            y1: (0, _reactMotion.spring)(line.y1 || 0, springConfig),
                            y2: (0, _reactMotion.spring)(line.y2 || 0, springConfig)
                        }
                    };
                })
            },
            function (interpolatedStyles) {
                return _react2.default.createElement(
                    'g',
                    null,
                    interpolatedStyles.map(function (interpolatedStyle) {
                        var key = interpolatedStyle.key,
                            style = interpolatedStyle.style;


                        return _react2.default.createElement(_GridLine2.default, _extends({ key: key }, theme.grid, style));
                    })
                );
            }
        );
    };

    return GridLines;
}(_react.Component);

GridLines.propTypes = {
    type: _propTypes2.default.oneOf(['x', 'y']).isRequired,
    lines: _propTypes2.default.arrayOf(_propTypes2.default.shape({
        key: _propTypes2.default.string.isRequired,
        x1: _propTypes2.default.number,
        x2: _propTypes2.default.number,
        y1: _propTypes2.default.number,
        y2: _propTypes2.default.number
    })).isRequired,
    theme: _propTypes2.default.object.isRequired,
    // motion
    animate: _propTypes2.default.bool.isRequired,
    motionStiffness: _propTypes2.default.number.isRequired,
    motionDamping: _propTypes2.default.number.isRequired
};
exports.default = GridLines;