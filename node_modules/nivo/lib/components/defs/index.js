'use strict';

exports.__esModule = true;

var _gradients = require('./gradients');

Object.keys(_gradients).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _gradients[key];
    }
  });
});

var _patterns = require('./patterns');

Object.keys(_patterns).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _patterns[key];
    }
  });
});

var _Defs = require('./Defs');

Object.keys(_Defs).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _Defs[key];
    }
  });
});