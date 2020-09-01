'use strict';

exports.__esModule = true;

var _detect = require('./detect');

Object.keys(_detect).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _detect[key];
    }
  });
});
var getRelativeCursor = exports.getRelativeCursor = function getRelativeCursor(el, event) {
  var pageX = event.pageX,
      pageY = event.pageY;

  var bounds = el.getBoundingClientRect();

  return [pageX - bounds.left, pageY - bounds.top];
}; /*
    * This file is part of the nivo project.
    *
    * Copyright 2016-present, Raphaël Benitte.
    *
    * For the full copyright and license information, please view the LICENSE
    * file that was distributed with this source code.
    */