'use strict';

exports.__esModule = true;
exports.computeAxisTicks = undefined;

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; }; /*
                                                                                                                                                                                                                                                                   * This file is part of the nivo project.
                                                                                                                                                                                                                                                                   *
                                                                                                                                                                                                                                                                   * Copyright 2016-present, Raphaël Benitte.
                                                                                                                                                                                                                                                                   *
                                                                                                                                                                                                                                                                   * For the full copyright and license information, please view the LICENSE
                                                                                                                                                                                                                                                                   * file that was distributed with this source code.
                                                                                                                                                                                                                                                                   */


var _bridge = require('./bridge');

var horizontalPositions = ['top', 'bottom'];
var verticalPositions = ['left', 'right'];

var centerScale = function centerScale(scale) {
    var bandwidth = scale.bandwidth();

    if (bandwidth === 0) return scale;

    var offset = bandwidth / 2;
    if (scale.round()) {
        offset = Math.round(offset);
    }

    return function (d) {
        return scale(d) + offset;
    };
};

/**
 * @typedef {Object} AxisTick
 * @param {number} x
 * @param {number} y
 * @param {number} lineX
 * @param {number} lineY
 * @param {number} textX
 * @param {number} textY
 */

/**
 * @param {number}                width
 * @param {number}                height
 * @param {string}                _position
 * @param {Function}              scale
 * @param {Array.<string|number>} [tickValues]
 * @param {number}                [tickCount]
 * @param {number}                [tickSize=5]
 * @param {number}                [tickPadding=5]
 * @param {number}                [tickRotation=0]
 * @parem {string}                [engine='svg']
 * @return {{ x: number, y: number, ticks: Array.<AxisTick>, textAlign: string, textBaseline: string }}
 */
var computeAxisTicks = exports.computeAxisTicks = function computeAxisTicks(_ref) {
    var width = _ref.width,
        height = _ref.height,
        _position = _ref.position,
        scale = _ref.scale,
        tickValues = _ref.tickValues,
        tickCount = _ref.tickCount,
        _ref$tickSize = _ref.tickSize,
        tickSize = _ref$tickSize === undefined ? 5 : _ref$tickSize,
        _ref$tickPadding = _ref.tickPadding,
        tickPadding = _ref$tickPadding === undefined ? 5 : _ref$tickPadding,
        _ref$tickRotation = _ref.tickRotation,
        tickRotation = _ref$tickRotation === undefined ? 0 : _ref$tickRotation,
        _ref$engine = _ref.engine,
        engine = _ref$engine === undefined ? 'svg' : _ref$engine;

    var values = void 0;
    if (tickValues) values = tickValues;else if (scale.ticks) values = scale.ticks(tickCount);else values = scale.domain();

    var textProps = _bridge.textPropsByEngine[engine];

    var orient = _position;
    var position = scale.bandwidth ? centerScale(scale) : scale;
    var line = { lineX: 0, lineY: 0 };
    var text = { textX: 0, textY: 0 };

    var x = 0;
    var y = 0;
    var translate = void 0;
    var textAlign = textProps.align.center;
    var textBaseline = textProps.baseline.center;

    if (horizontalPositions.includes(orient)) {
        translate = function translate(d) {
            return { x: position(d), y: 0 };
        };

        line.lineY = tickSize * (orient === 'bottom' ? 1 : -1);
        text.textY = (tickSize + tickPadding) * (orient === 'bottom' ? 1 : -1);

        if (orient === 'bottom') {
            y = height;
            textBaseline = textProps.baseline.top;
        } else {
            textBaseline = textProps.baseline.bottom;
        }

        if (tickRotation === 0) {
            textAlign = textProps.align.center;
        } else if (orient === 'bottom' && tickRotation < 0 || orient === 'top' && tickRotation > 0) {
            textAlign = textProps.align.right;
            textBaseline = textProps.baseline.center;
        } else if (orient === 'bottom' && tickRotation > 0 || orient === 'top' && tickRotation < 0) {
            textAlign = textProps.align.left;
            textBaseline = textProps.baseline.center;
        }
    } else if (verticalPositions.includes(orient)) {
        translate = function translate(d) {
            return { x: 0, y: position(d) };
        };

        line.lineX = tickSize * (orient === 'right' ? 1 : -1);
        text.textX = (tickSize + tickPadding) * (orient === 'right' ? 1 : -1);

        if (orient === 'right') {
            x = width;
            textAlign = textProps.align.left;
        } else {
            textAlign = textProps.align.right;
        }
    }

    var ticks = values.map(function (value) {
        return _extends({
            key: value,
            value: value
        }, translate(value), line, text);
    });

    return {
        x: x,
        y: y,
        ticks: ticks,
        textAlign: textAlign,
        textBaseline: textBaseline
    };
};