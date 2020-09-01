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
import defaultProps from 'recompose/defaultProps';
import setPropTypes from 'recompose/setPropTypes';
import withPropsOnChange from 'recompose/withPropsOnChange';
import { hierarchy } from 'd3-hierarchy';
import { getAccessorFor } from '../lib/propertiesConverters';

/**
 * This HOC watch hierarchical data props change
 * and returns the corresponding summed hierarchy.
 * Using it prevent from having a new ref each time
 * we pass through the component, useful for shallow comparison.
 */
export default (function () {
    var _defaultProps, _setPropTypes;

    var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {},
        _ref$srcKey = _ref.srcKey,
        srcKey = _ref$srcKey === undefined ? 'root' : _ref$srcKey,
        _ref$destKey = _ref.destKey,
        destKey = _ref$destKey === undefined ? 'root' : _ref$destKey,
        _ref$valueKey = _ref.valueKey,
        valueKey = _ref$valueKey === undefined ? 'value' : _ref$valueKey,
        _ref$valueDefault = _ref.valueDefault,
        valueDefault = _ref$valueDefault === undefined ? 'value' : _ref$valueDefault;

    return compose(defaultProps((_defaultProps = {}, _defaultProps[valueKey] = valueDefault, _defaultProps)), setPropTypes((_setPropTypes = {}, _setPropTypes[srcKey] = PropTypes.object.isRequired, _setPropTypes[valueKey] = PropTypes.oneOfType([PropTypes.string, PropTypes.func]).isRequired, _setPropTypes)), withPropsOnChange([srcKey, valueKey], function (props) {
        var _ref2;

        return _ref2 = {}, _ref2[destKey] = hierarchy(props[srcKey]).sum(getAccessorFor(props[valueKey])), _ref2;
    }));
});