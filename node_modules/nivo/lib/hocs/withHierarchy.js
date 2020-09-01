'use strict';

exports.__esModule = true;

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _compose = require('recompose/compose');

var _compose2 = _interopRequireDefault(_compose);

var _defaultProps2 = require('recompose/defaultProps');

var _defaultProps3 = _interopRequireDefault(_defaultProps2);

var _setPropTypes2 = require('recompose/setPropTypes');

var _setPropTypes3 = _interopRequireDefault(_setPropTypes2);

var _withPropsOnChange = require('recompose/withPropsOnChange');

var _withPropsOnChange2 = _interopRequireDefault(_withPropsOnChange);

var _d3Hierarchy = require('d3-hierarchy');

var _propertiesConverters = require('../lib/propertiesConverters');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

/**
 * This HOC watch hierarchical data props change
 * and returns the corresponding summed hierarchy.
 * Using it prevent from having a new ref each time
 * we pass through the component, useful for shallow comparison.
 */
exports.default = function () {
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

    return (0, _compose2.default)((0, _defaultProps3.default)((_defaultProps = {}, _defaultProps[valueKey] = valueDefault, _defaultProps)), (0, _setPropTypes3.default)((_setPropTypes = {}, _setPropTypes[srcKey] = _propTypes2.default.object.isRequired, _setPropTypes[valueKey] = _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.func]).isRequired, _setPropTypes)), (0, _withPropsOnChange2.default)([srcKey, valueKey], function (props) {
        var _ref2;

        return _ref2 = {}, _ref2[destKey] = (0, _d3Hierarchy.hierarchy)(props[srcKey]).sum((0, _propertiesConverters.getAccessorFor)(props[valueKey])), _ref2;
    }));
}; /*
    * This file is part of the nivo project.
    *
    * Copyright 2016-present, Raphaël Benitte.
    *
    * For the full copyright and license information, please view the LICENSE
    * file that was distributed with this source code.
    */