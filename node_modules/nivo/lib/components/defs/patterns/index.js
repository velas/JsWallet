'use strict';

exports.__esModule = true;
exports.patternTypes = undefined;

var _PatternDots = require('./PatternDots');

Object.keys(_PatternDots).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _PatternDots[key];
    }
  });
});

var _PatternLines = require('./PatternLines');

Object.keys(_PatternLines).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _PatternLines[key];
    }
  });
});

var _PatternSquares = require('./PatternSquares');

Object.keys(_PatternSquares).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _PatternSquares[key];
    }
  });
});
var patternTypes = exports.patternTypes = {
  patternDots: _PatternDots.PatternDots,
  patternLines: _PatternLines.PatternLines,
  patternSquares: _PatternSquares.PatternSquares
}; /*
    * This file is part of the nivo project.
    *
    * Copyright 2016-present, Raphaël Benitte.
    *
    * For the full copyright and license information, please view the LICENSE
    * file that was distributed with this source code.
    */