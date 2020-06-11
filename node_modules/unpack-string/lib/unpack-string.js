'use strict';

/**
 * Unpacks the content found within a text, delimited by an opening char and a closing char, e.g., "Can extract (only the content found here within these parentheses)"
 * @param  {String} str         Input String
 * @param  {String} openingChar Opening char e.g. "(", "[", "{". If nothing is passed in it will try to guess some known opening chars: '([{<'
 * @param  {String} closingChar Closing char e.g. ")", "]", "}". If nothing is passed in it will try to guess some known closing chars: ')]}>'
 * @return {String}             The content found within the opening char and the closing char
 */
function unpackString(str, openingChar, closingChar) {

	let knownOpeningChars = '([{<';
	let knownClosingChars = ')]}>';

	let indexStart;
	let indexEnd;
	let skip = 0;

	for (let i = 0; i < str.length; i++) {
		const char = str[i];

		if (!openingChar) {
			if (knownOpeningChars.indexOf(char) < 0) {
				continue;
			}

			openingChar = char;
		}

		closingChar = closingChar || knownClosingChars[knownOpeningChars.indexOf(openingChar)];

		let matchOpeningChar = char === openingChar;
		let matchClosingChar = char === closingChar;

		if (typeof(indexStart) === 'undefined' && matchOpeningChar) {
			indexStart = i;
			continue;
		}

		if (matchOpeningChar) {
			skip += 1;
			continue;
		}

		if (skip && matchClosingChar) {
			skip -= 1;
			continue;
		}

		if (matchClosingChar) {
			indexEnd = i;
			break;
		}
	}

	return str.substring(indexStart + 1, indexEnd);
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = unpackString;
}