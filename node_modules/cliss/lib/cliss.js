'use strict';

const os = require('os');
const yargsParser = require('yargs-parser');
const { prepareArgs, prepareArgsAndCall } = require('object-to-arguments');
const { inspectParameters, getParametersNames } = require('inspect-parameters-declaration');
const pipeFn = require('pipe-functions');
const getStdin = require('get-stdin');
const getHelp = require('./cli-help');
const deepMerge = require('deepmerge')

const defaultOptions = {
	command: {
		subcommandsDelimiter: undefined
	},
	options: {
		validateRequiredParameters: false
	},
	version: {
		option: 'version'
	},
	help: {
		option: 'help',
		stripAnsi: false
	}
};

function callCommand(command, parsedArgs, optionsPipe) {
	if (command && (command.value || command.action)) {
		if (command.value) {
			return execCommandPipeline(() => command.value, parsedArgs, command.pipe, optionsPipe);
		}

		return execCommandPipeline(command.action, parsedArgs, command.pipe, optionsPipe);
	}
}

function removeEOL(str) {
	return str.replace(RegExp(`${os.EOL}$`), '');
}

function checkStdin(stdinFn, stdinValue, parsedArgs, positionalArgs, argsAfterEndOfOptions) {
	if (stdinValue === '') {
		return parsedArgs;
	}

	stdinValue = removeEOL(stdinValue);
	return stdinFn(stdinValue, parsedArgs, positionalArgs, argsAfterEndOfOptions);
}

function execCommandPipeline(command, parsedArgs, commandPipe = {}, optionsPipe = {}) {
	const positionalArgs = parsedArgs._;
	const argsAfterEndOfOptions = parsedArgs['--'];
	delete parsedArgs._;
	delete parsedArgs['--'];

	let pipelineArray = [];

	// Wait for stdin or start passing in parsedArgs
	let pipeStdin = commandPipe.stdin || optionsPipe.stdin;
	if (pipeStdin) {
		pipelineArray.push(getStdin);
		pipelineArray.push(stdinValue => checkStdin(pipeStdin, stdinValue, parsedArgs, positionalArgs, argsAfterEndOfOptions));
	} else {
		pipelineArray.push(parsedArgs);
	}

	// Options Before
	if (optionsPipe.before) {
		pipelineArray.push(args => optionsPipe.before(args, positionalArgs, argsAfterEndOfOptions));
	}

	// Command Before
	if (commandPipe.before) {
		pipelineArray.push(args => commandPipe.before(args, positionalArgs, argsAfterEndOfOptions));
	}

	// Main Command
	pipelineArray.push(args => prepareArgsAndCall(command, args, ...positionalArgs));

	// Command After
	if (commandPipe.after) {
		pipelineArray.push(result => commandPipe.after(result, parsedArgs, positionalArgs, argsAfterEndOfOptions));
	}

	// Options After
	if (optionsPipe.after) {
		pipelineArray.push(result => optionsPipe.after(result, parsedArgs, positionalArgs, argsAfterEndOfOptions));
	}

	// Exec pipeline
	const pipeResult = pipeFn(...pipelineArray);

	// Output Promises
	if (pipeResult && pipeResult.then) {
		return pipeResult
			.then(result => result !== undefined && console.log(result))
			.catch(console.error);
	}

	// console.log('pipeResult', command\);

	// Output
	if (pipeResult !== undefined) {
		console.log(pipeResult);
	}
}

function matchCommandFromArgs(args, command, commandPath = []) {
	commandPath.push(command.name);

	if (command.commands) {
		for (let subcommand of command.commands) {
			if (subcommand.name === args[0]) {
				return matchCommandFromArgs(args.slice(1), subcommand, commandPath);
			}
		}
	}

	command.commandPath = commandPath;
	return { command, args };
}

