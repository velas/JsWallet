# inspect-parameters-declaration

[![Build Status](https://api.travis-ci.org/DiegoZoracKy/inspect-parameters-declaration.svg)](https://travis-ci.org/DiegoZoracKy/inspect-parameters-declaration) [![npm](https://img.shields.io/npm/v/inspect-parameters-declaration.svg)]() [![npm](https://img.shields.io/npm/l/inspect-parameters-declaration.svg)]()

Inspects function's parameters declaration and returns information about it (e.g. names, default values, if needs destructuring, destructured parameters names and default values).

## Installation

```bash
npm install inspect-parameters-declaration
```

**CLI**
```bash
npm install inspect-parameters-declaration -g
```

## Usage

`inspectParameters(source);`

`getParametersNames(source);`

 * **source** is a *function* reference or a string containing the parameters declaration (e.g. 'a = "z, b = [1,2,3], c, {d,e: {f}, g} = {}')

`getParametersNames(inspectedParameters);`

* **inspectedParameters** expects the result from `inspectParameters(source)`;

```javascript
const { getParametersNames, inspectParameters } = require('inspect-parameters-declaration');

const testFunction = (a = "z", b = [1,2,3], c, {d,e: {f}, g} = {}) => console.log("noop");

const parametersNames = getParametersNames(testFunction);
const inspectedParameters = inspectParameters(testFunction);

///////////////////////////////
// parametersNames :: RESULT //
///////////////////////////////
// [ "a", "b", "c", "d", "f", "g" ]


///////////////////////////////////
// inspectedParameters :: RESULT //
///////////////////////////////////
// [
//     {
//         "parameter": "a",
//         "defaultValue": "z",
//         "declaration": "a = \"z\""
//     },
//     {
//         "parameter": "b",
//         "defaultValue": "[1,2,3]",
//         "declaration": "b = [1,2,3]"
//     },
//     {
//         "parameter": "c",
//         "declaration": "c"
//     },
//     {
//         "parameter": "{d,e: {f}, g}",
//         "defaultValue": "{}",
//         "expectsDestructuring": true,
//         "declaration": "{d,e: {f}, g} = {}",
//         "destructuredParameters": [
//             {
//                 "parameter": "d",
//                 "declaration": "d"
//             },
//             {
//                 "parameter": "f",
//                 "declaration": "f"
//             },
//             {
//                 "parameter": "g",
//                 "declaration": "g"
//             }
//         ]
//     }
// ]
```