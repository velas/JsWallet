'use strict';

exports.__esModule = true;
exports.gradientTypes = undefined;

var _LinearGradient = require('./LinearGradient');

Object.keys(_LinearGradient).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _LinearGradient[key];
    }
  });
});
var gradientTypes = exports.gradientTypes = {
  linearGradient: _LinearGradient.LinearGradient
}; /*
    * This file is part of the nivo project.
    *
    * Copyright 2016-present, Raphaël Benitte.
    *
    * For the full copyright and license information, please view the LICENSE
    * file that was distributed with this source code.
    */