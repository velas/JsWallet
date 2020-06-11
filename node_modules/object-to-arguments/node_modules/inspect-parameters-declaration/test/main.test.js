'use strict';

const assert = require('assert');
const { inspectParameters, getParametersNames } = require('../');

const { testsParametersNames, testsInspectParameters } = getTestData();

describe('getParametersNames', function() {
	const tests = testsParametersNames;

	Object.keys(tests).forEach(key => {
		describe(`${key}`, function() {
			it(`Must match the expected parameters name`, function() {
				const allParametersNames = getParametersNames(tests[key].input);
				assert.deepEqual(allParametersNames, tests[key].expectedResult);
			});
		});
	});
});

describe('inspectParameters', function() {
	const tests = testsInspectParameters;

	Object.keys(tests).forEach(key => {
		describe(`${key}`, function() {
			it(`Must match the expected result`, function() {
				const allParametersNames = inspectParameters(tests[key].input);
				assert.deepEqual(allParametersNames, tests[key].expectedResult);
			});
		});
	});
});

function getTestData() {
	const testsParametersNames = {
		arrowWithoutParenthesis: {
			input: param => console.log(param),
			expectedResult: ['param']
		},

		arrowWithParenthesis: {
			input: (param) => console.log(param),
			expectedResult: ['param']
		},

		arrowWithParenthesisWithoutParameters: {
			input: () => {},
			expectedResult: []
		},

		arrowWithParenthesisAndDefaultValues: {
			input: (param = 'defaultParam', param2 = 'defaultParam') => console.log(param),
			expectedResult: ['param', 'param2']
		},

		simpleFunction: {
			input: function fn(z, k) {},
			expectedResult: ['z', 'k']
		},

		simpleFunctionWithoutParameters: {
			input: function fn() {},
			expectedResult: []
		},

		functionExpectingDestructuringPlusRestParameter: {
			input: function fn({ a } = {}, b, [d, e, z = "ZZ"] = [1, 2], ...aRestParameter) {},
			expectedResult: ['a', 'b', 'd', 'e', 'z', 'aRestParameter']
		},

		staticMethodFromClass: {
			input: (() => {
				class fn {
					static staticMethod(b, l, a = 'A') {
						console.log(`bla bla`);
					}
				}
				return fn.staticMethod;
			})(),
			expectedResult: ['b', 'l', 'a']
		},

		complexNonSenseFunction: {
			input: (option, a = 2,
				b = { c: 1 }, arr = ([]), arr2 = [1, 2, 3], e = {
					a: {
						b: 3,
						d: ([{}])
					}
				}, z) => (a = 2, b = { c: 1 }, arr = [], d = function(z) {}, e = {
				a: {
					b: 3,
					d: x => x
				}
			}, fn = d => s, fn2 = d => {
				return s
			}),
			expectedResult: ['option', 'a', 'b', 'arr', 'arr2', 'e', 'z']
		}
	};

	const testsInspectParameters = {
		stringMultipleParametersDeclaration: {
			input: `[p1 = 1,[p2 = 'P2DEF',[p3]]]=[], [a,b], { z, k, zk: {zz} }={}, zkzkz = 111, [zk,zzk,zzzk],iowu`,
			expectedResult: [{
				"parameter": "[p1 = 1,[p2 = 'P2DEF',[p3]]]",
				"defaultValue": "[]",
				"expectsDestructuring": true,
				"declaration": "[p1 = 1,[p2 = 'P2DEF',[p3]]]=[]",
				"destructuredParameters": [{
					"parameter": "p1",
					"defaultValue": "1",
					"declaration": "p1 = 1"
				}, {
					"parameter": "p2",
					"defaultValue": "P2DEF",
					"declaration": "p2 = 'P2DEF'"
				}, {
					"parameter": "p3",
					"declaration": "p3"
				}]
			}, {
				"parameter": "[a,b]",
				"expectsDestructuring": true,
				"declaration": "[a,b]",
				"destructuredParameters": [{
					"parameter": "a",
					"declaration": "a"
				}, {
					"parameter": "b",
					"declaration": "b"
				}]
			}, {
				"parameter": "{ z, k, zk: {zz} }",
				"defaultValue": "{}",
				"expectsDestructuring": true,
				"declaration": "{ z, k, zk: {zz} }={}",
				"destructuredParameters": [{
					"parameter": "z",
					"declaration": "z"
				}, {
					"parameter": "k",
					"declaration": "k"
				}, {
					"parameter": "zz",
					"declaration": "zz"
				}]
			}, {
				"parameter": "zkzkz",
				"defaultValue": "111",
				"declaration": "zkzkz = 111"
			}, {
				"parameter": "[zk,zzk,zzzk]",
				"expectsDestructuring": true,
				"declaration": "[zk,zzk,zzzk]",
				"destructuredParameters": [{
					"parameter": "zk",
					"declaration": "zk"
				}, {
					"parameter": "zzk",
					"declaration": "zzk"
				}, {
					"parameter": "zzzk",
					"declaration": "zzzk"
				}]
			}, {
				"parameter": "iowu",
				"declaration": "iowu"
			}]
		},

		functionMultipleParametersDeclaration: {
			input: ([p1 = 1,[p2 = 'P2DEF',[p3]]]=[], [a,b], { z, k, zk: {zz} }={}, zkzkz = 111, [zk,zzk,zzzk],iowu, ...aRestParameter) => {},
			expectedResult: [{
				"parameter": "[p1 = 1,[p2 = 'P2DEF',[p3]]]",
				"defaultValue": "[]",
				"expectsDestructuring": true,
				"declaration": "[p1 = 1,[p2 = 'P2DEF',[p3]]]=[]",
				"destructuredParameters": [{
					"parameter": "p1",
					"defaultValue": "1",
					"declaration": "p1 = 1"
				}, {
					"parameter": "p2",
					"defaultValue": "P2DEF",
					"declaration": "p2 = 'P2DEF'"
				}, {
					"parameter": "p3",
					"declaration": "p3"
				}]
			}, {
				"parameter": "[a,b]",
				"expectsDestructuring": true,
				"declaration": "[a,b]",
				"destructuredParameters": [{
					"parameter": "a",
					"declaration": "a"
				}, {
					"parameter": "b",
					"declaration": "b"
				}]
			}, {
				"parameter": "{ z, k, zk: {zz} }",
				"defaultValue": "{}",
				"expectsDestructuring": true,
				"declaration": "{ z, k, zk: {zz} }={}",
				"destructuredParameters": [{
					"parameter": "z",
					"declaration": "z"
				}, {
					"parameter": "k",
					"declaration": "k"
				}, {
					"parameter": "zz",
					"declaration": "zz"
				}]
			}, {
				"parameter": "zkzkz",
				"defaultValue": "111",
				"declaration": "zkzkz = 111"
			}, {
				"parameter": "[zk,zzk,zzzk]",
				"expectsDestructuring": true,
				"declaration": "[zk,zzk,zzzk]",
				"destructuredParameters": [{
					"parameter": "zk",
					"declaration": "zk"
				}, {
					"parameter": "zzk",
					"declaration": "zzk"
				}, {
					"parameter": "zzzk",
					"declaration": "zzzk"
				}]
			}, {
				"parameter": "iowu",
				"declaration": "iowu"
			}, {
				"parameter": "aRestParameter",
				"isRestParameter": true,
				"declaration": "...aRestParameter"
			}]
		},

		stringParameterDeclaration: {
			input: `[p1,[p2 = '',[p3]]]=[]`,
			expectedResult: [{
			    "parameter": "[p1,[p2 = '',[p3]]]",
			    "defaultValue": "[]",
			    "expectsDestructuring": true,
			    "declaration": "[p1,[p2 = '',[p3]]]=[]",
			    "destructuredParameters": [
			        {
			            "parameter": "p1",
			            "declaration": "p1"
			        },
			        {
			            "parameter": "p2",
			            "declaration": "p2 = ''"
			        },
			        {
			            "parameter": "p3",
			            "declaration": "p3"
			        }
			    ]
			}]
		},

		functionParameterDeclaration: {
			input: function ([p1,[p2 = '',[p3]]]=[]) { return; },
			expectedResult: [{
				"parameter": "[p1,[p2 = '',[p3]]]",
				"defaultValue": "[]",
				"expectsDestructuring": true,
				"declaration": "[p1,[p2 = '',[p3]]]=[]",
				"destructuredParameters": [{
					"parameter": "p1",
					"declaration": "p1"
				}, {
					"parameter": "p2",
					"declaration": "p2 = ''"
				}, {
					"parameter": "p3",
					"declaration": "p3"
				}]
			}]
		}
	};

	return { testsParametersNames, testsInspectParameters };
}