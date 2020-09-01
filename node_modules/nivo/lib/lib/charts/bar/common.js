'use strict';

exports.__esModule = true;
exports.getIndexedScale = undefined;

var _d3Scale = require('d3-scale');

/**
 * Generates indexed scale.
 *
 * @param {Array.<Object>} data
 * @param {Function}       getIndex
 * @param {Array.<number>} range
 * @param {number}         padding
 * @returns {Function}
 */
var getIndexedScale = exports.getIndexedScale = function getIndexedScale(data, getIndex, range, padding) {
  return (0, _d3Scale.scaleBand)().rangeRound(range).domain(data.map(getIndex)).padding(padding);
}; /*
    * This file is part of the nivo project.
    *
    * Copyright 2016-present, Raphaël Benitte.
    *
    * For the full copyright and license information, please view the LICENSE
    * file that was distributed with this source code.
    */