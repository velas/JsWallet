'use strict';

exports.__esModule = true;
exports.Defs = exports.defsMapping = undefined;

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; }; /*
                                                                                                                                                                                                                                                                   * This file is part of the nivo project.
                                                                                                                                                                                                                                                                   *
                                                                                                                                                                                                                                                                   * Copyright 2016-present, Raphaël Benitte.
                                                                                                                                                                                                                                                                   *
                                                                                                                                                                                                                                                                   * For the full copyright and license information, please view the LICENSE
                                                                                                                                                                                                                                                                   * file that was distributed with this source code.
                                                                                                                                                                                                                                                                   */


var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _pure = require('recompose/pure');

var _pure2 = _interopRequireDefault(_pure);

var _gradients = require('./gradients');

var _patterns = require('./patterns');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _objectWithoutProperties(obj, keys) { var target = {}; for (var i in obj) { if (keys.indexOf(i) >= 0) continue; if (!Object.prototype.hasOwnProperty.call(obj, i)) continue; target[i] = obj[i]; } return target; }

var defsMapping = exports.defsMapping = _extends({}, _gradients.gradientTypes, _patterns.patternTypes);

var Defs = (0, _pure2.default)(function (_ref) {
    var definitions = _ref.defs;

    if (!definitions || definitions.length < 1) return null;

    return _react2.default.createElement(
        'defs',
        null,
        definitions.map(function (_ref2) {
            var type = _ref2.type,
                def = _objectWithoutProperties(_ref2, ['type']);

            if (defsMapping[type]) return _react2.default.createElement(defsMapping[type], _extends({ key: def.id }, def));

            return null;
        })
    );
});

exports.Defs = Defs;
Defs.propTypes = {
    defs: _propTypes2.default.arrayOf(_propTypes2.default.shape({
        type: _propTypes2.default.oneOf(Object.keys(defsMapping)).isRequired,
        id: _propTypes2.default.string.isRequired
    }))
};