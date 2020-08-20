'use strict';

const commandLineUsage = require('command-line-usage');
const stripAnsiFn = require('strip-ansi');

function getCommandFromPath(commandPath, subcommandsDelimiter) {
	commandPath = commandPath.filter(command => !!command);
	if (subcommandsDelimiter) {
		return commandPath && commandPath.length && `${commandPath.shift()} ${commandPath.join(subcommandsDelimiter)}`;
	}

	return commandPath && commandPath.length && commandPath.join(' ');
}

function prepareDescriptionSection(description) {
	return description && { header: 'Description:', content: description };
}

function prepareValueSection(value) {
	return value !== undefined && { header: 'Value:', content: value };
}

function prepareCommandsSection(commands) {
	return commands.length && {
		header: 'Commands:',
		content: commands.map(command => ({
			name: command.name,
			summary: command.description
		}))
	};
}

function prepareOptions(options) {
	options = options.slice(0);

	const variadicArguments = options.find(option => option.variadic);
	if (variadicArguments) {
		// options = options.filter(option => option !== variadicArguments);
	}

	const optionsSection = {
		header: 'Options:',
		optionList: options.map(option => {
			let description = option.required && `[red]{Required}`;
			if(option.description) {
				description = description ? `${description} - ${option.description}` : option.description;
			}

			return {
				name: option.name,
				description,
				alias: option.alias,
				typeLabel: option.type && `[underline]{${option.type}}`
			}
		})
	};

	return { options, variadicArguments, optionsSection };
}

function prepareUsageSection(command, options = [], variadicArguments, hasSubcommand, subcommandRequired, subcommandsDelimiter) {
	if (!command) {
		return;
	}

	let usage = [];

	let usageText = `$ ${command}`;

	let usageOptions = options.length ? options.some(option => option.required) ? '<options>' : '[options]' : '';
	if (usageOptions) {
		usageText = `${usageText} ${usageOptions}`
	}

	if (variadicArguments) {
		let variadicArgumentsUsage = `${variadicArguments.name}...`;
		variadicArgumentsUsage = variadicArguments.required ? `<${variadicArgumentsUsage}>` : `[${variadicArgumentsUsage}]`;
		usageText = `${usageText} ${variadicArgumentsUsage}`
	}

	if(!subcommandRequired){
		usage.push(usageText);
	}

	if (hasSubcommand) {
		let usageCommand = subcommandRequired ? '<command>' : '[command]';
		usage.push(`$ ${command} ${usageCommand}`);
	}

	return { header: 'Usage:', content: usage };
}

function getHelp({ name, description, action, value, commandPath, options = [], commands = [] } = {}, { stripAnsi = false, subcommandsDelimiter } = {}) {
	const command = getCommandFromPath(commandPath, subcommandsDelimiter);
	const descriptionSection = prepareDescriptionSection(description);
	const valueSection = prepareValueSection(value);
	const commandsSection = prepareCommandsSection(commands);
	const preparedOptions = prepareOptions(options);
	const optionsSection = preparedOptions.optionsSection;
	const usageSection = prepareUsageSection(command, preparedOptions.options, preparedOptions.variadicArguments, commands.length, value === undefined && !action);

	const cmdLineUsageData = [];

	if(descriptionSection){
		cmdLineUsageData.push(descriptionSection);
	}

	if(usageSection){
		cmdLineUsageData.push(usageSection);
	}

	if(valueSection){
		cmdLineUsageData.push(valueSection);
	}

	if(preparedOptions.options.length){
		cmdLineUsageData.push(optionsSection);
	}

	if(commandsSection){
		cmdLineUsageData.push(commandsSection);
	}

	let helpContent = commandLineUsage(cmdLineUsageData);
	if (stripAnsi) {
		helpContent = stripAnsiFn(helpContent);
	}

	return helpContent;
}

module.exports = getHelp;