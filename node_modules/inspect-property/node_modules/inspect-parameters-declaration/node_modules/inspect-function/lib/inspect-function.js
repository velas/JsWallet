#!/usr/bin/env node
'use strict';

const splitSkip = require('split-skip');
const unpackString = require('unpack-string');

const isArrayLike = p => p.match(/^\[+/) || null;
const isObjectLike = p => p.match(/^{+/) || null;
const matchObjectProperty = p => p.match(/^([^{]+):(.*)/) || null;

const getParametersStringfied = fn => {
	let fnString = fn.constructor === String ? fn.replace(/\s/g, '') : fn.toString().replace(/\s/g, '');

	// Is an Arrow function with only one argument defined without parenthesis
	if (!fnString.match(/^function/) && !fnString.match(/^\(/)) {
		let matchArrowWithoutParenthesis = fnString.match(/^(.*?)=>/);
		return matchArrowWithoutParenthesis ? matchArrowWithoutParenthesis[1] : null;
	}

	return unpackString(fnString);
}

function splitSkipBrackets(string, delimiter) {
	return splitSkip(string, delimiter, (state, char, i) => {

		if ('{[('.indexOf(char) >= 0) {
			state.skip += 1;
		}

		if ('}])'.indexOf(char) >= 0) {
			state.skip -= 1;
		}

		return state;
	});
}

function getParametersArray(paramsString) {
	return splitSkipBrackets(paramsString, ',');
}

function inspectDestructuringParameters(param, list = []) {
	param = param.trim();

	const unpackedArray = getParametersArray(unpackString(param));

	if (isArrayLike(param)) {
		unpackedArray.forEach(param => inspectDestructuringParameters(param, list));
	} else if (isObjectLike(param)) {
		unpackedArray.forEach(param => {
			let objectProperty = matchObjectProperty(param);
			if (objectProperty) {
				param = objectProperty[2];
				inspectDestructuringParameters(param, list);
			} else {
				inspectDestructuringParameters(param, list);
			}
		});
	} else {
		const [ name, defaultValue ] = splitSkipBrackets(param, '=');
		list.push([ name, defaultValue ]);
	}

	return list;
}

function getParametersInfo(paramsArray) {
	let names = [];
	let expected = [];
	let defaultValues = {};

	paramsArray.forEach((param) => {
		let [ paramDefinition, defaultValue ] = splitSkipBrackets(param, '=');

		expected.push(paramDefinition);
		if (defaultValue) {
			defaultValues[paramDefinition] = defaultValue;
		}

		if (isArrayLike(paramDefinition) || isObjectLike(paramDefinition)) {
			inspectDestructuringParameters(paramDefinition)
				.forEach(([paramName, defaultValue]) => {
					names.push(paramName);
					if(defaultValue){
						defaultValues[paramName] = defaultValue;
					}
				});
		} else {
			names.push(paramDefinition);
		}

	});

	return { parameters: { expected, defaultValues, names } };
}

function getSignatureFromParametersArray(name, paramsArray) {
	return `${name}(${paramsArray.map(v => v.replace(/^([^=]*)=/, `$1 = `)).join(', ')});`
}

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
 * Inspects a function and returns informations about it
 * @param  {Function|String} fn - Function to be inspected
 * @param  {String}   name - Name of the function to be used at the result set (it will supersed the one found during the inspection)
 * @return {Object}        Returns and object with fn, name, parameters, parameters, signature
 */
function inspectFunction(fn, name) {
	name = name || fn.name || getNameFromSourceCode(fn) || '';
	const parametersDefinitions = getParametersArray(getParametersStringfied(fn));
	const { parameters } = getParametersInfo(parametersDefinitions);
	const signature = getSignatureFromParametersArray(name, parametersDefinitions);
	parameters.definitions = parametersDefinitions;

	return {
		fn: fn.constructor === Function ? fn : null,
		name,
		parameters,
		signature
	}
}

module.exports = inspectFunction;