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

export var LinearGradient = function LinearGradient(_ref) {
    var id = _ref.id,
        colors = _ref.colors;
    return React.createElement(
        'linearGradient',
        { id: id, x1: 0, x2: 0, y1: 0, y2: 1 },
        colors.map(function (_ref2) {
            var offset = _ref2.offset,
                color = _ref2.color,
                opacity = _ref2.opacity;
            return React.createElement('stop', {
                key: offset,
                offset: offset + '%',
                stopColor: color,
                stopOpacity: opacity !== undefined ? opacity : 1
            });
        })
    );
};

LinearGradient.propTypes = {
    id: PropTypes.string.isRequired,
    colors: PropTypes.arrayOf(PropTypes.shape({
        offset: PropTypes.number.isRequired,
        color: PropTypes.string.isRequired
    })).isRequired
};

export var linearGradientDef = function linearGradientDef(id, colors) {
    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
    return _extends({
        id: id,
        type: 'linearGradient',
        colors: colors
    }, options);
};