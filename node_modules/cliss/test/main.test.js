'use strict';

const assert = require('assert');
const path = require('path');
const fs = require('fs');
const { exec } = require('child_process');

const testsPath = path.resolve(__dirname, './specs');
const tests = fs.readdirSync(testsPath);

tests.forEach(test => {
	describe(test, function() {
		const modulePath = path.resolve(testsPath, test);
		const specs = require(path.resolve(modulePath, 'specs.js'));

		specs.forEach(spec => {
			const { input, output, description } = spec;

			it(description || input, function() {
				return execCli(modulePath, input).then(result => assert.equal(result, output));
			});
		});
	});
});

function execCli(moduleCliPath, args) {
	return new Promise((resolve, reject) => {
		const cmd = `node ${moduleCliPath} ${args}`;
		exec(cmd, (err, stdout, stderr) => {
			if (err || stderr) {
				return reject(err || stderr);
			}

			resolve(stdout.replace(/ +$/gm, '').replace(/\n$/, ''));
		}).stdin.end();
	});
}