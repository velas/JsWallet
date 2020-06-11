# inspect-property

[![Build Status](https://api.travis-ci.org/DiegoZoracKy/inspect-property.svg)](https://travis-ci.org/DiegoZoracKy/inspect-property) [![npm](https://img.shields.io/npm/v/inspect-property.svg)]() [![npm](https://img.shields.io/npm/l/inspect-property.svg)]()

Inspects a Property and returns useful informations about it (e.g. nested properties, function inspection, property descriptor, value, type, constructor)

## Installation

```bash
npm install inspect-property
```

## Usage
```javascript
inspectProperty(o, propertyName, { delimiter = '.', inspectFunction = true, inspectProperties = true, enumerability, inherited} = {} );
```
 **o**:
 Object || Property || Value to be inspected.

 **propertyName**:
 When passing as `inspectProperty(parentObject, 'childPropertyName')`, `propertyDescriptor` will be returned. Note that `childPropertyName` must be a `string`.

 **delimiter**
 What will be used as a delimiter for the nested properties at `properties` keys. Default is `','` e.g. `'a.b.c'`

 **inspectFunction**
 If functions should be inspected. See [inspect-function](https://github.com/DiegoZoracKy/inspect-function) for details about the function inspection.

**inspectProperties**
When set to false, `properties` will be a simple `{key: value}` object, without any inspection. The default value is `true`, returning `{key: inspectProperty(value)}`.

 **path**
 An array representing the current property path. e.g. from the above example it will be `[ 'a', 'b', 'c' ]` for the `'c'` property

 **parent**
 The parent object of the current property. e.g. from the above example it will be the object `{ c: 'cValue' }` for the `'c'` property

 **enumerability**:
 When inspecting nested properties, defines how it should look up regarding `enumerability`.
 The options are:
  * `'enumerable'` *(default)*
  * `'nonenumerable'`
  * `'all'`

 **inherited**:
 Determines if it should look up on the prototype chain when inspecting nested properties.
 The options are:
  * `true` *(default)*
  * `false`

## Example
```javascript
const inspectProperty = require('../');

const data = {
	a: {
		b: {
			c: (z = 'DefaultX', k) => z+k
		},
		d: 3,
		f: {
			g: 'h'
		}
	}
};

const result = inspectProperty(data);

////////////
// RESULT //
////////////
// Below is a JSON.stringify(result), so functions references are ommitted

{
    "value": {
        "a": {
            "b": {},
            "d": 3,
            "f": {
                "g": "h"
            }
        }
    },
    "type": "object",
    "constructor": {
        "name": "Object"
    },
    "properties": {
        "a": {
            "value": {
                "b": {},
                "d": 3,
                "f": {
                    "g": "h"
                }
            },
            "type": "object",
            "constructor": {
                "name": "Object"
            },
            "properties": {
                "b": {},
                "d": 3,
                "f": {
                    "g": "h"
                },
                "f.g": "h"
            }
        },
        "a.b": {
            "value": {},
            "type": "object",
            "constructor": {
                "name": "Object"
            },
            "properties": {}
        },
        "a.b.c": {
            "type": "function",
            "constructor": {
                "name": "Function"
            },
            "functionInspection": {
                "name": "c",
                "signature": "c(z = 'DefaultX', k);",
                "parameters": [
                    {
                        "parameter": "z",
                        "defaultValue": "DefaultX",
                        "declaration": "z = 'DefaultX'"
                    },
                    {
                        "parameter": "k",
                        "declaration": "k"
                    }
                ],
                "parametersNames": [
                    "z",
                    "k"
                ]
            },
            "properties": {}
        },
        "a.d": {
            "value": 3,
            "type": "number",
            "constructor": {
                "name": "Number"
            }
        },
        "a.f": {
            "value": {
                "g": "h"
            },
            "type": "object",
            "constructor": {
                "name": "Object"
            },
            "properties": {
                "g": "h"
            }
        },
        "a.f.g": {
            "value": "h",
            "type": "string",
            "constructor": {
                "name": "String"
            }
        }
    }
}