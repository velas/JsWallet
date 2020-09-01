'use strict';

exports.__esModule = true;
exports.getInterpolatedColor = exports.colorMotionSpring = undefined;

var _reactMotion = require('react-motion');

var _d3Color = require('d3-color');

/**
 * Decompose a color for use with react-motion.
 *
 * @param {string} _color
 * @param {Object} [_config]
 * @return {Object}
 */
/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
var colorMotionSpring = exports.colorMotionSpring = function colorMotionSpring(_color, _config) {
    var color = (0, _d3Color.rgb)(_color);

    if (!_config) return {
        colorR: color.r,
        colorG: color.g,
        colorB: color.b
    };

    var config = Object.assign({}, _config, { precision: 1 });

    return {
        colorR: (0, _reactMotion.spring)(color.r, config),
        colorG: (0, _reactMotion.spring)(color.g, config),
        colorB: (0, _reactMotion.spring)(color.b, config)
    };
};

/**
 * Re-assemble interpolated color components for easy use.
 *
 * @param {number} colorR
 * @param {number} colorG
 * @param {number} colorB
 * @return {string}
 */
var getInterpolatedColor = exports.getInterpolatedColor = function getInterpolatedColor(_ref) {
    var colorR = _ref.colorR,
        colorG = _ref.colorG,
        colorB = _ref.colorB;
    return 'rgb(' + Math.round(Math.max(colorR, 0)) + ',' + Math.round(Math.max(colorG, 0)) + ',' + Math.round(Math.max(colorB, 0)) + ')';
};