'use strict';

exports.__esModule = true;
exports.treeMapTileFromProp = exports.treeMapTilePropType = exports.treeMapTilePropKeys = exports.treeMapTilePropMapping = undefined;

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _d3Hierarchy = require('d3-hierarchy');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
var treeMapTilePropMapping = exports.treeMapTilePropMapping = {
    binary: _d3Hierarchy.treemapBinary,
    dice: _d3Hierarchy.treemapDice,
    slice: _d3Hierarchy.treemapSlice,
    sliceDice: _d3Hierarchy.treemapSliceDice,
    squarify: _d3Hierarchy.treemapSquarify,
    resquarify: _d3Hierarchy.treemapResquarify
};

var treeMapTilePropKeys = exports.treeMapTilePropKeys = Object.keys(treeMapTilePropMapping);

var treeMapTilePropType = exports.treeMapTilePropType = _propTypes2.default.oneOf(treeMapTilePropKeys);

var treeMapTileFromProp = exports.treeMapTileFromProp = function treeMapTileFromProp(prop) {
    return treeMapTilePropMapping[prop];
};