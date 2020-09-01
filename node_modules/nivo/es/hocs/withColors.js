/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import PropTypes from 'prop-types';
import compose from 'recompose/compose';
import setPropTypes from 'recompose/setPropTypes';
import defaultProps from 'recompose/defaultProps';
import withPropsOnChange from 'recompose/withPropsOnChange';
import { getColorsGenerator } from '../lib/colors';

/**
 * This HOC watch colors related props change
 * and returns the corresponding color generator function.
 * Using it prevent from having a new ref each time
 * we pass through the component, useful for shallow comparison.
 */
export default (function () {
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

    return compose(defaultProps((_defaultProps = {}, _defaultProps[colorsKey] = defaultColors, _defaultProps[colorByKey] = defaultColorBy, _defaultProps)), setPropTypes((_setPropTypes = {}, _setPropTypes[colorsKey] = PropTypes.any.isRequired, _setPropTypes[colorByKey] = PropTypes.oneOfType([PropTypes.string, PropTypes.func]), _setPropTypes)), withPropsOnChange([colorsKey, colorByKey], function (props) {
        var _ref2;

        return _ref2 = {}, _ref2[destKey] = getColorsGenerator(props[colorsKey], props[colorByKey]), _ref2;
    }));
});