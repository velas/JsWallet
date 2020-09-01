var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { TransitionMotion, spring } from 'react-motion';
import GridLine from './GridLine';

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
            opacity: spring(0, springConfig),
            x1: spring(style.x1.val, springConfig),
            x2: spring(style.x2.val, springConfig),
            y1: spring(style.y1.val, springConfig),
            y2: spring(style.y2.val, springConfig)
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
            return React.createElement(
                'g',
                null,
                lines.map(function (line) {
                    return React.createElement(GridLine, _extends({}, line, theme.grid));
                })
            );
        }

        var springConfig = {
            stiffness: motionStiffness,
            damping: motionDamping
        };

        return React.createElement(
            TransitionMotion,
            {
                willEnter: this.willEnter,
                willLeave: this.willLeave,
                styles: lines.map(function (line) {
                    return {
                        key: line.key,
                        style: {
                            opacity: spring(1, springConfig),
                            x1: spring(line.x1 || 0, springConfig),
                            x2: spring(line.x2 || 0, springConfig),
                            y1: spring(line.y1 || 0, springConfig),
                            y2: spring(line.y2 || 0, springConfig)
                        }
                    };
                })
            },
            function (interpolatedStyles) {
                return React.createElement(
                    'g',
                    null,
                    interpolatedStyles.map(function (interpolatedStyle) {
                        var key = interpolatedStyle.key,
                            style = interpolatedStyle.style;


                        return React.createElement(GridLine, _extends({ key: key }, theme.grid, style));
                    })
                );
            }
        );
    };

    return GridLines;
}(Component);

GridLines.propTypes = {
    type: PropTypes.oneOf(['x', 'y']).isRequired,
    lines: PropTypes.arrayOf(PropTypes.shape({
        key: PropTypes.string.isRequired,
        x1: PropTypes.number,
        x2: PropTypes.number,
        y1: PropTypes.number,
        y2: PropTypes.number
    })).isRequired,
    theme: PropTypes.object.isRequired,
    // motion
    animate: PropTypes.bool.isRequired,
    motionStiffness: PropTypes.number.isRequired,
    motionDamping: PropTypes.number.isRequired
};
export default GridLines;