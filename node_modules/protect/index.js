'use strict';
/**
 * @file protect main
 * @module protect
 * @version 0.4.0
 * @author hex7c0 <hex7c0@gmail.com>
 * @copyright hex7c0 2014
 * @license GPLv3
 */

/*
 * functions
 */
/**
 * protect your baby :o
 * 
 * @function protect
 * @param {Object} obj - your object
 * @param {Boolean} [normal] - normal constructor
 * @return {Object}
 */
function protect(obj, normal) {

  var next;
  if (!normal) {
    next = Object.create(null);
  } else {
    next = {};
  }

  var keys = Object.keys(obj);
  for (var i = 0, ii = keys.length; i < ii; ++i) { // add static value
    var key = keys[i];
    Object.defineProperty(next, key, {
      configurable: false,
      enumerable: true,
      value: obj[key]
    });
  }

  return next;
}
module.exports = protect;
