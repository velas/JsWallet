"use strict";

exports.__esModule = true;
/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * Computes distance between two points.
 *
 * @param {number} x1
 * @param {number} y1
 * @param {number} x2
 * @param {number} y2
 * @return {number}
 */
var getDistance = exports.getDistance = function getDistance(x1, y1, x2, y2) {
  var deltaX = x2 - x1;
  var deltaY = y2 - y1;

  deltaX *= deltaX;
  deltaY *= deltaY;

  return Math.sqrt(deltaX + deltaY);
};

/**
 * Computes angle (radians) between two points.
 *
 * @param {number} x1
 * @param {number} y1
 * @param {number} x2
 * @param {number} y2
 * @return {number}
 */
var getAngle = exports.getAngle = function getAngle(x1, y1, x2, y2) {
  var angle = Math.atan2(y2 - y1, x2 - x1) - Math.PI / 2;

  return angle > 0 ? angle : Math.PI * 2 + angle;
};

/**
 * Check if cursor is in given rectangle.
 *
 * @param {number} x
 * @param {number} y
 * @param {number} width
 * @param {number} height
 * @param {number} cursorX
 * @param {number} cursorY
 * @return {boolean}
 */
var isCursorInRect = exports.isCursorInRect = function isCursorInRect(x, y, width, height, cursorX, cursorY) {
  return x <= cursorX && cursorX <= x + width && y <= cursorY && cursorY <= y + height;
};

/**
 * Check if cursor is in given ring.
 *
 * @param {number} centerX
 * @param {number} centerY
 * @param {number} radius
 * @param {number} innerRadius
 * @param {number} cursorX
 * @param {number} cursorY
 * @return {boolean}
 */
var isCursorInRing = exports.isCursorInRing = function isCursorInRing(centerX, centerY, radius, innerRadius, cursorX, cursorY) {
  var distance = getDistance(cursorX, cursorY, centerX, centerY);

  return distance < radius && distance > innerRadius;
};

/**
 * Search for an arc being under cursor.
 *
 * @param {number}         centerX
 * @param {number}         centerY
 * @param {number}         radius
 * @param {number}         innerRadius
 * @param {Array.<Object>} arcs
 * @param {number}         cursorX
 * @param {number}         cursorY
 * @return {*}
 */
var getHoveredArc = exports.getHoveredArc = function getHoveredArc(centerX, centerY, radius, innerRadius, arcs, cursorX, cursorY) {
  if (!isCursorInRing(centerX, centerY, radius, innerRadius, cursorX, cursorY)) return null;

  var cursorAngle = getAngle(cursorX, cursorY, centerX, centerY);

  return arcs.find(function (_ref) {
    var startAngle = _ref.startAngle,
        endAngle = _ref.endAngle;
    return cursorAngle >= startAngle && cursorAngle < endAngle;
  });
};