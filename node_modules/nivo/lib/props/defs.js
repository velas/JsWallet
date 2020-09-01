'use strict';

exports.__esModule = true;
exports.defsPropTypes = undefined;

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var defsPropTypes = exports.defsPropTypes = {
    defs: _propTypes2.default.arrayOf(_propTypes2.default.shape({
        id: _propTypes2.default.string.isRequired
    })).isRequired,
    fill: _propTypes2.default.arrayOf(_propTypes2.default.shape({
        id: _propTypes2.default.string,
        match: _propTypes2.default.oneOfType([_propTypes2.default.oneOf(['*']), _propTypes2.default.object, _propTypes2.default.func]).isRequired
    })).isRequired
}; /*
    * This file is part of the nivo project.
    *
    * Copyright 2016-present, Raphaël Benitte.
    *
    * For the full copyright and license information, please view the LICENSE
    * file that was distributed with this source code.
    */