/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import PropTypes from 'prop-types';
import { treemapBinary, treemapDice, treemapSlice, treemapSliceDice, treemapSquarify, treemapResquarify } from 'd3-hierarchy';

export var treeMapTilePropMapping = {
    binary: treemapBinary,
    dice: treemapDice,
    slice: treemapSlice,
    sliceDice: treemapSliceDice,
    squarify: treemapSquarify,
    resquarify: treemapResquarify
};

export var treeMapTilePropKeys = Object.keys(treeMapTilePropMapping);

export var treeMapTilePropType = PropTypes.oneOf(treeMapTilePropKeys);

export var treeMapTileFromProp = function treeMapTileFromProp(prop) {
    return treeMapTilePropMapping[prop];
};