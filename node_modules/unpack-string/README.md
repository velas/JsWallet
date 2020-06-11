# unpack-string

[![Build Status](https://api.travis-ci.org/DiegoZoracKy/unpack-string.svg)](https://travis-ci.org/DiegoZoracKy/unpack-string)

Unpacks the content found within a text, delimited by an opening char and a closing char, e.g., *'Can extract (**only the content found here within these parentheses**)'*

**Node.js** and **Browser** ready.

## Installation

```bash
npm install unpack-string
```

## Usage

It will extract the content found within the *opening char* and the *closing char* defined as parameters. If the parameter **openingChar** is not passed in, it will try to guess the first occurrence of some of these known chars `'([{<'`, and, when the parameter **closingChar** is not passed in, it will try to guess some of these chars `')]}>'`, to match the **openingChar**.

## Examples

```javascript
const unpackString = require('unpack-string');

const str = 'Can extract (only the content [found {here} within] these parentheses)!!';

{
	const result = unpackString(str);

	// Guessing openingChar and closingChar. "()" in that case.
	// result === 'only the content [found {here} within] these parentheses'
}

{
	const openingChar = '[';
	const result = unpackString(str, openingChar);

	// Guessing closingChar: "]"
	// result === 'found {here} within'
}

{
	const openingChar = '{';
	const closingChar = ']';
	const result = unpackString(str, openingChar, closingChar);

	// Defining any openingChar and closingChar
	// result === 'here} within'
}
```