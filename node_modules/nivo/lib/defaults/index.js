'use strict';

exports.__esModule = true;
exports.defaultMargin = exports.defaultColorRange = exports.defaultCategoricalColors = exports.defaultMotionDamping = exports.defaultMotionStiffness = exports.defaultAnimate = undefined;

var _theme = require('./theme');

Object.keys(_theme).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _theme[key];
    }
  });
});

var _d3Scale = require('d3-scale');

var _d3ScaleChromatic = require('d3-scale-chromatic');

var _colors = require('../lib/colors');

// motion
var defaultAnimate = exports.defaultAnimate = true; /*
                                                     * This file is part of the nivo project.
                                                     *
                                                     * Copyright 2016-present, Raphaël Benitte.
                                                     *
                                                     * For the full copyright and license information, please view the LICENSE
                                                     * file that was distributed with this source code.
                                                     */
var defaultMotionStiffness = exports.defaultMotionStiffness = 90;
var defaultMotionDamping = exports.defaultMotionDamping = 13;

// colors
var defaultCategoricalColors = exports.defaultCategoricalColors = _colors.nivoCategoricalColors;
var defaultColorRange = exports.defaultColorRange = (0, _d3Scale.scaleOrdinal)(_d3ScaleChromatic.schemeSet3);

// margin
var defaultMargin = exports.defaultMargin = {
  top: 0,
  right: 0,
  bottom: 0,
  left: 0

  // theming
};