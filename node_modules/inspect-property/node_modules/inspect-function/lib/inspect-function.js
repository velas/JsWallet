#!/usr/bin/env node
'use strict';

const splitSkip = require('split-skip');
const unpackString = require('unpack-string');
const stringifyParameters = require('stringify-parameters');
const { inspectParameters, getParametersNamesFromInspection } = require('inspect-parameters-declaration');

/**
 * Inspects a function and returns information about it
 * @param  {Function|String} 	fn - Function to be inspected
 * @return {String}        		Returns the function's name
 */
function getNameFromSourceCode(fn) {
	let fnString = fn.constructor === String ? fn.replace(/(\r\n|\r|\n)/g, '') : fn.toString().replace(/(\r\n|\r|\n)/g, '');
	fnString = fnString.replace(/function\(/g, '');
	fnString = fnString.replace(/^const|let|var/, '');

	let pattern = /([^ (]*)\(/;
	let match = fnString.match(/([^ (]*)\(/);
	if(!match){
		match = fnString.match(/([^ (]*)\s?=/);
	}
	if(match){
		return match[1].trim();
	}
}

/**
 * Inspects a function and returns information about it
 * @param  {Function|String} fn - Function to be inspected
 * @param  {String}   name - Name of the function to be used at the result set (it will supersed the one found during the inspection)
 * @return {Object}        Returns and object with fn, name, parameters, parameters, signature
 */
function inspectFunction(fn, name) {
	name = name || fn.name || getNameFromSourceCode(fn) || '';
	const parametersStringified = stringifyParameters(fn);
	const parameters = inspectParameters(parametersStringified);
	const parametersNames = getParametersNamesFromInspection(parameters);
	const signature =  `${name}(${parametersStringified});`;

	return {
		fn: fn.constructor === Function ? fn : undefined,
		name,
		signature,
		parameters,
		parametersNames
	};
}

module.exports = inspectFunction;