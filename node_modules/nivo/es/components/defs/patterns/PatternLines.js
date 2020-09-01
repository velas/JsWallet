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
import { degreesToRadians } from '../../../lib/polar';

export var PatternLines = pure(function (_ref) {
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
        width = Math.abs(spacing / Math.sin(degreesToRadians(rotation)));
        height = spacing / Math.sin(degreesToRadians(90 - rotation));

        if (rotation > 0) {
            path = '\n                    M 0 ' + -height + ' L ' + width * 2 + ' ' + height + '\n                    M ' + -width + ' ' + -height + ' L ' + width + ' ' + height + '\n                    M ' + -width + ' 0 L ' + width + ' ' + height * 2 + '\n                ';
        } else {
            path = '\n                    M ' + -width + ' ' + height + ' L ' + width + ' ' + -height + '\n                    M ' + -width + ' ' + height * 2 + ' L ' + width * 2 + ' ' + -height + '\n                    M 0 ' + height * 2 + ' L ' + width * 2 + ' 0\n                ';
        }
    }

    return React.createElement(
        'pattern',
        { id: id, width: width, height: height, patternUnits: 'userSpaceOnUse' },
        React.createElement('rect', {
            width: width,
            height: height,
            fill: background,
            stroke: 'rgba(255, 0, 0, 0.1)',
            strokeWidth: 0
        }),
        React.createElement('path', { d: path, strokeWidth: lineWidth, stroke: color, strokeLinecap: 'square' })
    );
});

PatternLines.propTypes = {
    id: PropTypes.string.isRequired,
    spacing: PropTypes.number.isRequired,
    rotation: PropTypes.number.isRequired,
    background: PropTypes.string.isRequired,
    color: PropTypes.string.isRequired,
    lineWidth: PropTypes.number.isRequired
};

PatternLines.defaultProps = {
    spacing: 5,
    rotation: 0,
    color: '#000000',
    background: '#ffffff',
    lineWidth: 2
};

export var patternLinesDef = function patternLinesDef(id) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return _extends({
        id: id,
        type: 'patternLines'
    }, options);
};