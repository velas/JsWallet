'use strict';

exports.__esModule = true;

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

var _CartesianMarkersItem = require('./CartesianMarkersItem');

var _CartesianMarkersItem2 = _interopRequireDefault(_CartesianMarkersItem);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var CartesianMarkers = function CartesianMarkers(_ref) {
    var markers = _ref.markers,
        width = _ref.width,
        height = _ref.height,
        xScale = _ref.xScale,
        yScale = _ref.yScale,
        theme = _ref.theme;

    if (!markers || markers.length === 0) return null;

    return _react2.default.createElement(
        'g',
        null,
        markers.map(function (marker, i) {
            return _react2.default.createElement(_CartesianMarkersItem2.default, _extends({
                key: i
            }, marker, {
                width: width,
                height: height,
                scale: marker.axis === 'y' ? yScale : xScale,
                theme: theme
            }));
        })
    );
};

CartesianMarkers.propTypes = {
    width: _propTypes2.default.number.isRequired,
    height: _propTypes2.default.number.isRequired,

    xScale: _propTypes2.default.func.isRequired,
    yScale: _propTypes2.default.func.isRequired,

    theme: _propTypes2.default.shape({
        markers: _propTypes2.default.shape({
            lineColor: _propTypes2.default.string.isRequired,
            lineStrokeWidth: _propTypes2.default.number.isRequired,
            textColor: _propTypes2.default.string.isRequired,
            fontSize: _propTypes2.default.oneOfType([_propTypes2.default.number, _propTypes2.default.string]).isRequired
        }).isRequired
    }).isRequired,

    markers: _propTypes2.default.arrayOf(_propTypes2.default.shape({
        axis: _propTypes2.default.oneOf(['x', 'y']).isRequired,
        value: _propTypes2.default.oneOfType([_propTypes2.default.number, _propTypes2.default.string]).isRequired,
        style: _propTypes2.default.object
    }))
};

exports.default = (0, _pure2.default)(CartesianMarkers);