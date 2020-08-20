#!/usr/bin/env node
'use strict';

const stringifyParameters = require('../');
const assert = require('assert');

describe('stringifyParameters', function() {
	const functionsDefinitions = getTestData();

	Object.keys(functionsDefinitions).forEach(key => {
		describe(`${key}`, function() {
			it(`Must match the expected parameters`, function() {
				const parametersStringified = stringifyParameters(functionsDefinitions[key].input);
				assert.equal(parametersStringified, functionsDefinitions[key].expectedResult);
			});
		});

	});
});

function getTestData(){
	const functionsDefinitions = {
		arrowWithoutParenthesis: {
			input: param => console.log(param),
			expectedResult: 'param'
		},

		arrow: {
			input: (paramA, paramB, c) => console.log(a, b, c),
			expectedResult: 'paramA, paramB, c'
		},

		arrowWithBraces: {
			input: (a, b, c) => {
				return console.log(a, b, c)
			},
			expectedResult: 'a, b, c'
		},

		arrowWithoutParenthesisWithBraces: {
			input: a => {
				return console.log(a)
			},
			expectedResult: 'a'
		},

		simpleFunction: {
			input: function(a, b, c){
				console.log(a, b, c)
			},
			expectedResult: 'a, b, c'
		},

		functionWithName: {
			input: function withName(abc) {
				console.log(abc)
			},
			expectedResult: 'abc'
		},

		arrowWithBracesWithDefaultParameters: {
			input: (option, a = 2, b= {c:1}, arr = ([]), arr2 = [1,2,3], e = { a: {
				b: 3,
				d: ([{}])}
			},z) => (a = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return s}),
			expectedResult: `option, a = 2, b= {c:1}, arr = ([]), arr2 = [1,2,3], e = { a: {
				b: 3,
				d: ([{}])}
			},z`
		},

		functionWithDefaultParameters: {
			input: function (option, a = 2, b= {c:1}, arr = ([]), e = { a: {
				b: 3,
				d: ([{}])}
			},z) {return (a = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return s})},
			expectedResult: `option, a = 2, b= {c:1}, arr = ([]), e = { a: {
				b: 3,
				d: ([{}])}
			},z`
		},

		functionWithNameWithDestructuringInnerDefaultParameters: {
			input: function someFnName({ str = 'strDefault', bool = false, obj = {ob:1,j:2}, arrObj = [{o}] } = {}) {},
			expectedResult: `{ str = 'strDefault', bool = false, obj = {ob:1,j:2}, arrObj = [{o}] } = {}`
		},

		functionsWithComplexParameters: {
			input: function ([destru, [cturi],[ng]]= [1], {ddd,eee: {zzz},fff}, option = 2, bz= {c:1}, arr = [...z, ...k], arr2=[1,2,4, ...k], dk =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return s}, c, {dd, ee , ff} = {dd: {b: 1, c:2, arr:[1,6]}}, g) {  return  (x = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return z})},
			expectedResult: `[destru, [cturi],[ng]]= [1], {ddd,eee: {zzz},fff}, option = 2, bz= {c:1}, arr = [...z, ...k], arr2=[1,2,4, ...k], dk =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return s}, c, {dd, ee , ff} = {dd: {b: 1, c:2, arr:[1,6]}}, g`
		},

		arrowWithBracesWithHardDefaultParameters: {
			input: ([destru, [cturi],[ng]]= [1], {ddd,eee: {zzz},fff}, option = 2, bz= {c:1}, arr = [...z], arr2=[1,2,4,...k], dk =function(z){}, e = { a: {
				b: 3,
				d: x => x}
 			}, fn = d => s, fn2 = d => {return s}, c, {dd, ee , ff} = {dd: {b: 1, c:2, arr:[1,6]}}, g) => {  return  (x = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return z})},
			expectedResult: `[destru, [cturi],[ng]]= [1], {ddd,eee: {zzz},fff}, option = 2, bz= {c:1}, arr = [...z], arr2=[1,2,4,...k], dk =function(z){}, e = { a: {
				b: 3,
				d: x => x}
 			}, fn = d => s, fn2 = d => {return s}, c, {dd, ee , ff} = {dd: {b: 1, c:2, arr:[1,6]}}, g`
		}
	};

	return functionsDefinitions;
}