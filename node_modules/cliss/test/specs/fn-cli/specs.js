'use strict';

const tests = [
{
	description: 'cli function with no object spec definition',
	input: '--param1=A --param2=B',
	output: `A-B`
},

{
	description: 'Passing in only one argument (using default values)',
	input: '--param2=B',
	output: `defaultParam1-B`
},

{
	input: '--help',
	output: `
Options:

  --param1
  --param2
`
}];

module.exports = tests;