'use strict';

const assert = require('assert');
const { prepareArgs, prepareArgsAndCall } = require('../');

const { tests } = getTestData();

describe('objectToArguments', function() {
	const testsKeys = Object.keys(tests);

	testsKeys.forEach(key => {
		it(`.prepareArgs: ${key}`, function() {
			const test = tests[key];
			const result = test.fn(...prepareArgs(test.fn, test.input));
			assert.deepEqual(result, test.output);
		});
	});

	testsKeys.forEach(key => {
		it(`.prepareArgsAndCall: ${key}`, function() {
			const test = tests[key];
			const result = prepareArgsAndCall(test.fn, test.input);
			assert.deepEqual(result, test.output);
		});
	});

	it(`Must work with a function passed in as a string (e.g. fn.toString())`, function() {
		const test = tests[testsKeys[0]];
		const result = test.fn(...prepareArgs(test.fn.toString(), test.input));
		assert.deepEqual(result, test.output);
	});
});

function getTestData() {

	const fnWithoutParameters = function() {
		return {
			argumentsArray: Array.from(arguments)
		};
	};

	const fnRest = function(a = 'dA', b, ...args) {
		return { a, b, args};
	};

	const fnWithComplexParams = function([a, [b = 'dB', [c, [d,e] = ['dD', 'dE'] ]]] = ['dA', ['dB', ['dC', ]]], {f} = {}, {g = 'dG'} = {}, {h: {i} = {}} = {},{j: {k = 'dK'} = {}} = {},{l: {m, n: {o} = {}} = {}} = {}, {p,q = 'dQ', r} = {}, [[[s,{t: {u} = {}} = {}]]] = [[[]]], {v: [{w} = {}, x = 'dX'] = []} = {}) {
		return {
			a,
			b,
			c,
			d,
			e,
			f,
			g,
			i,
			k,
			m,
			o,
			p,
			q,
			r,
			s,
			u,
			w,
			x,
			argumentsArray: Array.from(arguments)
		};
	};

	const tests = {
		'Function defined without parameters with no arguments': {
			fn: fnWithoutParameters,
			input: {},
			output: { argumentsArray: [] }
		},

		'Function defined without parameters with arbitrary arguments': {
			fn: fnWithoutParameters,
			input: {
				extra1: 'EXTRA1',
				b: 'argB',
				extra2: 'EXTRA2'
			},
			output: { argumentsArray: ['EXTRA1', 'argB', 'EXTRA2'] }
		},

		'All expected arguments plus some extra ones': {
			fn: fnWithComplexParams,
			input: {
				a: 'aA',
				b: 'aB',
				c: 'aC',
				d: 'aD',
				e: 'aE',
				f: 'aF',
				g: 'aG',
				h: 'aH',
				i: 'aI',
				j: 'aJ',
				k: 'aK',
				l: 'aL',
				m: 'aM',
				n: 'aN',
				o: 'aO',
				p: 'aP',
				q: 'aQ',
				r: 'aR',
				s: 'aS',
				u: 'aU',
				v: 'aV',
				w: 'aW',
				x: 'aX',
				extra1: 'EXTRA1',
				extra2: 'EXTRA2',
				extra3: 'EXTRA3'
			},
			output: {
				"a": "aA",
				"b": "aB",
				"c": "aC",
				"d": "aD",
				"e": "aE",
				"f": "aF",
				"g": "aG",
				"i": "aI",
				"k": "aK",
				"m": "aM",
				"o": "aO",
				"p": "aP",
				"q": "aQ",
				"r": "aR",
				"s": "aS",
				"u": "aU",
				"w": "aW",
				"x": "aX",
				"argumentsArray": {
					"0": [
						"aA", [
							"aB", [
								"aC", [
									"aD",
									"aE"
								]
							]
						]
					],
					"1": {
						"f": "aF"
					},
					"2": {
						"g": "aG"
					},
					"3": {
						"h": {
							"i": "aI"
						}
					},
					"4": {
						"j": {
							"k": "aK"
						}
					},
					"5": {
						"l": {
							"m": "aM",
							"n": {
								"o": "aO"
							}
						}
					},
					"6": {
						"p": "aP",
						"q": "aQ",
						"r": "aR"
					},
					"7": [
						[
							[
								"aS", {
									"t": {
										"u": "aU"
									}
								}
							]
						]
					],
					"8": {
						"v": [{
								"w": "aW"
							},
							"aX"
						]
					},
					"9": "aH",
					"10": "aJ",
					"11": "aL",
					"12": "aN",
					"13": "aV",
					"14": "EXTRA1",
					"15": "EXTRA2",
					"16": "EXTRA3"
				}
			}
		},

		'Undefined argument (must preserve all default values)': {
			fn: fnWithComplexParams,
			input: undefined,
			output: {
				a: 'dA',
				b: 'dB',
				c: 'dC',
				d: 'dD',
				e: 'dE',
				f: undefined,
				g: 'dG',
				i: undefined,
				k: 'dK',
				m: undefined,
				o: undefined,
				p: undefined,
				q: 'dQ',
				r: undefined,
				s: undefined,
				u: undefined,
				w: undefined,
				x: 'dX',
				argumentsArray: {}
			}
		},

		'Undefined argument as a empty string (must preserve all default values)': {
			fn: fnWithComplexParams,
			input: '',
			output: {
				a: 'dA',
				b: 'dB',
				c: 'dC',
				d: 'dD',
				e: 'dE',
				f: undefined,
				g: 'dG',
				i: undefined,
				k: 'dK',
				m: undefined,
				o: undefined,
				p: undefined,
				q: 'dQ',
				r: undefined,
				s: undefined,
				u: undefined,
				w: undefined,
				x: 'dX',
				argumentsArray: {}
			}
		},

		'Empty object as argument (must preserve all default values)': {
			fn: fnWithComplexParams,
			input: {},
			output: {
				a: 'dA',
				b: 'dB',
				c: 'dC',
				d: 'dD',
				e: 'dE',
				f: undefined,
				g: 'dG',
				i: undefined,
				k: 'dK',
				m: undefined,
				o: undefined,
				p: undefined,
				q: 'dQ',
				r: undefined,
				s: undefined,
				u: undefined,
				w: undefined,
				x: 'dX',
				argumentsArray: {}
			}
		},

		'First expected argument only (must preserve all default values, excluding those belonging to the same structure expected for the first parameter)': {
			fn: fnWithComplexParams,
			input: {
				a: 'aA'
			},
			output: {
				a: 'aA',
				b: 'dB',
				c: undefined,
				d: 'dD',
				e: 'dE',
				f: undefined,
				g: 'dG',
				i: undefined,
				k: 'dK',
				m: undefined,
				o: undefined,
				p: undefined,
				q: 'dQ',
				r: undefined,
				s: undefined,
				u: undefined,
				w: undefined,
				x: 'dX',
				argumentsArray: {
					"0": [
						"aA", [
							null, [
								null,
								null
							]
						]
					],
					"1": undefined,
					"2": undefined,
					"3": undefined,
					"4": undefined,
					"5": undefined,
					"6": undefined,
					"7": undefined,
					"8": undefined
				}
			}
		},

		'Rest parameter must set the the arguments and passed in all the extra args': {
			fn: fnRest,
			input: {
				b: 'aB',
				extra1: 'EXTRA1',
				args: ['restArgA', 'restArgB'],
				extra2: 'EXTRA2'
			},
			output: {
				a: 'dA',
				b: 'aB',
				args: ['restArgA', 'restArgB', 'EXTRA1', 'EXTRA2']
			}
		},

		'Rest parameter must set the expected parameters passed in and leave the rest for the rest parameter': {
			fn: fnRest,
			input: {
				b: 'aB',
				extra1: 'EXTRA1',
				extra2: 'EXTRA2'
			},
			output: {
				a: 'dA',
				b: 'aB',
				args: ['EXTRA1', 'EXTRA2']
			}
		}
	};

	return { tests };
}