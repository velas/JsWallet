/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import { scaleBand } from 'd3-scale';

/**
 * Generates indexed scale.
 *
 * @param {Array.<Object>} data
 * @param {Function}       getIndex
 * @param {Array.<number>} range
 * @param {number}         padding
 * @returns {Function}
 */
export var getIndexedScale = function getIndexedScale(data, getIndex, range, padding) {
  return scaleBand().rangeRound(range).domain(data.map(getIndex)).padding(padding);
};