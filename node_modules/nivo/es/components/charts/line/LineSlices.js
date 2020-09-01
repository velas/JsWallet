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
import LineSlicesItem from './LineSlicesItem';

var LineSlices = function LineSlices(_ref) {
    var slices = _ref.slices,
        height = _ref.height,
        showTooltip = _ref.showTooltip,
        hideTooltip = _ref.hideTooltip,
        theme = _ref.theme,
        tooltipFormat = _ref.tooltipFormat;
    return React.createElement(
        'g',
        null,
        slices.map(function (slice) {
            return React.createElement(LineSlicesItem, {
                key: slice.id,
                slice: slice,
                height: height,
                showTooltip: showTooltip,
                hideTooltip: hideTooltip,
                theme: theme,
                tooltipFormat: tooltipFormat
            });
        })
    );
};

LineSlices.propTypes = {
    slices: PropTypes.arrayOf(PropTypes.shape({
        id: PropTypes.string.isRequired,
        x: PropTypes.number.isRequired,
        points: PropTypes.arrayOf(PropTypes.shape({
            id: PropTypes.oneOfType([PropTypes.number, PropTypes.string]).isRequired,
            value: PropTypes.oneOfType([PropTypes.number, PropTypes.string]),
            color: PropTypes.string.isRequired
        })).isRequired
    })).isRequired,
    height: PropTypes.number.isRequired,
    showTooltip: PropTypes.func.isRequired,
    hideTooltip: PropTypes.func.isRequired,
    theme: PropTypes.object.isRequired
};

export default pure(LineSlices);