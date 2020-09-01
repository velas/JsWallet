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

export var PatternDots = pure(function (_ref) {
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

    return React.createElement(
        'pattern',
        { id: id, width: fullSize, height: fullSize, patternUnits: 'userSpaceOnUse' },
        React.createElement('rect', { width: fullSize, height: fullSize, fill: background }),
        React.createElement('circle', { cx: halfPadding + radius, cy: halfPadding + radius, r: radius, fill: color }),
        stagger && React.createElement('circle', {
            cx: padding * 1.5 + size + radius,
            cy: padding * 1.5 + size + radius,
            r: radius,
            fill: color
        })
    );
});

PatternDots.propTypes = {
    id: PropTypes.string.isRequired,
    color: PropTypes.string.isRequired,
    background: PropTypes.string.isRequired,
    size: PropTypes.number.isRequired,
    padding: PropTypes.number.isRequired,
    stagger: PropTypes.bool.isRequired
};

PatternDots.defaultProps = {
    color: '#000000',
    background: '#ffffff',
    size: 4,
    padding: 4,
    stagger: false
};

export var patternDotsDef = function patternDotsDef(id) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
    return _extends({
        id: id,
        type: 'patternDots'
    }, options);
};