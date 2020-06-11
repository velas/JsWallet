'use strict';

const assert = require('assert');
const { functionObject, instanceFromFunctionObject } = require('../data/main-data.js');

module.exports = [
	{
		description: `Test functionObject {enumerability: 'enumerable'}`,
		input: functionObject,
		fn: (method, input) => method(input, null, { enumerability: 'enumerable' }),
		tests: [{
			description: "Check Type",
			fn: (output, input) => assert(output.type, 'function'),
		}, {
			description: "Check Constructor Name",
			fn: (output, input) => assert(output.constructor.name, 'Function'),
		}, {
			description: "Check functionInspection name",
			fn: (output, input) => assert(output.functionInspection.name, 'functionObject'),
		}, {
			description: "Check Properties",
			fn: (output, input) => {
				const mustInclude = ['functionObjectEnumerablePropEnumerable'];
				return assert(Object.keys(output.properties).every(key => mustInclude.includes(key)));
			}
		}, {
			description: "Property Type",
			fn: (output, input) => {
				return assert(output.properties.functionObjectEnumerablePropEnumerable.type, 'string');
			}
		}]
	},
	{
		description: `Test instanceFromFunctionObject {enumerability: 'enumerable'}`,
		input: instanceFromFunctionObject,
		fn: (method, input) => method(input, null, { enumerability: 'enumerable' }),
		tests: [{
			description: "Check Type Name",
			fn: (output, input) => assert(output.type, 'object'),
		}, {
			description: "Check Constructor Name",
			fn: (output, input) => assert(output.constructor.name, 'functionObject'),
		}, {
			description: "Check Properties",
			fn: (output, input) => {
				const mustInclude = [
					'inner',
					'propEnumerable',
					'propNonEnumerable',
					'a',
					'a.b',
					'a.b.c',
					'a.d',
					'a.f',
					'a.f.g',
					'protoEnumerableProp',
					'protoNonEnumerableProp'
				];
				return assert(Object.keys(output.properties).every(key => mustInclude.includes(key)));
			}
		}]
	},
	{
		description: `Test instanceFromFunctionObject {enumerability: 'all', inherited: true}`,
		input: instanceFromFunctionObject,
		fn: (method, input) => method(input, null, { enumerability: 'all', inherited: true }),
		tests: [{
			description: "Check Type Name",
			fn: (output, input) => assert(output.type, 'object'),
		}, {
			description: "Check Constructor Name",
			fn: (output, input) => assert(output.constructor.name, 'functionObject'),
		}, {
			description: "Check Properties",
			fn: (output, input) => {
				const mustInclude = [
					'inner',
					'propEnumerable',
					'propNonEnumerable',
					'a',
					'a.b',
					'a.b.c',
					'a.d',
					'a.f',
					'a.f.g',
					'protoEnumerableProp',
					'protoNonEnumerableProp'
				];
				return assert(Object.keys(output.properties).every(key => mustInclude.includes(key)));
			}
		}]
	},
	{
		description: `Test instanceFromFunctionObject {delimiter: '|'}`,
		input: instanceFromFunctionObject,
		fn: (method, input) => method(input, null, { delimiter: '|' }),
		tests: [{
			description: "Check Type Name",
			fn: (output, input) => assert(output.type, 'object'),
		}, {
			description: "Check Constructor Name",
			fn: (output, input) => assert(output.constructor.name, 'functionObject'),
		}, {
			description: "Check Properties",
			fn: (output, input) => {
				const mustInclude = [
					'inner',
					'propEnumerable',
					'a',
					'a|b',
					'a|b|c',
					'a|d',
					'a|f',
					'a|f|g'
				];
				return assert(Object.keys(output.properties).every(key => mustInclude.includes(key)));
			}
		}]
	}
];