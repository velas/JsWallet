'use strict';

const inspectFunction = require('inspect-function');

const isArrayLike = p => p.match(/^\[+/) || null;
const isObjectLike = p => p.match(/^{+/) || null;
const matchObjectProperty = p => p.match(/^([^{]+):(.*)/) || null;
const unpackArrayOrObject = p => p.replace(/^[\[{]|[\]}]$/g, '');

const unpackParameter = (param, options) => {
	let unpacked = getParametersArray(unpackArrayOrObject(param));

	if (isArrayLike(param)) {
		return unpacked.map(unpackedParam => getParameterValue(unpackedParam, options));
	}

	if (isObjectLike(param)) {
		return unpacked.reduce((paramValue, unpackedParam) => {
			let objectProperty = matchObjectProperty(unpackedParam);
			if(objectProperty){
				let [, key, value] = objectProperty.map(v => v.trim());
				paramValue[key] = getParameterValue(value, options);
			} else {
				paramValue[unpackedParam] = getParameterValue(unpackedParam, options);
			}

			return paramValue;
		}, {});
	}
};

const getParameterValue = (param, options) => {
	if(isArrayLike(param) || isObjectLike(param)){
		return unpackParameter(param, options);
	}

	return options[param];
}

function getParametersArray(paramsString) {
	let startIndex = 0;
	let skipComma;

	const paramsFound = paramsString.split('').reduce((paramsFound, chr, i, arr) => {
		if (chr.match(/\[|\{|\(/)) {
			skipComma = true;
		}

		if (chr.match(/\]|\}|\)/)) {
			skipComma = false;
		}

		if (!skipComma && (chr === ',' || i === arr.length - 1)) {
			const lastIndex = i === arr.length - 1 ? i + 1 : i;
			const paramFound = paramsString.substring(startIndex, lastIndex);
			startIndex = lastIndex + 1;
			paramsFound.push(paramFound);
		}
		return paramsFound;
	}, []);

	return paramsFound.map(p => p.trim());
}

const optionsToParameters = (parameters, options) => {
	return parameters.map(param => getParameterValue(param, options));
};

const fnParametersFromOptions = (fn, object) => {
	const fnParams = inspectFunction(fn).parameters.expected;
	return optionsToParameters(fnParams, object);
};

const callWithObject = (fn, object) => {
	const fnParams = inspectFunction(fn).parameters.expected;
	const objectParameters = optionsToParameters(fnParams, object);
	return fn(...objectParameters);
};

module.exports = { callWithObject, fnParametersFromOptions };