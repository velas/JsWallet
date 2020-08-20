'use strict';

const cliss = require('../../../');

const fn = (param1 = 'defaultParam1', param2) => `${param1}-${param2}`;
cliss(fn, {
	help: {
		stripAnsi: true
	}
});