# for-each-property

[![Build Status](https://api.travis-ci.org/DiegoZoracKy/for-each-property.svg)](https://travis-ci.org/DiegoZoracKy/for-each-property)

Executes a callback for each property found on a object, with options regarding **enumerability** (enumerable or non-enumerable) and **ownership** (inherited or only own properties). It excludes built-in properties from Object and Function prototypes by default, and this behaviour can also be configured via options.

## Goal

The goal is to provide a way to iterate through object's properties with a clean interface regarding **enumerability** and **ownership**, e.g. `{ enumerability: 'enumerable', inherited: true }`. Also, discarding (or not, is an option) the built-in properties that may be found when looking up on the prototype-chain.

Currently JavaScript has some native methods to handle some cases, but not for all, and not with easy guessing names. Under the hood, the native methods available for some of the cases are being used. For example: `Object.keys` to *enumerable* and not *inherited*, `for..in`to *enumerable* and *inherited*, `Object.getOwnPropertyNames` for own properties, not *inherited*, *enumerable* and *nonenumerable*.

Check [for-each-property-deep](https://github.com/DiegoZoracKy/for-each-property-deep) for a recursive version, which will traverse object's nested properties.

## Usage

```javascript

const forEachProperty = require('for-each-property');

const object = {prop: 1, prop2: '2'};
const callback = (value, key) => console.log(value, key);
const options = {enumerability: 'enumerable', inherited: false};

forEachProperty(object, callback, options);
```
 **object**:
 Literal object, Object Instance, Class Reference... Any object whose properties can be iterated on.

 **callback**:
 Function that will receive `(value, key, object)` (object is the one forEachProperty() is being applied to)

 **options**:
 * **enumerability**:
 The options are: `'enumerable'` *(default)*, `'nonenumerable'` or `'all'`

 * **inherited**:
 The options are: `true` *(default)* or `false`

 * **excludeBuiltInPropsOf**:
 An array of objects whose prototype properties must be excluded. It defaults to `[Function, Object]`

 * **excludeProps**:
 An array properties that must be excluded. The default is `['prototype']`

## Example

Example testing all available cases, using an object created from a "parent", with properties enumerables and non-enumerables, inherited and not inherited;

```javascript

const forEachProperty = require('for-each-property');

/////////////////////////////////////////
// OBJECT.CREATE FROM PARENT PROTOTYPE //
/////////////////////////////////////////

const Parent = function() {};

Parent.ParentEnumerableProp = 'ParentEnumerablePropVALUE';

Object.defineProperty(Parent.prototype, 'ParentEnumerablePropt', {
	configurable: true,
	enumerable: true,
	writable: true,
	value: 'ParentEnumerableProptVALUE'
});

Object.defineProperty(Parent.prototype, 'ParentNonEnumerableProto', {
	configurable: false,
	enumerable: false,
	writable: false,
	value: 'ParentNonEnumerableProtoVALUE'
});


Object.defineProperty(Parent, 'parentNonEnumerableProp', {
	configurable: false,
	enumerable: false,
	writable: false,
	value: 'parentNonEnumerablePropVALUE'
});

const objectCreatedFromParentProto = Object.create(Parent, {
	ownNonEmurableProp: {
		value: 'ownNonEmurablePropVALUE'
	},
	ownEmurableProp: {
		value: 'ownEmurablePropVALUE',
		enumerable: true
	}
});
objectCreatedFromParentProto.enumerableProp = 'enumerablePropVALUE';

//////////
// MAIN //
//////////

console.log(`========= For each own enumerable property =======`);
forEachProperty(objectCreatedFromParentProto, value => console.log(value), {enumerability: 'enumerable', inherited: false});

console.log(`========= For each own non-enumerable property =======`);
forEachProperty(objectCreatedFromParentProto, value => console.log(value), {enumerability: 'nonenumerable', inherited: false});

console.log(`========= For each own enumerable and non-enumerable property =======`);
forEachProperty(objectCreatedFromParentProto, value => console.log(value), {enumerability: 'all', inherited: false});

console.log(`========= For each enumerable property, including inherited properties =======`);
forEachProperty(objectCreatedFromParentProto, key => console.log(key), {enumerability: 'enumerable', inherited: true});

console.log(`========= For each non-enumerable property, including inherited properties =======`);
forEachProperty(objectCreatedFromParentProto, key => console.log(key), {enumerability: 'nonenumerable', inherited: true});

console.log(`========= For each enumerable and non-enumerable property, including inherited properties =======`);
forEachProperty(objectCreatedFromParentProto, key => console.log(key), {enumerability: 'all', inherited: true});

/////////////////////////
// CONSOLE.LOG RESULTS //
/////////////////////////

// === For each own enumerable property ===
// ownEmurablePropVALUE
// enumerablePropVALUE

// === For each own non-enumerable property ===
// ownNonEmurablePropVALUE

// === For each own enumerable and non-enumerable property ===
// ownNonEmurablePropVALUE
// ownEmurablePropVALUE
// enumerablePropVALUE

// === For each enumerable property, including inherited properties ===
// ownEmurablePropVALUE
// enumerablePropVALUE
// ParentEnumerablePropVALUE

// === For each non-enumerable property, including inherited properties ===
// ownNonEmurablePropVALUE
// parentNonEnumerablePropVALUE

// === For each enumerable and non-enumerable property, including inherited properties ===
// ownNonEmurablePropVALUE
// ownEmurablePropVALUE
// enumerablePropVALUE
// ParentEnumerablePropVALUE
// parentNonEnumerablePropVALUE

```