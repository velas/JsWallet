# split-skip

[![Build Status](https://api.travis-ci.org/DiegoZoracKy/split-skip.svg)](https://travis-ci.org/DiegoZoracKy/split-skip)

Splits a String into an Array of substrings with the option to skip some cases where the separator is found, based on some *truthy* condition.

**Node.js** and **Browser** ready.

## Installation

```bash
npm install split-skip
```

## Usage

```javascript
const splitSkip = require('split-skip');

//@param {String} str - Input String
const str = 'Some,String,as,an,Input';

// @param  {String} separator - Specifies the character(s) to use for separating the string
const separator = ',';

// @param  {Function} skipState  - Function to be called on each iteration, to manage the skip state. Parameters: `(state, char, i)`
const skipState = (state, char, i) => {

	/*
	Some logic to define state.skip equals to some truthy value
	e.g. state.skip = true, state.skip = 1
	when it should skip if the current char matches the separator
	*/

	/*
	And define state.skip equals to some falsy value
	e.g. state.skip = false, state.skip = 0
	when it should get back splitting if the current char matches the separator
	*/

	// Must alway return the state;
	return state;
};

const resultArray = splitSkip(str, separator, skipState);
```

## Example

As an input we have a string representing the parameters definition of a function from where we want to get each individual parameter. One idea of doing this is to split on every comma, but skipping the commas that are present on destructuring parameters definitions.
Using splitSkip, it could be like:

```javascript
const input = `[destru,cturu,cing]=[1],param,{dd,ee,ff}={dd:{b:1,c:2,arr:[1,6]}},last`;

const result = splitSkip(input, ',', (state, char, i) => {
	if ('{[('.indexOf(char) >= 0) {
		state.skip += 1;
	}

	if ('}])'.indexOf(char) >= 0) {
		state.skip -= 1;
	}

	return state;
});

// result === ['[destru,cturu,cing]=[1]', 'param', '{dd,ee,ff}={dd:{b:1,c:2,arr:[1,6]}}', 'last'];
```