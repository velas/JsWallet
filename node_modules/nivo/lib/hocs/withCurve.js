'use strict';

exports.__esModule = true;

var _withProps = require('recompose/withProps');

var _withProps2 = _interopRequireDefault(_withProps);

var _props = require('../props');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * This HOC transform d3 curve interpolation identifier
 * to its corresponding interpolator.
 */
/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
exports.default = function () {
  var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {},
      _ref$srcKey = _ref.srcKey,
      srcKey = _ref$srcKey === undefined ? 'curve' : _ref$srcKey,
      _ref$destKey = _ref.destKey,
      destKey = _ref$destKey === undefined ? 'curveInterpolator' : _ref$destKey;

  return (0, _withProps2.default)(function (props) {
    var _ref2;

    return _ref2 = {}, _ref2[destKey] = (0, _props.curveFromProp)(props[srcKey]), _ref2;
  });
};