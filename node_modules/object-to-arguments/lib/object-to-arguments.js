'use strict';

const splitSkip = require('split-skip');
const unpack = require('unpack-string');
const inspectFunction = require('inspect-function');
const stringifyParameters = require('stringify-parameters');
const { getParametersNames, inspectParameters, getParametersNamesFromInspection } = require('inspect-parameters-declaration');

const isArrayLike = p => p.match(/^\[+/) || undefined;
const isObjectLike = p => p.match(/^{+/) || undefined;
const matchObjectProperty = p => p.match(/^([^{]+):(.*)/) || undefined;

function setDestructuringParameterArgumentsIntoObject(parameter, data) {
	const unpackedParameter = unpack(parameter);
	const inspectedParameters = inspectParameters(unpackedParameter);

	return inspectedParameters.reduce((parameterValue, inspectedParameter) => {
		let objectProperty = matchObjectProperty(inspectedParameter.parameter);
		if (objectProperty) {
			let [, key, value] = objectProperty.map(v => v.trim());
			let [valueInspectedParameter] = inspectParameters(value);
			parameterValue[key] = setArgumentValue(valueInspectedParameter, data);
		} else {
			parameterValue[inspectedParameter.parameter] = setArgumentValue(inspectedParameter, data);
		}

		return parameterValue;
	}, {});
}

function setDestructuringParameterArgumentsIntoArray(parameter, data) {
	const unpackedParameter = unpack(parameter);
	const inspectedParameters = inspectParameters(unpackedParameter);
	return prepareArgumentsArray(inspectedParameters, data);
}

function setDestructuringParameterArguments(parameter, data) {
	if (isArrayLike(parameter)) {
		return setDestructuringParameterArgumentsIntoArray(parameter, data);
	}

	if (isObjectLike(parameter)) {
		return setDestructuringParameterArgumentsIntoObject(parameter, data);
	}
}

function setArgumentValue({ parameter, expectsDestructuring, defaultValue } = {}, data) {
	if (!expectsDestructuring) {
		return data[parameter];
	}

	if (defaultValue) {
		const someDestructuringParameterIsSet = getParametersNames(parameter).some(parameterName => data[parameterName]);
		if (!someDestructuringParameterIsSet) {
			return undefined;
		}
	}

	return setDestructuringParameterArguments(parameter, data);
}

function prepareArgumentsArray(inspectedParameters, data = {}) {
	return inspectedParameters.map(inspectedParameter => setArgumentValue(inspectedParameter, data));
}

function prepareArgs(fn, object, ...args) {
	if (!fn) {
		return [];
	}

	if (!object) {
		return args;
	}

	if (object && object.constructor === String) {
		try {
			object = JSON.parse(object);
		} catch (ex) {
			if(!args.length){
				return [];
			}

			object = {};
		}
	}

	const dataKeys = Object.keys(object);
	if (!dataKeys.length) {
		return args;
	}

	let argumentsArray = [];
	const parameters = stringifyParameters(fn);
	const inspectedParameters = parameters && inspectParameters(parameters);

	if(inspectedParameters && inspectedParameters.length){
		const restParameter = inspectedParameters.find(inspectedParameter => inspectedParameter.isRestParameter);
		const inspectedParametersExcludingRestParameter = inspectedParameters.filter(inspectedParameter => inspectedParameter !== restParameter);

		argumentsArray = argumentsArray.concat(prepareArgumentsArray(inspectedParametersExcludingRestParameter, object));

		if (restParameter && object[restParameter.parameter]) {
			if(object[restParameter.parameter].constructor === Array){
				argumentsArray = argumentsArray.concat(object[restParameter.parameter]);
			} else {
				argumentsArray.push(object[restParameter.parameter]);
			}
		}
	}

	// Include unexpected parameters names at the end of the arguments list
	const expectedArgumentsNames = getParametersNamesFromInspection(inspectedParameters);
	dataKeys.forEach(key => {
		if (!expectedArgumentsNames.includes(key)) {
			argumentsArray.push(object[key]);
		}
	});

	return argumentsArray.concat(args);
}

function prepareArgsAndCall(fn, object = {}, ...args) {
	return fn(...prepareArgs(fn, object, ...args));
}

module.exports = { prepareArgs, prepareArgsAndCall };