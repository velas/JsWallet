'use strict';

exports.__esModule = true;

var _DotsItem = require('./DotsItem');

Object.defineProperty(exports, 'DotsItem', {
  enumerable: true,
  get: function get() {
    return _interopRequireDefault(_DotsItem).default;
  }
});
Object.keys(_DotsItem).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _DotsItem[key];
    }
  });
});

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }