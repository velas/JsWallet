'use strict';

exports.__esModule = true;
exports.stackOffsetFromProp = exports.stackOffsetPropType = exports.stackOffsetPropKeys = exports.stackOffsetPropMapping = exports.stackOrderFromProp = exports.stackOrderPropType = exports.stackOrderPropKeys = exports.stackOrderPropMapping = undefined;

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _d3Shape = require('d3-shape');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
var stackOrderPropMapping = exports.stackOrderPropMapping = {
    ascending: _d3Shape.stackOrderAscending,
    descending: _d3Shape.stackOrderDescending,
    insideOut: _d3Shape.stackOrderInsideOut,
    none: _d3Shape.stackOrderNone,
    reverse: _d3Shape.stackOrderReverse
};

var stackOrderPropKeys = exports.stackOrderPropKeys = Object.keys(stackOrderPropMapping);

var stackOrderPropType = exports.stackOrderPropType = _propTypes2.default.oneOf(stackOrderPropKeys);

var stackOrderFromProp = exports.stackOrderFromProp = function stackOrderFromProp(prop) {
    return stackOrderPropMapping[prop];
};

var stackOffsetPropMapping = exports.stackOffsetPropMapping = {
    expand: _d3Shape.stackOffsetExpand,
    diverging: _d3Shape.stackOffsetDiverging,
    none: _d3Shape.stackOffsetNone,
    silhouette: _d3Shape.stackOffsetSilhouette,
    wiggle: _d3Shape.stackOffsetWiggle
};

var stackOffsetPropKeys = exports.stackOffsetPropKeys = Object.keys(stackOffsetPropMapping);

var stackOffsetPropType = exports.stackOffsetPropType = _propTypes2.default.oneOf(stackOffsetPropKeys);

var stackOffsetFromProp = exports.stackOffsetFromProp = function stackOffsetFromProp(prop) {
    return stackOffsetPropMapping[prop];
};