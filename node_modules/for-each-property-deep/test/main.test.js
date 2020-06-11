'use strict';

const assert = require('assert');
const forEachPropertyDeep = require('../');
const testDataSet = require('./test.data.js');

////////////////////////////
// functionWithProperties //
////////////////////////////

testDataSet.forEach(testData => {
	describe(testData.name, function() {

		describe('keys / props', function() {

			describe(`forEachPropertyDeep :: forEachOwnEnumerableProperty :: enumerability: 'enumerable', inherited: false`, function() {
				testForEachPropertyDeepKeys(testData.ref, testData.forEachOwnEnumerableProperty.keys, { enumerability: 'enumerable', inherited: false });
			});

			describe(`forEachPropertyDeep :: forEachOwnNonenumerableProperty :: enumerability: 'nonenumerable', inherited: false`, function() {
				testForEachPropertyDeepKeys(testData.ref, testData.forEachOwnNonenumerableProperty.keys, { enumerability: 'nonenumerable', inherited: false });
			});

			describe(`forEachPropertyDeep :: forEachOwnEnumerableAndNonenumerableProperty :: enumerability: 'all', inherited: false`, function() {
				testForEachPropertyDeepKeys(testData.ref, testData.forEachOwnEnumerableAndNonenumerableProperty.keys, { enumerability: 'all', inherited: false });
			});

			describe(`forEachPropertyDeep :: forEachEnumerableProperty :: enumerability: 'enumerable', inherited: true`, function() {
				testForEachPropertyDeepKeys(testData.ref, testData.forEachEnumerableProperty.keys, { enumerability: 'enumerable', inherited: true });
			});

			describe(`forEachPropertyDeep :: forEachNonenumerableProperty :: enumerability: 'nonenumerable', inherited: true`, function() {
				testForEachPropertyDeepKeys(testData.ref, testData.forEachNonenumerableProperty.keys, { enumerability: 'nonenumerable', inherited: true });
			});

			describe(`forEachPropertyDeep :: forEachEnumerableAndNonenumerableProperty :: enumerability: 'all', inherited: true`, function() {
				testForEachPropertyDeepKeys(testData.ref, testData.forEachEnumerableAndNonenumerableProperty.keys, { enumerability: 'all', inherited: true });
			});

		});

		describe('paths', function() {

			describe(`forEachPropertyDeep :: forEachOwnEnumerableProperty :: enumerability: 'enumerable', inherited: false`, function() {
				testForEachPropertyDeepPaths(testData.ref, testData.forEachOwnEnumerableProperty.paths, { enumerability: 'enumerable', inherited: false });
			});

			describe(`forEachPropertyDeep :: forEachOwnNonenumerableProperty :: enumerability: 'nonenumerable', inherited: false`, function() {
				testForEachPropertyDeepPaths(testData.ref, testData.forEachOwnNonenumerableProperty.paths, { enumerability: 'nonenumerable', inherited: false });
			});

			describe(`forEachPropertyDeep :: forEachOwnEnumerableAndNonenumerableProperty :: enumerability: 'all', inherited: false`, function() {
				testForEachPropertyDeepPaths(testData.ref, testData.forEachOwnEnumerableAndNonenumerableProperty.paths, { enumerability: 'all', inherited: false });
			});

			describe(`forEachPropertyDeep :: forEachEnumerableProperty :: enumerability: 'enumerable', inherited: true`, function() {
				testForEachPropertyDeepPaths(testData.ref, testData.forEachEnumerableProperty.paths, { enumerability: 'enumerable', inherited: true });
			});

			describe(`forEachPropertyDeep :: forEachNonenumerableProperty :: enumerability: 'nonenumerable', inherited: true`, function() {
				testForEachPropertyDeepPaths(testData.ref, testData.forEachNonenumerableProperty.paths, { enumerability: 'nonenumerable', inherited: true });
			});

			describe(`forEachPropertyDeep :: forEachEnumerableAndNonenumerableProperty :: enumerability: 'all', inherited: true`, function() {
				testForEachPropertyDeepPaths(testData.ref, testData.forEachEnumerableAndNonenumerableProperty.paths, { enumerability: 'all', inherited: true });
			});
		});
	});
});

function testForEachPropertyDeepKeys(ref, propsExpected, options) {
	const propsFound = [];

	it(`must find the same number of props expected`, function() {
		forEachPropertyDeep(ref, (value, key) => {
			propsFound.push(key);
		}, options);

		assert.equal(propsFound.length, propsExpected.length);
	});

	it(`must find every prop expected`, function() {
		assert(propsFound.every(prop => propsExpected.includes(prop)));
	});
}

function testForEachPropertyDeepPaths(ref, pathsExpected, options) {
	let pathsFound = [];

	it(`must find the same number of paths expected`, function() {
		forEachPropertyDeep(ref, (v, k, path) => {
			pathsFound = pathsFound.concat(path.join('.'));
		}, options);

		assert.equal(pathsFound.length, pathsExpected.length);
	});

	it(`must find every path expected`, function() {
		assert(pathsFound.every(prop => pathsExpected.includes(prop)));
	});
}