'use strict';

const inspectProperty = require('../');
const testSpecs = require('./specs/main-specs.js');

testSpecs.forEach(spec => {
	describe(spec.description, function(){
		const method = spec.method ? inspectProperty[spec.method] : inspectProperty;
		const input = spec.input;
		const output = spec.fn(method, input);
		spec.tests.forEach(test => {
			it(test.description, function(){
				return test.fn(output, input);
			});
		});
	});
});