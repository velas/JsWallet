'use strict';

exports.__esModule = true;

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _compose = require('recompose/compose');

var _compose2 = _interopRequireDefault(_compose);

var _setPropTypes2 = require('recompose/setPropTypes');

var _setPropTypes3 = _interopRequireDefault(_setPropTypes2);

var _defaultProps2 = require('recompose/defaultProps');

var _defaultProps3 = _interopRequireDefault(_defaultProps2);

var _withPropsOnChange = require('recompose/withPropsOnChange');

var _withPropsOnChange2 = _interopRequireDefault(_withPropsOnChange);

var _colors = require('../lib/colors');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * This HOC watch colors related props change
 * and returns the corresponding color generator function.
 * Using it prevent from having a new ref each time
 * we pass through the component, useful for shallow comparison.
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
    var _defaultProps, _setPropTypes;

    var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {},
        _ref$colorsKey = _ref.colorsKey,
        colorsKey = _ref$colorsKey === undefined ? 'colors' : _ref$colorsKey,
        _ref$colorByKey = _ref.colorByKey,
        colorByKey = _ref$colorByKey === undefined ? 'colorBy' : _ref$colorByKey,
        _ref$destKey = _ref.destKey,
        destKey = _ref$destKey === undefined ? 'getColor' : _ref$destKey,
        _ref$defaultColors = _ref.defaultColors,
        defaultColors = _ref$defaultColors === undefined ? 'nivo' : _ref$defaultColors,
        _ref$defaultColorBy = _ref.defaultColorBy,
        defaultColorBy = _ref$defaultColorBy === undefined ? 'id' : _ref$defaultColorBy;

    return (0, _compose2.default)((0, _defaultProps3.default)((_defaultProps = {}, _defaultProps[colorsKey] = defaultColors, _defaultProps[colorByKey] = defaultColorBy, _defaultProps)), (0, _setPropTypes3.default)((_setPropTypes = {}, _setPropTypes[colorsKey] = _propTypes2.default.any.isRequired, _setPropTypes[colorByKey] = _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.func]), _setPropTypes)), (0, _withPropsOnChange2.default)([colorsKey, colorByKey], function (props) {
        var _ref2;

        return _ref2 = {}, _ref2[destKey] = (0, _colors.getColorsGenerator)(props[colorsKey], props[colorByKey]), _ref2;
    }));
};