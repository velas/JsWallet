# inspect-function

[![Build Status](https://api.travis-ci.org/DiegoZoracKy/inspect-function.svg)](https://travis-ci.org/DiegoZoracKy/inspect-function)

Inspects a function and returns informations about it (e.g. name, parameters names, parameters and default values, signature).
Useful when creating automated tasks, e.g., docs generations.

## Installation

```bash
npm install inspect-function
```

## Usage

`inspectFunction(fn, name);`

```javascript
// The module
const inspectFunction = require('inspect-function');

// Just a function to test
const testFunction = (a = 'z', b = [1,2,3], c, {d,e: {f}, g} = {}) => console.log('noop');

// Inspects
const result = inspectFunction(testFunction);

// `result` will be:
{
    // If the second param, `name`, is passed in,
    // it will be the value of "name" here
	"name": "testFunction",
	"parameters": {
		"expected": [
			"a",
			"b",
			"c",
			"{d,e:{f},g}"
		],
		"defaultValues": {
			"a": "'z'",
			"b": "[1,2,3]",
			"{d,e:{f},g}": "{}"
		},

		// Note that `"names"` contains also
		// The parameters names after Destructuring
		"names": [
			"a",
			"b",
			"c",
			"d",
			"f",
			"g"
		],
		"definitions": [
			"a='z'",
			"b=[1,2,3]",
			"c",
			"{d,e:{f},g}={}"
		]
	},
	"signature": "testFunction(a = 'z', b = [1,2,3], c, {d,e:{f},g} = {});"
}
```