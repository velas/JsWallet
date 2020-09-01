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
import { defaultMotionDamping, defaultMotionStiffness } from '../../defaults';
import GridLines from './GridLines';
import { motionPropTypes } from '../../props';

var center = function center(scale) {
    var offset = scale.bandwidth() / 2;
    if (scale.round()) offset = Math.round(offset);

    return function (d) {
        return scale(d) + offset;
    };
};

var Grid = function Grid(_ref) {
    var width = _ref.width,
        height = _ref.height,
        xScale = _ref.xScale,
        yScale = _ref.yScale,
        theme = _ref.theme,
        animate = _ref.animate,
        motionStiffness = _ref.motionStiffness,
        motionDamping = _ref.motionDamping;

    var xLines = void 0;
    if (xScale) {
        var xValues = void 0;
        if (xScale.ticks) {
            xValues = xScale.ticks();
        } else {
            xValues = xScale.domain();
        }

        var xPosition = xScale.bandwidth ? center(xScale) : xScale;

        xLines = xValues.map(function (v) {
            return {
                key: '' + v,
                x1: xPosition(v),
                x2: xPosition(v),
                y2: height
            };
        });
    }

    var yLines = void 0;
    if (yScale) {
        var yValues = void 0;
        if (yScale.ticks) {
            yValues = yScale.ticks();
        } else {
            yValues = yScale.domain();
        }

        var yPosition = yScale.bandwidth ? center(yScale) : yScale;

        yLines = yValues.map(function (v) {
            return {
                key: '' + v,
                x2: width,
                y1: yPosition(v),
                y2: yPosition(v)
            };
        });
    }

    return React.createElement(
        'g',
        null,
        xLines && React.createElement(GridLines, {
            type: 'x',
            lines: xLines,
            theme: theme,
            animate: animate,
            motionStiffness: motionStiffness,
            motionDamping: motionDamping
        }),
        yLines && React.createElement(GridLines, {
            type: 'y',
            lines: yLines,
            theme: theme,
            animate: animate,
            motionStiffness: motionStiffness,
            motionDamping: motionDamping
        })
    );
};

Grid.propTypes = _extends({
    width: PropTypes.number.isRequired,
    height: PropTypes.number.isRequired,

    xScale: PropTypes.func,
    yScale: PropTypes.func,

    theme: PropTypes.object.isRequired

}, motionPropTypes);

Grid.defaultProps = {
    // motion
    animate: true,
    motionStiffness: defaultMotionStiffness,
    motionDamping: defaultMotionDamping
};

export default pure(Grid);