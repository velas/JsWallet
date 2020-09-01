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

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var tableStyle = {
    width: '100%',
    borderCollapse: 'collapse'
};

var TableTooltip = function TableTooltip(_ref) {
    var title = _ref.title,
        rows = _ref.rows,
        theme = _ref.theme;

    if (!rows.length) return null;

    return _react2.default.createElement(
        'div',
        { style: theme.tooltip.container },
        title && title,
        _react2.default.createElement(
            'table',
            { style: _extends({}, tableStyle, theme.tooltip.table) },
            _react2.default.createElement(
                'tbody',
                null,
                rows.map(function (row, i) {
                    return _react2.default.createElement(
                        'tr',
                        { key: i },
                        row.map(function (column, j) {
                            return _react2.default.createElement(
                                'td',
                                { key: j, style: theme.tooltip.tableCell },
                                column
                            );
                        })
                    );
                })
            )
        )
    );
};

TableTooltip.propTypes = {
    title: _propTypes2.default.node,
    rows: _propTypes2.default.arrayOf(_propTypes2.default.arrayOf(_propTypes2.default.node)).isRequired,
    theme: _propTypes2.default.shape({
        tooltip: _propTypes2.default.shape({
            container: _propTypes2.default.object.isRequired,
            table: _propTypes2.default.object.isRequired,
            tableCell: _propTypes2.default.object.isRequired
        }).isRequired
    }).isRequired
};

TableTooltip.defaultProps = {};

exports.default = (0, _pure2.default)(TableTooltip);