'use strict';

const helpOutput = `
Description:

  Main command description

Usage:

  $ main-command <command>

Commands:

  nested-command-1                    nested-command-1 description
  nested-command-promise
  nested-command-variadic
  nested-command-set-with-no-action
  nested-command-set-with-action
`;

const nestedCommand1HelpOutput = `
Description:

  nested-command-1 description

Usage:

  $ main-command nested-command-1 <options>

Options:

  --p1    Required
  --p2    Required - p2 description
`;

const nestedCommandPromiseHelpOutput = `
Usage:

  $ main-command nested-command-promise [options] [args...]

Options:

  --args
`;

const nestedCommandSetWithNoActionHelpOutput= `
Usage:

  $ main-command nested-command-set-with-no-action <command>

Commands:

  inner-nested-command-set
`;

const nestedCommandSetWithActionHelpOutput= `
Usage:

  $ main-command nested-command-set-with-action [options]
  $ main-command nested-command-set-with-action [command]

Options:

  --param1
  --param2

Commands:

  inner-nested-command-set
`;

const tests = [{
	description: 'Main command version',
	input: '--version',
	output: `1.0.0`
}, {
	description: 'Main command help (when there is no args for a command without an action)',
	input: '',
	output: helpOutput
}, {
	description: 'Main command help',
	input: '--help',
	output: helpOutput
}, {
	description: 'Nested command help',
	input: 'nested-command-1 --help',
	output: nestedCommand1HelpOutput
}, {
	description: 'Nested command specific version',
	input: 'nested-command-1 --version',
	output: `2.1.0`
}, {
	description: 'Nested command call',
	input: 'nested-command-1',
	output: `p1Default-undefined`
}, {
	description: 'Nested command call passing in options / args',
	input: 'nested-command-1 --p2=P2 --p1=P1',
	output: `P1-P2`
}, {
	description: 'Nested command help showing variading arguments (based on rest parameters definition)',
	input: 'nested-command-promise --help',
	output: nestedCommandPromiseHelpOutput
}, {
	description: 'Nested command version (getting the value from main command)',
	input: 'nested-command-promise --version',
	output: `1.0.0`
}, {
	description: 'Nested command call resolving a Promise',
	input: 'nested-command-promise',
	output: `promise resolved`
}, {
	description: 'Nested command call variadic arguments',
	input: 'nested-command-variadic 1 9 8 4',
	output: `22`
}, {
	description: 'Nested command call variadic arguments (with arbitrary named options)',
	input: 'nested-command-variadic --a=1 --b=9 --c=8 --d=4',
	output: `22`
}, {
	description: 'Nested command with no action plus having more nested commands defined --help',
	input: 'nested-command-set-with-no-action --help',
	output: nestedCommandSetWithNoActionHelpOutput
}, {
	description: 'Nested command, of an already nested command, call (3 level deep)',
	input: 'nested-command-set-with-no-action inner-nested-command-set --param1=A --param2=B',
	output: `BA`
}, {
	description: 'Nested command with action plus having more nested commands defined --help',
	input: 'nested-command-set-with-action --help',
	output: nestedCommandSetWithActionHelpOutput
}, {
	description: 'Nested command with action plus having more nested commands defined call',
	input: 'nested-command-set-with-action --param1=A --param2=B',
	output: `AB`
}, {
	description: 'Nested command, of an already nested command, call (3 level deep, when the parent also contains an action)',
	input: 'nested-command-set-with-action inner-nested-command-set --param1=A --param2=B',
	output: `BBA`
}];



module.exports = tests;