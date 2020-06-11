'use strict';

const cliss = require('../../../');

const cliSpec = {
	name: 'main',
	options: [{
		name: 'param1',
		description: 'param1 description',
		required: true
	}],
	action: (param1 = 'defaultParam1', param2) => `mainOutput`,
	commands: [{
		name: 'nested1',
		action: param1 => {
			return `nested1:` + param1;
		},
		pipe: {
			stdin: input => {
				return {
					param1: input
				};
			}
		},
		commands: [{
			name: 'nested1.1',
			action: (param1 = 'defaultParam1', param2) => {
				return `nested1-nested1.1:` + param1;
			},
			pipe: {
				after: result => `${result}commandPipe`
			}
		}]
	}, {
		name: 'nested2',
		action: param1 => {
			return `nested2:` + param1;
		}
	}]
};

cliss(cliSpec, {
	command: {
		subcommandsDelimiter: '-'
	},
	options: {
		validateRequiredParameters: true
	},
	help: {
		stripAnsi: true
	},
	pipe: {
		before: args => {
			args.param1 = args.param1.toLowerCase()
			return args;
		},
		after: result => `${result}optionsPipe`
	}
});