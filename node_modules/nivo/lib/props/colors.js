'use strict';

exports.__esModule = true;
exports.quantizeColorScalePropType = undefined;

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _colors = require('../lib/colors');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
var quantizeColorScalePropType = exports.quantizeColorScalePropType = _propTypes2.default.oneOfType([_propTypes2.default.oneOf(_colors.quantizeColorScalesKeys), _propTypes2.default.func, _propTypes2.default.arrayOf(_propTypes2.default.string)]);