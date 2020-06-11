'use strict';

const assert = require('assert');
const path = require('path');
const fs = require('fs');
const { exec } = require('child_process');

const testsPath = path.resolve(__dirname, './specs/cliss-options');

describe('stdin', function(){
	it('command.pipe.stdin', function(){
		return execCli(testsPath, 'nested1')
			.then(result => assert.equal(result, 'nested1:viastdinoptionsPipe'));
	})
})

function execCli(moduleCliPath, args) {
	return new Promise((resolve, reject) => {
		const cmd = `echo "VIASTDIN" | node ${moduleCliPath} ${args}`;
		exec(cmd, (err, stdout, stderr) => {
			if (err || stderr) {
				return reject(err || stderr);
			}

			resolve(stdout.replace(/ +$/gm, '').replace(/\n$/, ''));
		}).stdin.end();
	});
}