'use strict';

exports.__esModule = true;
exports.curveFromProp = exports.lineCurvePropType = exports.lineCurvePropKeys = exports.areaCurvePropType = exports.areaCurvePropKeys = exports.closedCurvePropType = exports.closedCurvePropKeys = exports.curvePropType = exports.curvePropKeys = exports.curvePropMapping = undefined;

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _without = require('lodash/without');

var _without2 = _interopRequireDefault(_without);

var _d3Shape = require('d3-shape');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var curvePropMapping = exports.curvePropMapping = {
    basis: _d3Shape.curveBasis,
    basisClosed: _d3Shape.curveBasisClosed,
    basisOpen: _d3Shape.curveBasisOpen,
    bundle: _d3Shape.curveBundle,
    cardinal: _d3Shape.curveCardinal,
    cardinalClosed: _d3Shape.curveCardinalClosed,
    cardinalOpen: _d3Shape.curveCardinalOpen,
    catmullRom: _d3Shape.curveCatmullRom,
    catmullRomClosed: _d3Shape.curveCatmullRomClosed,
    catmullRomOpen: _d3Shape.curveCatmullRomOpen,
    linear: _d3Shape.curveLinear,
    linearClosed: _d3Shape.curveLinearClosed,
    monotoneX: _d3Shape.curveMonotoneX,
    monotoneY: _d3Shape.curveMonotoneY,
    natural: _d3Shape.curveNatural,
    step: _d3Shape.curveStep,
    stepAfter: _d3Shape.curveStepAfter,
    stepBefore: _d3Shape.curveStepBefore
}; /*
    * This file is part of the nivo project.
    *
    * Copyright 2016-present, Raphaël Benitte.
    *
    * For the full copyright and license information, please view the LICENSE
    * file that was distributed with this source code.
    */
var curvePropKeys = exports.curvePropKeys = Object.keys(curvePropMapping);

var curvePropType = exports.curvePropType = _propTypes2.default.oneOf(curvePropKeys);

var closedCurvePropKeys = exports.closedCurvePropKeys = curvePropKeys.filter(function (c) {
    return c.endsWith('Closed');
});

var closedCurvePropType = exports.closedCurvePropType = _propTypes2.default.oneOf(closedCurvePropKeys);

// Safe curves to be used with d3 area shape generator
var areaCurvePropKeys = exports.areaCurvePropKeys = (0, _without2.default)(curvePropKeys, 'bundle', 'basisClosed', 'basisOpen', 'cardinalClosed', 'cardinalOpen', 'catmullRomClosed', 'catmullRomOpen', 'linearClosed');

var areaCurvePropType = exports.areaCurvePropType = _propTypes2.default.oneOf(areaCurvePropKeys);

// Safe curves to be used with d3 line shape generator
var lineCurvePropKeys = exports.lineCurvePropKeys = (0, _without2.default)(curvePropKeys, 'bundle', 'basisClosed', 'basisOpen', 'cardinalClosed', 'cardinalOpen', 'catmullRomClosed', 'catmullRomOpen', 'linearClosed');

var lineCurvePropType = exports.lineCurvePropType = _propTypes2.default.oneOf(lineCurvePropKeys);

/**
 * Returns curve interpolator from given identifier.
 *
 * @param {string} id - Curve interpolator identifier
 * @return {Function}
 */
var curveFromProp = exports.curveFromProp = function curveFromProp(id) {
    var curveInterpolator = curvePropMapping[id];
    if (!curveInterpolator) {
        throw new TypeError('\'' + id + '\', is not a valid curve interpolator identifier.');
    }

    return curvePropMapping[id];
};