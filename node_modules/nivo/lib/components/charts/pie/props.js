'use strict';

exports.__esModule = true;
exports.PieDefaultProps = exports.PiePropTypes = undefined;

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var PiePropTypes = exports.PiePropTypes = {
    data: _propTypes2.default.arrayOf(_propTypes2.default.shape({
        id: _propTypes2.default.string.isRequired,
        value: _propTypes2.default.number.isRequired
    })).isRequired,

    sortByValue: _propTypes2.default.bool.isRequired,
    innerRadius: _propTypes2.default.number.isRequired,
    padAngle: _propTypes2.default.number.isRequired,
    cornerRadius: _propTypes2.default.number.isRequired,

    // border
    borderWidth: _propTypes2.default.number.isRequired,
    borderColor: _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.func]),

    // radial labels
    enableRadialLabels: _propTypes2.default.bool.isRequired,
    radialLabel: _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.func]),
    radialLabelsSkipAngle: _propTypes2.default.number,
    radialLabelsTextXOffset: _propTypes2.default.number,
    radialLabelsTextColor: _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.func]),
    radialLabelsLinkOffset: _propTypes2.default.number,
    radialLabelsLinkDiagonalLength: _propTypes2.default.number,
    radialLabelsLinkHorizontalLength: _propTypes2.default.number,
    radialLabelsLinkStrokeWidth: _propTypes2.default.number,
    radialLabelsLinkColor: _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.func]),

    // slices labels
    enableSlicesLabels: _propTypes2.default.bool.isRequired,
    sliceLabel: _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.func]),
    slicesLabelsSkipAngle: _propTypes2.default.number,
    slicesLabelsTextColor: _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.func]),

    // styling
    defs: _propTypes2.default.arrayOf(_propTypes2.default.shape({
        id: _propTypes2.default.string.isRequired
    })).isRequired,
    fill: _propTypes2.default.arrayOf(_propTypes2.default.shape({
        id: _propTypes2.default.string,
        match: _propTypes2.default.oneOfType([_propTypes2.default.oneOf(['*']), _propTypes2.default.object, _propTypes2.default.func]).isRequired
    })).isRequired,

    // interactivity
    isInteractive: _propTypes2.default.bool,
    tooltipFormat: _propTypes2.default.oneOfType([_propTypes2.default.func, _propTypes2.default.string])
}; /*
    * This file is part of the nivo project.
    *
    * Copyright 2016-present, Raphaël Benitte.
    *
    * For the full copyright and license information, please view the LICENSE
    * file that was distributed with this source code.
    */
var PieDefaultProps = exports.PieDefaultProps = {
    sortByValue: false,
    innerRadius: 0,
    padAngle: 0,
    cornerRadius: 0,

    // border
    borderWidth: 0,
    borderColor: 'inherit:darker(1)',

    // radial labels
    enableRadialLabels: true,
    radialLabel: 'id',
    radialLabelsTextColor: 'theme',
    radialLabelsLinkColor: 'theme',

    // slices labels
    enableSlicesLabels: true,
    sliceLabel: 'value',
    slicesLabelsTextColor: 'theme',

    // styling
    defs: [],
    fill: [],

    // interactivity
    isInteractive: true
};