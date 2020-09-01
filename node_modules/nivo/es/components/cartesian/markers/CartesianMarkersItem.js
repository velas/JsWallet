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

/**
 *
 * @param {string} axis
 * @param {number} width
 * @param {number} height
 * @param {string} position
 * @param {number} offsetX
 * @param {number} offsetY
 * @param {string} orientation
 * @return {{ x: number, y: number, textAnchor: string }}
 */
var computeLabel = function computeLabel(_ref) {
    var axis = _ref.axis,
        width = _ref.width,
        height = _ref.height,
        position = _ref.position,
        offsetX = _ref.offsetX,
        offsetY = _ref.offsetY,
        orientation = _ref.orientation;

    var x = 0;
    var y = 0;
    var rotation = orientation === 'vertical' ? -90 : 0;
    var textAnchor = 'start';

    if (axis === 'x') {
        switch (position) {
            case 'top-left':
                x = -offsetX;
                y = offsetY;
                textAnchor = 'end';
                break;
            case 'top':
                y = -offsetY;
                if (orientation === 'horizontal') {
                    textAnchor = 'middle';
                } else {
                    textAnchor = 'start';
                }
                break;
            case 'top-right':
                x = offsetX;
                y = offsetY;
                if (orientation === 'horizontal') {
                    textAnchor = 'start';
                } else {
                    textAnchor = 'end';
                }
                break;
            case 'right':
                x = offsetX;
                y = height / 2;
                if (orientation === 'horizontal') {
                    textAnchor = 'start';
                } else {
                    textAnchor = 'middle';
                }
                break;
            case 'bottom-right':
                x = offsetX;
                y = height - offsetY;
                textAnchor = 'start';
                break;
            case 'bottom':
                y = height + offsetY;
                if (orientation === 'horizontal') {
                    textAnchor = 'middle';
                } else {
                    textAnchor = 'end';
                }
                break;
            case 'bottom-left':
                y = height - offsetY;
                x = -offsetX;
                if (orientation === 'horizontal') {
                    textAnchor = 'end';
                } else {
                    textAnchor = 'start';
                }
                break;
            case 'left':
                x = -offsetX;
                y = height / 2;
                if (orientation === 'horizontal') {
                    textAnchor = 'end';
                } else {
                    textAnchor = 'middle';
                }
                break;
        }
    } else {
        switch (position) {
            case 'top-left':
                x = offsetX;
                y = -offsetY;
                textAnchor = 'start';
                break;
            case 'top':
                x = width / 2;
                y = -offsetY;
                if (orientation === 'horizontal') {
                    textAnchor = 'middle';
                } else {
                    textAnchor = 'start';
                }
                break;
            case 'top-right':
                x = width - offsetX;
                y = -offsetY;
                if (orientation === 'horizontal') {
                    textAnchor = 'end';
                } else {
                    textAnchor = 'start';
                }
                break;
            case 'right':
                x = width + offsetX;
                if (orientation === 'horizontal') {
                    textAnchor = 'start';
                } else {
                    textAnchor = 'middle';
                }
                break;
            case 'bottom-right':
                x = width - offsetX;
                y = offsetY;
                textAnchor = 'end';
                break;
            case 'bottom':
                x = width / 2;
                y = offsetY;
                if (orientation === 'horizontal') {
                    textAnchor = 'middle';
                } else {
                    textAnchor = 'end';
                }
                break;
            case 'bottom-left':
                x = offsetX;
                y = offsetY;
                if (orientation === 'horizontal') {
                    textAnchor = 'start';
                } else {
                    textAnchor = 'end';
                }
                break;
            case 'left':
                x = -offsetX;
                if (orientation === 'horizontal') {
                    textAnchor = 'end';
                } else {
                    textAnchor = 'middle';
                }
                break;
        }
    }

    return { x: x, y: y, rotation: rotation, textAnchor: textAnchor };
};

var CartesianMarkersItem = function CartesianMarkersItem(_ref2) {
    var width = _ref2.width,
        height = _ref2.height,
        axis = _ref2.axis,
        scale = _ref2.scale,
        value = _ref2.value,
        theme = _ref2.theme,
        lineStyle = _ref2.lineStyle,
        textStyle = _ref2.textStyle,
        legend = _ref2.legend,
        legendPosition = _ref2.legendPosition,
        legendOffsetX = _ref2.legendOffsetX,
        legendOffsetY = _ref2.legendOffsetY,
        legendOrientation = _ref2.legendOrientation;

    var x = 0;
    var x2 = 0;
    var y = 0;
    var y2 = 0;

    if (axis === 'y') {
        y = scale(value);
        x2 = width;
    } else {
        x = scale(value);
        y2 = height;
    }

    var legendNode = null;
    if (legend) {
        var legendProps = computeLabel({
            axis: axis,
            width: width,
            height: height,
            position: legendPosition,
            offsetX: legendOffsetX,
            offsetY: legendOffsetY,
            orientation: legendOrientation
        });
        legendNode = React.createElement(
            'text',
            {
                transform: 'translate(' + legendProps.x + ', ' + legendProps.y + ') rotate(' + legendProps.rotation + ')',
                textAnchor: legendProps.textAnchor,
                alignmentBaseline: 'central',
                style: textStyle
            },
            legend
        );
    }

    return React.createElement(
        'g',
        { transform: 'translate(' + x + ', ' + y + ')' },
        React.createElement('line', {
            x1: 0,
            x2: x2,
            y1: 0,
            y2: y2,
            stroke: theme.markers.lineColor,
            strokeWidth: theme.markers.lineStrokeWidth,
            style: lineStyle
        }),
        legendNode
    );
};

CartesianMarkersItem.propTypes = {
    width: PropTypes.number.isRequired,
    height: PropTypes.number.isRequired,

    axis: PropTypes.oneOf(['x', 'y']).isRequired,
    scale: PropTypes.func.isRequired,
    value: PropTypes.oneOfType([PropTypes.number, PropTypes.string]).isRequired,
    lineStyle: PropTypes.object,
    textStyle: PropTypes.object,

    legend: PropTypes.string,
    legendPosition: PropTypes.oneOf(['top-left', 'top', 'top-right', 'right', 'bottom-right', 'bottom', 'bottom-left', 'left']),
    legendOffsetX: PropTypes.number.isRequired,
    legendOffsetY: PropTypes.number.isRequired,
    legendOrientation: PropTypes.oneOf(['horizontal', 'vertical']).isRequired,

    theme: PropTypes.shape({
        markers: PropTypes.shape({
            textColor: PropTypes.string.isRequired,
            fontSize: PropTypes.oneOfType([PropTypes.number, PropTypes.string]).isRequired
        }).isRequired
    }).isRequired
};

CartesianMarkersItem.defaultProps = {
    legendPosition: 'top-right',
    legendOffsetX: 14,
    legendOffsetY: 14,
    legendOrientation: 'horizontal'
};

export default pure(CartesianMarkersItem);