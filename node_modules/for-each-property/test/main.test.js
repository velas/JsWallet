'use strict';

const assert = require('assert');
const forEachProperty = require('../');
const testDataSet = require('./test.data.js');

testDataSet.forEach(testData => {
	describe(testData.name, function() {
		describe(`forEachOwnEnumerableProperty :: enumerability: 'enumerable', inherited: false`, function() {
			testMethod(forEachProperty, testData.ref, testData.forEachOwnEnumerableProperty, { enumerability: 'enumerable', inherited: false });
		});

		describe(`forEachOwnNonenumerableProperty :: enumerability: 'nonenumerable', inherited: false`, function() {
			testMethod(forEachProperty, testData.ref, testData.forEachOwnNonenumerableProperty, { enumerability: 'nonenumerable', inherited: false });
		});

		describe(`forEachOwnEnumerableAndNonenumerableProperty :: enumerability: 'all', inherited: false`, function() {
			testMethod(forEachProperty, testData.ref, testData.forEachOwnEnumerableAndNonenumerableProperty, { enumerability: 'all', inherited: false });
		});

		describe(`forEachEnumerableProperty :: enumerability: 'enumerable', inherited: true`, function() {
			testMethod(forEachProperty, testData.ref, testData.forEachEnumerableProperty, { enumerability: 'enumerable', inherited: true });
		});

		describe(`forEachNonenumerableProperty :: enumerability: 'nonenumerable', inherited: true`, function() {
			testMethod(forEachProperty, testData.ref, testData.forEachNonenumerableProperty, { enumerability: 'nonenumerable', inherited: true });
		});

		describe(`forEachEnumerableAndNonenumerableProperty :: enumerability: 'all', inherited: true`, function() {
			testMethod(forEachProperty, testData.ref, testData.forEachEnumerableAndNonenumerableProperty, { enumerability: 'all', inherited: true });
		});
	});
});

function testMethod(methodToTest, ref, propsExpected, options) {
	const propsFound = [];

	it(`must find the same number of props expected`, function() {
		methodToTest(ref, (value, key, o) => {
			propsFound.push(key);
		}, options);

		assert.equal(propsFound.length, propsExpected.length);
	});

	it(`must find every prop expected`, function() {
		assert(propsFound.every(prop => propsExpected.includes(prop)));
	});
}
