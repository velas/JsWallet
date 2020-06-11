#!/usr/bin/env node

'use strict';

const fs = require('fs');
const path = require('path');
const inspectFunction = require('inspect-function');
const pipe = require('pipe-functions');
const getStdin = require('get-stdin');
const { callWithObject } = require('./call-with-object');
const commander = require('commander');

function getFlattenedAPI(o, path = '', methods = {}) {
	for (let prop in o) {
		if (o[prop].constructor === Function) {
			let methodCall = path ? `${path}-${prop}` : prop;
			methods[methodCall] = { method: o[prop] };

			let functionParams = inspectFunction(o[prop]).parameters.names;
			if (functionParams) {
				methods[methodCall] = {
					params: functionParams,
					method: o[prop]
				};
			}
		}
		if (o[prop].constructor === Object) {
			methods = getFlattenedAPI(o[prop], path ? `${path}-${prop}` : prop, methods);
		}
	}
	return methods;
}

function execPipeline(command, params, pipes = {}) {
	let pipeline = [];

	// Before
	if (pipes.before) {
		pipeline.push(pipes.before);
	}

	// Main Command
	pipeline.push(args => commandExec(command, args));

	// After
	if (pipes.after) {
		pipeline.push(pipes.after);
	}

	// Output
	pipeline.push(console.log);

	// Exec pipe
	pipe(params, ...pipeline);
}

function commandExec(command, args) {
	let methodReturn = callWithObject(command, args);
	if (methodReturn && methodReturn.then) {
		return methodReturn.then(data => data).catch(console.error);
	} else {
		return methodReturn;
	}
}

function findPackageJson(currentPath) {
	currentPath = currentPath.replace(/\/[^/]+$/g, '');

	if (fs.existsSync(`${currentPath}/package.json`)) {
		return `${currentPath}/package.json`;
	}

	if (currentPath.match(/\//)) {
		return findPackageJson(currentPath);
	}
}

function main(options = { pipes: {} }) {
	process.env.NODE_CLI = true;

	const packageJsonPath = options.modulePath || findPackageJson(process.argv[1]);
	const packageJson = require(packageJsonPath);
	const moduleEntryPoint = path.resolve(packageJsonPath.replace('package.json', packageJson.main || 'index.js'));
	const moduleAPI = require(moduleEntryPoint);
	const moduleVersion = packageJson.version;

	commander.version(moduleVersion);

	// Module is a Function :: TODO: Even being a function, it still can have properties / methods
	if (moduleAPI.constructor === Function) {
		commander.usage(`[options]`);

		// Get function parameters names
		const params = inspectFunction(moduleAPI).parameters.names;

		// Create Options
		params.forEach(param => commander.option(`--${param} [value]`, 'Input'));

		commander.parse(process.argv);
		getStdin()
			.then(input => {
				if (!input && params.length && !process.argv.slice(2).length) {
					commander.outputHelp();
				} else if (input && options.pipes.stdin) {
					pipe(() => options.pipes.stdin(input, commander), args => execPipeline(moduleAPI, args, options.pipes));
				} else {
					execPipeline(moduleAPI, commander, options.pipes);
				}
			})
			.catch(err => console.log('err', err));
	}

	// Module is a set of methods structured as a Object Literal
	else if (moduleAPI.constructor === Object) {
		commander.usage(`<command> [options]`);

		const methods = getFlattenedAPI(moduleAPI);
		Object.keys(methods).forEach(methodKey => {
			let cmd = commander.command(methodKey);

			// Create Options
			methods[methodKey].params.forEach(param => cmd.option(`--${param} [option]`));

			cmd.action(args => {
				methodKey = methodKey.replace(/\./g, '-');

				getStdin()
					.then(input => {
						if (!input && methods[methodKey].params.length && !process.argv.slice(3).length) {
							cmd.help();
						} else if (input && options.pipes.stdin) {
							pipe(
								() => options.pipes.stdin(input, args),
								args => execPipeline(methods[methodKey].method, args, options.pipes[methodKey] || options.pipes)
							);
						} else {
							return execPipeline(methods[methodKey].method, args, options.pipes[methodKey] || options.pipes);
						}
					})
					.catch(err => console.log('err', err));

			});
		});

		commander.parse(process.argv);
		if (!process.argv.slice(2).length) {
			return commander.outputHelp();
		}
	}
}

module.exports = main;