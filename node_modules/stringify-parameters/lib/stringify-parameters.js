'use strict';

const unpackString = require('unpack-string');

function stringifyParameters(fn) {
	if (!fn || (fn.constructor !== String && fn.constructor !== Function)) {
		return;
	}

	let fnString = fn.toString().replace(/^\s+|\s+$/g, '');
	if (!fnString) {
		return;
	}

	const isDeclaredWithFunctionKeyword = /^function/i;
	const isNotArrowFunction = /^[^\s=>]+\(/i;

	// Is an Arrow function with a parameter declared without parenthesis and with no default value
	if (!isDeclaredWithFunctionKeyword.test(fnString) && !isNotArrowFunction.test(fnString)) {
		let arrowWithoutParenthesis = fnString.match(/^(.*?)=>/);
		if (arrowWithoutParenthesis) {
			return unpackString(arrowWithoutParenthesis[1]).replace(/^\s+|\s+$/g, '');
		}
	}

	return unpackString(fnString).replace(/^\s+|\s+$/g, '');
}

module.exports = stringifyParameters;