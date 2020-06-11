'use strict';

/**
 * Splits a String into an Array of substrings with the option to skip some cases where the separator is found, based on some truthy condition.
 * @param  {String} str       Input String
 * @param  {String} separator Specifies the character(s) to use for separating the string
 * @param  {Function} skipState Function to be called on each iteration, to manage the skip state. `(state, char, i)`
 * @return {Array}           An array of strings split at each point where the separator occurs in the given string while the skipState were truthy.
 */
function splitSkip(str, separator, skipState) {

	const result = [];

	if (!str) {
		return [str];
	}

	let indexStart = 0;
	let indexEnd = 0;
	let state = {
		skip: 0
	};

	for (let i = 0; i < str.length; i++) {
		const char = separator.length === 1 ? str[i] : str.substr(i, separator.length);

		state = skipState ? skipState(state, char, i) : state;
		const compareSeparator = char === separator;

		if ((!state.skip && compareSeparator) || i === str.length - 1) {
			indexEnd = i === str.length - 1 ? i + 1 : i;
			result.push(str.substring(indexStart, indexEnd));
			indexStart = indexEnd + separator.length;
			i = i;
		}
	}

	return result;
}

module.exports = splitSkip;