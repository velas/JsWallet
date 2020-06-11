'use strict';

const unpackString = require(`../`);
const assert = require(`assert`);

describe(`unpack-string`, function() {

	const input = 'Can extract (only the content [found {here} within] these parentheses)!!';

	it(`Must get the content found within "()" by guessing the opening char and the closing char`, function() {
		const expected = 'only the content [found {here} within] these parentheses';
		const result = unpackString(input);
		assert.equal(result, expected);
	});

	it(`Must get the content found within "[]", defining the opening char parameter and letting it guess the closing char`, function() {
		const expected = 'found {here} within';
		const result = unpackString(input, '[');
		assert.equal(result, expected);
	});

	it(`Must get the content found within "{}", defining the opening char and the closing char parameters`, function() {
		const expected = 'here';
		const result = unpackString(input, '{', '}');
		assert.equal(result, expected);
	});

	it(`Must get the content found within "[}", defining the opening char and the closing char parameters`, function() {
		const expected = 'found {here';
		const result = unpackString(input, '[', '}');
		assert.equal(result, expected);
	});

	it(`Must get the content found within "})", defining the opening char and the closing char parameters`, function() {
		const expected = ' within] these parentheses';
		const result = unpackString(input, '}', ')');
		assert.equal(result, expected);
	});
});