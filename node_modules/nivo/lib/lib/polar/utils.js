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
var degreesToRadians = exports.degreesToRadians = function degreesToRadians(degrees) {
  return degrees * Math.PI / 180;
};

var radiansToDegrees = exports.radiansToDegrees = function radiansToDegrees(radians) {
  return 180 * radians / Math.PI;
};

var midAngle = exports.midAngle = function midAngle(arc) {
  return arc.startAngle + (arc.endAngle - arc.startAngle) / 2;
};

var positionFromAngle = exports.positionFromAngle = function positionFromAngle(angle, distance) {
  return {
    x: Math.cos(angle) * distance,
    y: Math.sin(angle) * distance
  };
};