function matchDelimitedSubcommand(subcommandArg = [], command, subcommandDelimiter, commandPath = []) {
	subcommandArg = subcommandArg.constructor === Array ? subcommandArg : subcommandArg.split(subcommandDelimiter);

	for (let subcommand of command.commands) {
		if (subcommand.name === subcommandArg[0]) {
			const nextSubcommand = subcommandArg.slice(1);
			if (nextSubcommand.length) {
				return matchDelimitedSubcommand(nextSubcommand, subcommand, subcommandDelimiter, commandPath);
			} else {
				return subcommand;
			}
		}
	}
}

function matchCommand(args, command, subcommandsDelimiter) {

	if (subcommandsDelimiter && command.commands) {
		const matchedSubcommand = matchDelimitedSubcommand(args[0], command, subcommandsDelimiter);
		if (matchedSubcommand) {
			const commandPath = [command.name].concat(args[0].split(subcommandsDelimiter));
			command = matchedSubcommand;
			args = args.slice(1);

			command.commandPath = commandPath;
			return { command, args };
		}
	}

	return matchCommandFromArgs(args.slice(0), command);
}

function buildOptionsFromParametersAndSpec(action, optionsSpec) {
	// Build options from functions parameters and merge with options spec
	return getParametersNames(action).map(parameter => {
		const option = { name: parameter };

		const [, variadic] = parameter.match(/^\.{3}(.*)/) || [];
		if (variadic) {
			option.name = variadic;
			option.variadic = true;
		}

		const optionSpec = (optionsSpec && optionsSpec.find(optionSpec => optionSpec.name === option.name)) || {};
		return Object.assign(option, optionSpec);
	});
}

function buildYargsParserOptions(options) {
	return options.reduce((result, option) => {
		// yargsParser option type
		if (option.type) {
			const optionType = option.type.toString().toLowerCase();
			result[optionType] = result[optionType] || [];
			result[optionType].push(option.name);
		}

		// yargsParser option alias
		if (option.alias) {
			result.alias = result.alias || {};
			result.alias[option.name] = option.alias
		}

		return result;
	}, {});
}

function parseArgs(args, parserOptions) {
	return yargsParser(args, Object.assign({
		configuration: {
			'boolean-negation': false,
			'populate--': true
		}
	}, parserOptions));
}

function cliss(cliSpec, clissOptions = {}, argv) {
	if (cliSpec.constructor === Function) {
		cliSpec = {
			action: cliSpec
		};
	}

	clissOptions = deepMerge(defaultOptions, clissOptions);

	const argsArray = argv || process.argv.slice(2);

	const { command, args } = matchCommand(argsArray.slice(0), cliSpec, clissOptions.command.subcommandsDelimiter);

	command.options = buildOptionsFromParametersAndSpec(command.action, command.options);

	const yargsParserOptions = buildYargsParserOptions(command.options);
	const parsedArgs = parseArgs(args, yargsParserOptions);

	// Show version if --version is passed in (disabled if { versionOption: falsey })
	if ((clissOptions.version.option && parsedArgs[clissOptions.version.option]) && (command.version || cliSpec.version)) {
		return console.log(command.version || cliSpec.version);
	}

	const helpOptions = Object.assign({}, clissOptions.help, { subcommandsDelimiter: clissOptions.command.subcommandsDelimiter });

	// Show help if the command doesn't have an action or value
	if (!command.action && !command.value) {
		return console.log(getHelp(command, helpOptions));
	}

	// Show help if the option says to validateRequiredParameters and some of then are not being passed in
	if (clissOptions.options.validateRequiredParameters) {
		const everyRequiredOptionsAreSet = command.options.filter(option => option.required).every(requiredOption => {
			return parsedArgs[requiredOption.name] !== undefined;
		});

		if (!everyRequiredOptionsAreSet) {
			return console.log(getHelp(command, helpOptions));
		}
	}

	// Show help if --help is passed in
	if (clissOptions.help.option && parsedArgs[clissOptions.help.option]) {
		return console.log(getHelp(command, helpOptions));
	}

	callCommand(command, parsedArgs, clissOptions.pipe);
}

module.exports = cliss;