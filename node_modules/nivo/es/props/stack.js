/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import PropTypes from 'prop-types';
import {
// order
stackOrderAscending, stackOrderDescending, stackOrderInsideOut, stackOrderNone, stackOrderReverse,
// offset
stackOffsetExpand, stackOffsetDiverging, stackOffsetNone, stackOffsetSilhouette, stackOffsetWiggle } from 'd3-shape';

export var stackOrderPropMapping = {
    ascending: stackOrderAscending,
    descending: stackOrderDescending,
    insideOut: stackOrderInsideOut,
    none: stackOrderNone,
    reverse: stackOrderReverse
};

export var stackOrderPropKeys = Object.keys(stackOrderPropMapping);

export var stackOrderPropType = PropTypes.oneOf(stackOrderPropKeys);

export var stackOrderFromProp = function stackOrderFromProp(prop) {
    return stackOrderPropMapping[prop];
};

export var stackOffsetPropMapping = {
    expand: stackOffsetExpand,
    diverging: stackOffsetDiverging,
    none: stackOffsetNone,
    silhouette: stackOffsetSilhouette,
    wiggle: stackOffsetWiggle
};

export var stackOffsetPropKeys = Object.keys(stackOffsetPropMapping);

export var stackOffsetPropType = PropTypes.oneOf(stackOffsetPropKeys);

export var stackOffsetFromProp = function stackOffsetFromProp(prop) {
    return stackOffsetPropMapping[prop];
};