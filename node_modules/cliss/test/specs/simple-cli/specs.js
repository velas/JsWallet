'use strict';

const tests = [
{
	description: 'object specification + passing in options / args',
	input: '--param1=A --param2=B',
	output: `A-B`
},

{
	description: 'Passing in only one argument',
	input: '--param2=B',
	output: `defaultParam1-B`
},

{
	input: '--help',
	output: `
Usage:

  $ simple-cli [options]

Options:

  --param1
  --param2
`
}];

module.exports = tests;