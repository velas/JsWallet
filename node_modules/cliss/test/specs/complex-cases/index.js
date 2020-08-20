'use strict';

const cliss = require('../../../');

const cliSpec = {
	name: 'main-command',
	description: 'Main command description',
	version: '1.0.0',
	commands: [{
		name: 'nested-command-1',
		description: 'nested-command-1 description',
		version: '2.1.0',
		options: [{
			name: 'p1',
			required: true
		}, {
			name: 'p2',
			required: true,
			description: 'p2 description'
		}],
		action: (p1 = 'p1Default', p2) => {
			return `${p1}-${p2}`;
		}
	}, {
		name: 'nested-command-promise',
		action: (...args) => {
			return new Promise((resolve, reject) => {
				setTimeout(() => resolve('promise resolved'), 1500);
			});
		}
	}, {
		name: 'nested-command-variadic',
		action: (...args) => {
			return args.reduce((result, v) => result += v);
		}
	}, {
		name: 'nested-command-set-with-no-action',
		commands: [{
			name: 'inner-nested-command-set',
			action: (param1, param2) => param2 + param1
		}]
	}, {
		name: 'nested-command-set-with-action',
		action: (param1, param2) => param1 + param2,
		commands: [{
			name: 'inner-nested-command-set',
			action: (param1, param2) => param2 + param2 + param1
		}]
	}]
};

cliss(cliSpec, {
	help: {
		stripAnsi: true
	}
});