#!/usr/bin/env node
'use strict';

const inspectFunction = require('../');
const assert = require('assert');

describe('inspectFunction', function() {

	const functionsSchemas = getTestData();

	Object.keys(functionsSchemas).forEach(key => {
		const inspectResult = inspectFunction(functionsSchemas[key][key]);

		describe(`${inspectResult.signature}`, function() {
			it(`Must find the same length of expected parameters`, function() {
				assert.equal(functionsSchemas[key].parameters.expected.length, inspectResult.parameters.expected.length);
			});

			it(`Must find the same length of parameters names`, function() {
				assert.equal(functionsSchemas[key].parameters.names.length, inspectResult.parameters.names.length);
			});

			it(`Must find the same parameters names`, function() {
				functionsSchemas[key].parameters.names.sort();
				inspectResult.parameters.names.sort();
				assert.equal(true, functionsSchemas[key].parameters.names.every((param, i) => param === inspectResult.parameters.names[i]));
			});

			it(`Must find the same expected parameters`, function() {
				functionsSchemas[key].parameters.expected.sort();
				inspectResult.parameters.expected.sort();
				assert.equal(true, functionsSchemas[key].parameters.expected.every((param, i) => param === inspectResult.parameters.expected[i]));
			});
		});

	});

});

function getTestData(){
	const functionsSchemas = {
		arrowWithoutParenthesis: {
			parameters: {
				expected: ['param'],
				names: ['param']
			},
			arrowWithoutParenthesis: param => console.log(a)
		},

		arrow: {
			parameters: {
				expected: ['paramA', 'paramB', 'c'],
				names: ['paramA', 'paramB', 'c']
			},
			arrow: (paramA, paramB, c) => console.log(a, b, c)
		},

		arrowWithBraces: {
			parameters: {
				expected: ['a', 'b', 'c'],
				names: ['a', 'b', 'c']
			},
			arrowWithBraces: (a, b, c) => {
				return console.log(a, b, c)
			}
		},

		arrowWithoutParenthesisWithBraces: {
			parameters: {
				expected: ['a'],
				names: ['a']
			},
			arrowWithoutParenthesisWithBraces: a => {
				return console.log(a)
			}
		},

		function: {
			parameters: {
				expected: ['a', 'b', 'c'],
				names: ['a', 'b', 'c']
			},
			function: function(a, b, c){
				console.log(a, b, c)
			}
		},

		functionWithName: {
			parameters: {
				expected: ['a'],
				names: ['a']
			},
			functionWithName: function withName(a) {
				console.log(a)
			}
		},

		arrowWithBracesWithDefaultParameters: {
			parameters: {
				expected: ['option', 'a', 'b', 'arr', 'arr2', 'e', 'z'],
				names: ['option', 'a', 'b', 'arr', 'arr2', 'e', 'z']
			},
			arrowWithBracesWithDefaultParameters: (option, a = 2, b= {c:1}, arr = ([]), arr2 = [1,2,3], e = { a: {
				b: 3,
				d: ([{}])}
			},z) => (a = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return s})
		},

		functionWithDefaultParameters: {
			parameters: {
				expected: ['option', 'a', 'b', 'arr', 'e', 'z'],
				names: ['option', 'a', 'b', 'arr', 'e', 'z']
			},
			functionWithDefaultParameters: function (option, a = 2, b= {c:1}, arr = ([]), e = { a: {
				b: 3,
				d: ([{}])}
			},z) {return (a = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return s})}
		},

		functionWithNameWithDefaultParameters: {
			parameters: {
				expected: ['option', 'a', 'b', 'arr', 'e', 'z'],
				names: ['option', 'a', 'b', 'arr', 'e', 'z']
			},
			functionWithNameWithDefaultParameters: function someFnName(option, a = 2, b= {c:1}, arr = ([]), e = { a: {
				b: 3,
				d: ([{}])}
			},z) { return (a = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return s})}
		},

		arrowFunctionWithDestructuringInnerDefaultParameters: {
			parameters: {
				expected: [`{str='strDefault',bool=false,obj={ob:1,j:2},arrObj=[{o}]}`],
				names: ['str', 'bool', 'obj', 'arrObj']
			},
			arrowFunctionWithDestructuringInnerDefaultParameters: ({ str = 'strDefault', bool = false, obj = {ob:1,j:2}, arrObj = [{o}] } = {}) => {}
		},

		functionWithDestructuringInnerDefaultParameters: {
			parameters: {
				expected: [`{str='strDefault',bool=false,obj={ob:1,j:2},arrObj=[{o}]}`],
				names: ['str', 'bool', 'obj', 'arrObj']
			},
			functionWithDestructuringInnerDefaultParameters: function ({ str = 'strDefault', bool = false, obj = {ob:1,j:2}, arrObj = [{o}] } = {}) {}
		},

		functionWithNameWithDestructuringInnerDefaultParameters: {
			parameters: {
				expected: [`{str='strDefault',bool=false,obj={ob:1,j:2},arrObj=[{o}]}`],
				names: ['str', 'bool', 'obj', 'arrObj']
			},
			functionWithNameWithDestructuringInnerDefaultParameters: function someFnName({ str = 'strDefault', bool = false, obj = {ob:1,j:2}, arrObj = [{o}] } = {}) {}
		},

		functionsWithHardDefaultParameters: {
			parameters: {
				expected: ['option', 'bz', 'arr', 'arr2', 'dk', 'e', 'fn', 'fn2', '[destru,[cturi],[ng]]', 'c', '{dd,ee,ff}', '{ddd,eee:{zzz},fff}', 'g'],
				names: ['destru',  'cturi',  'ng',  'ddd',  'zzz',  'fff',  'option',  'bz',  'arr',  'arr2',  'dk',  'e',  'fn',  'fn2',  'c',  'dd',  'ee',  'ff',  'g']
			},
			functionsWithHardDefaultParameters: function ( [destru, [cturi],[ng]]= [1], {ddd,eee: {zzz},fff}, option = 2, bz= {c:1}, arr = [], arr2=[1,2,4], dk =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return s},c, {dd, ee , ff} = {dd: {b: 1, c:2, arr:[1,6]}}, g) {  return  (x = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return z})}
		},

		functionsWithNameWithHardDefaultParameters: {
			parameters: {
				expected: ['option', 'bz', 'arr', 'arr2', 'dk', 'e', 'fn', 'fn2', '[destru,[cturi],[ng]]', 'c', '{dd,ee,ff}', '{ddd,eee:{zzz},fff}', 'g'],
				names: ['destru',  'cturi',  'ng',  'ddd',  'zzz',  'fff',  'option',  'bz',  'arr',  'arr2',  'dk',  'e',  'fn',  'fn2',  'c',  'dd',  'ee',  'ff',  'g']
			},
			functionsWithNameWithHardDefaultParameters: function someFnName([destru, [cturi],[ng]]= [1], {ddd,eee: {zzz},fff}, option = 2, bz= {c:1}, arr = [...z, ...k], arr2=[1,2,4, ...k], dk =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return s}, c, {dd, ee , ff} = {dd: {b: 1, c:2, arr:[1,6]}}, g) {  return  (x = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return z})}
		},

		arrowWithBracesWithHardDefaultParameters: {
			parameters: {
				expected: ['option', 'bz', 'arr', 'arr2', 'dk', 'e', 'fn', 'fn2', '[destru,[cturi],[ng]]', 'c', '{dd,ee,ff}', '{ddd,eee:{zzz},fff}', 'g'],
				names: ['destru', 'cturi', 'ng', 'ddd', 'zzz', 'fff', 'option', 'bz', 'arr', 'arr2', 'dk', 'e', 'fn', 'fn2', 'c', 'dd', 'ee', 'ff', 'g']
			},
			arrowWithBracesWithHardDefaultParameters: ([destru, [cturi],[ng]]= [1], {ddd,eee: {zzz},fff}, option = 2, bz= {c:1}, arr = [...z], arr2=[1,2,4,...k], dk =function(z){}, e = { a: {
				b: 3,
				d: x => x}
 			}, fn = d => s, fn2 = d => {return s}, c, {dd, ee , ff} = {dd: {b: 1, c:2, arr:[1,6]}}, g) => {  return  (x = 2, b= {c:1}, arr = [], d =function(z){}, e = { a: {
				b: 3,
				d: x => x}
			}, fn = d => s, fn2 = d => {return z})}
		}
	};

	return functionsSchemas;
}