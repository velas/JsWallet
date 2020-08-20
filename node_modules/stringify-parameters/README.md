# stringify-parameters

[![Build Status](https://api.travis-ci.org/DiegoZoracKy/stringify-parameters.svg)](https://travis-ci.org/DiegoZoracKy/stringify-parameters)

Stringifies function's parameters definition. Useful to create automated tasks, intellisense, .

## Installation

```bash
npm install stringify-parameters
```

**CLI**
```bash
npm install stringify-parameters -g
```

## Usage

`stringifyParameters(fn);`

Where **fn** is a *function* reference or a *function* definition stringified (e.g. fn.toString())

```javascript
const stringifyParameters = require('stringify-parameters');

// Just a function to test
const testFunction = (a = "z", b = [1,2,3], c, {d,e: {f}, g} = {}) => console.log("noop");

// `result` will be: 'a = "z, b = [1,2,3], c, {d,e: {f}, g} = {}'
const result = stringifyParameters(testFunction);
```