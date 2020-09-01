'use strict';

exports.__esModule = true;

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _reactMotion = require('react-motion');

var _d3Interpolate = require('d3-interpolate');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _objectWithoutProperties(obj, keys) { var target = {}; for (var i in obj) { if (keys.indexOf(i) >= 0) continue; if (!Object.prototype.hasOwnProperty.call(obj, i)) continue; target[i] = obj[i]; } return target; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; } /*
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                * This file is part of the nivo project.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                *
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                * Copyright 2016-present, Raphaël Benitte.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                *
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                * For the full copyright and license information, please view the LICENSE
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                * file that was distributed with this source code.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                */

// credit to Tanner Linsey from this issue on react motion repository:
// https://github.com/chenglou/react-motion/issues/153

var enhancedSpring = function enhancedSpring(value, config) {
    if (typeof value !== 'number') {
        return {
            value: value,
            config: config,
            interpolator: config && config.interpolator ? config.interpolator : _d3Interpolate.interpolate
        };
    }
    return (0, _reactMotion.spring)(value, config);
};

var SmartMotion = function (_PureComponent) {
    _inherits(SmartMotion, _PureComponent);

    function SmartMotion() {
        var _temp, _this, _ret;

        _classCallCheck(this, SmartMotion);

        for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
            args[_key] = arguments[_key];
        }

        return _ret = (_temp = (_this = _possibleConstructorReturn(this, _PureComponent.call.apply(_PureComponent, [this].concat(args))), _this), _this.oldValues = {}, _this.newInters = {}, _this.currentStepValues = {}, _this.stepValues = {}, _this.stepInterpolators = {}, _temp), _possibleConstructorReturn(_this, _ret);
    }

    SmartMotion.prototype.render = function render() {
        var _this2 = this;

        var _props = this.props,
            style = _props.style,
            children = _props.children,
            rest = _objectWithoutProperties(_props, ['style', 'children']);

        var resolvedStyle = style(enhancedSpring);

        for (var key in resolvedStyle) {
            if (
            // If key is a non-numeric interpolation
            resolvedStyle[key] && resolvedStyle[key].interpolator) {
                // Make sure the steps start at 0
                this.currentStepValues[key] = this.currentStepValues[key] || 0;
                if (
                // And the value has changed
                typeof this.newInters[key] === 'undefined' || resolvedStyle[key].value !== this.newInters[key].value) {
                    // Save the new value
                    this.newInters[key] = resolvedStyle[key];

                    // Increment the stepInterValue for this key by 1
                    this.stepValues[key] = this.currentStepValues[key] + 1;

                    // Set up the new interpolator
                    this.stepInterpolators[key] = this.newInters[key].interpolator(this.oldValues[key], this.newInters[key].value);
                }
                // Return the spring with the destination stepValue and spring config
                resolvedStyle[key] = (0, _reactMotion.spring)(this.stepValues[key], this.newInters[key].config);
                // console.log(resolvedStyle[key])
            }
        }

        return _react2.default.createElement(
            _reactMotion.Motion,
            _extends({}, rest, { style: resolvedStyle }),
            function (values) {
                var newValues = {};
                for (var _key2 in values) {
                    if (_this2.stepValues[_key2]) {
                        // Save the currentStepValue
                        _this2.currentStepValues[_key2] = values[_key2];
                        // Figure the percentage
                        var percentage = _this2.currentStepValues[_key2] - _this2.stepValues[_key2] + 1;
                        // Save the current value and replace the value in the interpolated object
                        _this2.oldValues[_key2] = newValues[_key2] = _this2.stepInterpolators[_key2](percentage);
                    }
                }
                return children(_extends({}, values, newValues));
            }
        );
    };

    return SmartMotion;
}(_react.PureComponent);

exports.default = SmartMotion;