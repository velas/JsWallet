var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

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

var tableStyle = {
    width: '100%',
    borderCollapse: 'collapse'
};

var TableTooltip = function TableTooltip(_ref) {
    var title = _ref.title,
        rows = _ref.rows,
        theme = _ref.theme;

    if (!rows.length) return null;

    return React.createElement(
        'div',
        { style: theme.tooltip.container },
        title && title,
        React.createElement(
            'table',
            { style: _extends({}, tableStyle, theme.tooltip.table) },
            React.createElement(
                'tbody',
                null,
                rows.map(function (row, i) {
                    return React.createElement(
                        'tr',
                        { key: i },
                        row.map(function (column, j) {
                            return React.createElement(
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
    title: PropTypes.node,
    rows: PropTypes.arrayOf(PropTypes.arrayOf(PropTypes.node)).isRequired,
    theme: PropTypes.shape({
        tooltip: PropTypes.shape({
            container: PropTypes.object.isRequired,
            table: PropTypes.object.isRequired,
            tableCell: PropTypes.object.isRequired
        }).isRequired
    }).isRequired
};

TableTooltip.defaultProps = {};

export default pure(TableTooltip);