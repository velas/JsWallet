# object-to-arguments

[![Build Status](https://api.travis-ci.org/DiegoZoracKy/object-to-arguments.svg)](https://travis-ci.org/DiegoZoracKy/object-to-arguments) [![npm](https://img.shields.io/npm/v/object-to-arguments.svg)]() [![npm](https://img.shields.io/npm/l/object-to-arguments.svg)]()

Transforms object's properties into an array of arguments tailored for a specific function, respecting the expected **order** and handling **destructuring** and **rest** parameters when needed.

## Installation

```bash
npm install object-to-arguments
```

**CLI**
```bash
npm install object-to-arguments -g
```

## Usage

`objectToArguments.call(fn, object);`


`objectToArguments.call(fn, object);`

 * **fn** must be a *function* reference or a function stringified (e.g. `fn.toString()`) for which the arguments array will be created for.

 * **object** is a flat *object literal* containing all the parameters names and its desired arguments. Note that in case of destructuring parameters, the object must still be flat, and the engine will create the structure needed for it.
 	* Every argument defined that is not expected as a parameter will be appended to the end of the arguments array (it will be available to be accessed via *arguments* or via rest parameter *...args*)

## Example

```javascript
const objectToArguments = require('object-to-arguments');

const fn = (a = 'defaultA', b, ...args) => {
	return { a, b, args};
};

const objectArgs = {
	extra1: 'EXTRA1',
	b: 'argB',
	extra2: 'EXTRA2'
};

// fnArguments = [ undefined, 'argB', 'EXTRA1', 'EXTRA2' ]
const fnArguments = objectToArguments(fn, objectArgs);

// fnReturn = { a: 'defaultA', b: 'argB', args: [ 'EXTRA1', 'EXTRA2' ] }
const fnReturn = fn(...fnArguments);
```

**An example with complex *destructuring parameters* and *default values* set in many ways**

```javascript
const objectToArguments = require('object-to-arguments');

const fn = function([a, [b, [c, [d,e] = ['dD', 'dE'] ]]] = ['dA', ['dB', ['dC', ]]], {f} = {}, {g = 'dG'} = {}, {h: {i} = {}} = {},{j: {k = 'dK'} = {}} = {},{l: {m, n: {o} = {}} = {}} = {}, {p,q = 'dQ', r} = {}, [[[s,{t: {u} = {}} = {}]]] = [[[]]], {v: [{w} = {}, x = 'dX'] = []} = {}) {
	return { a, b, c, d, e, f, g, i, k, m, o, p, q, r, s, u, w, x, arguments };
};

const objectArgs = {
	a: 'aA',
	b: 'aB',
	c: 'aC',
	f: 'aF',
	k: 'aK',
	p: 'aP',
	q: 'aQ',
	s: 'aS',
	u: 'aU',
	v: 'aV',
	w: 'aW',
	x: 'aX',
	extra1: 'EXTRA1',
	extra2: 'EXTRA2'
};

const fnArgs = objectToArguments(fn, objectArgs);
const fnReturn = fn(...fnArgs);

/////////////////////
// fnArgs will be: //
/////////////////////
// [
//     [
//         "aA",
//         [
//             "aB",
//             [
//                 "aC",
//                 undefined
//             ]
//         ]
//     ],
//     {
//         "f": "aF"
//     },
//     undefined,
//     undefined,
//     {
//         "j": {
//             "k": "aK"
//         }
//     },
//     undefined,
//     {
//         "p": "aP",
//         "q": "aQ"
//     },
//     [
//         [
//             [
//                 "aS",
//                 {
//                     "t": {
//                         "u": "aU"
//                     }
//                 }
//             ]
//         ]
//     ],
//     {
//         "v": [
//             {
//                 "w": "aW"
//             },
//             "aX"
//         ]
//     },
//     "aV",
//     "EXTRA1",
//     "EXTRA2"
// ]


///////////////////////
// fnReturn will be: //
///////////////////////
// {
//     "a": "aA",
//     "b": "aB",
//     "c": "aC",
//     "d": "dD",
//     "e": "dE",
//     "f": "aF",
//     "g": "dG",
//     "k": "aK",
//     "p": "aP",
//     "q": "aQ",
//     "s": "aS",
//     "u": "aU",
//     "w": "aW",
//     "x": "aX",
//     "arguments": {
//         "0": [
//             "aA",
//             [
//                 "aB",
//                 [
//                     "aC",
//                     null
//                 ]
//             ]
//         ],
//         "1": {
//             "f": "aF"
//         },
//         "4": {
//             "j": {
//                 "k": "aK"
//             }
//         },
//         "6": {
//             "p": "aP",
//             "q": "aQ"
//         },
//         "7": [
//             [
//                 [
//                     "aS",
//                     {
//                         "t": {
//                             "u": "aU"
//                         }
//                     }
//                 ]
//             ]
//         ],
//         "8": {
//             "v": [
//                 {
//                     "w": "aW"
//                 },
//                 "aX"
//             ]
//         },
//         "9": "aV",
//         "10": "EXTRA1",
//         "11": "EXTRA2"
//     }
// }
```