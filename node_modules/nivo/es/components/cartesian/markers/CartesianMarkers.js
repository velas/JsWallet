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
import CartesianMarkersItem from './CartesianMarkersItem';

var CartesianMarkers = function CartesianMarkers(_ref) {
    var markers = _ref.markers,
        width = _ref.width,
        height = _ref.height,
        xScale = _ref.xScale,
        yScale = _ref.yScale,
        theme = _ref.theme;

    if (!markers || markers.length === 0) return null;

    return React.createElement(
        'g',
        null,
        markers.map(function (marker, i) {
            return React.createElement(CartesianMarkersItem, _extends({
                key: i
            }, marker, {
                width: width,
                height: height,
                scale: marker.axis === 'y' ? yScale : xScale,
                theme: theme
            }));
        })
    );
};

CartesianMarkers.propTypes = {
    width: PropTypes.number.isRequired,
    height: PropTypes.number.isRequired,

    xScale: PropTypes.func.isRequired,
    yScale: PropTypes.func.isRequired,

    theme: PropTypes.shape({
        markers: PropTypes.shape({
            lineColor: PropTypes.string.isRequired,
            lineStrokeWidth: PropTypes.number.isRequired,
            textColor: PropTypes.string.isRequired,
            fontSize: PropTypes.oneOfType([PropTypes.number, PropTypes.string]).isRequired
        }).isRequired
    }).isRequired,

    markers: PropTypes.arrayOf(PropTypes.shape({
        axis: PropTypes.oneOf(['x', 'y']).isRequired,
        value: PropTypes.oneOfType([PropTypes.number, PropTypes.string]).isRequired,
        style: PropTypes.object
    }))
};

export default pure(CartesianMarkers);