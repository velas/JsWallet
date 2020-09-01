/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

export * from './detect';

export var getRelativeCursor = function getRelativeCursor(el, event) {
  var pageX = event.pageX,
      pageY = event.pageY;

  var bounds = el.getBoundingClientRect();

  return [pageX - bounds.left, pageY - bounds.top];
};