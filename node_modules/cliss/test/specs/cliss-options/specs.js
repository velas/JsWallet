'use strict';

const tests = [{
	description: 'options.validateRequiredParameters = true',
	input: '--param2=A',
	output: `
Usage:

  $ main  <options>
  $ main  [command]

Options:

  --param1    Required - param1 description
  --param2

Commands:

  nested1
  nested2
`
}, {
	description: `command.subcommandsDelimiter = '-' + options.pipe.before + command.pipe.after`,
	input: 'nested1-nested1.1  --param1=A',
	output: `nested1-nested1.1:aoptionsPipecommandPipe`
}];

module.exports = tests;