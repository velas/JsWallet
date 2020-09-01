var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

function _objectWithoutProperties(obj, keys) { var target = {}; for (var i in obj) { if (keys.indexOf(i) >= 0) continue; if (!Object.prototype.hasOwnProperty.call(obj, i)) continue; target[i] = obj[i]; } return target; }

/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import React from 'react';
import PropTypes from 'prop-types';
import pure from 'recompose/pure';
import { gradientTypes } from './gradients';
import { patternTypes } from './patterns';

export var defsMapping = _extends({}, gradientTypes, patternTypes);

var Defs = pure(function (_ref) {
    var definitions = _ref.defs;

    if (!definitions || definitions.length < 1) return null;

    return React.createElement(
        'defs',
        null,
        definitions.map(function (_ref2) {
            var type = _ref2.type,
                def = _objectWithoutProperties(_ref2, ['type']);

            if (defsMapping[type]) return React.createElement(defsMapping[type], _extends({ key: def.id }, def));

            return null;
        })
    );
});

export { Defs };
Defs.propTypes = {
    defs: PropTypes.arrayOf(PropTypes.shape({
        type: PropTypes.oneOf(Object.keys(defsMapping)).isRequired,
        id: PropTypes.string.isRequired
    }))
};