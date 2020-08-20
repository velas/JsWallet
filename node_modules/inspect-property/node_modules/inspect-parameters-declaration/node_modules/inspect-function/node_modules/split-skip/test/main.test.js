'use strict';

const splitSkip = require(`../`);
const assert = require(`assert`);

describe(``, function() {

	it(`must skip commas found in destructuring parameters`, function() {
		const test = `[destru,cturu,cing]=[1],param,{dd,ee,ff}={dd:{b:1,c:2,arr:[1,6]}},last`;
		const expected = ['[destru,cturu,cing]=[1]', 'param', '{dd,ee,ff}={dd:{b:1,c:2,arr:[1,6]}}', 'last'];

		const result = splitSkip(test, ',', (state, char, i) => {
			if ('{[('.indexOf(char) >= 0) {
				state.skip += 1;
			}

			if ('}])'.indexOf(char) >= 0) {
				state.skip -= 1;
			}

			return state;
		});

		assert(result.every(item => expected.includes(item)));
	});

	it(`must not skip commas found in destructuring parameters`, function() {
		const test = `[destru,cturu,cing]=[1],param,{dd,ee,ff}={dd:{b:1,c:2,arr:[1,6]}},last`;
		const expected = [ '[destru', 'cturu', 'cing]=[1]', 'param', '{dd', 'ee', 'ff}={dd:{b:1', 'c:2', 'arr:[1', '6]}}', 'last' ];

		const result = splitSkip(test, ',');

		assert(result.every(item => expected.includes(item)));
	});
});