'use strict';

function functionObject() {
	this.inner = 'property';
}

// Function Inner Property
functionObject.functionObjectEnumerablePropEnumerable = 'functionObjectEnumerablePropEnumerableVALUE';

Object.defineProperty(functionObject, 'functionObjectEnumerablePropNonEnumerable', {
	configurable: true,
	enumerable: false,
	writable: true,
	value: 'functionObjectEnumerablePropNonEnumerableVALUE'
});

Object.defineProperty(functionObject.prototype, 'protoEnumerableProp', {
	configurable: true,
	enumerable: true,
	writable: true,
	value: 'protoEnumerablePropVALUE'
});

Object.defineProperty(functionObject.prototype, 'protoNonEnumerableProp', {
	configurable: true,
	enumerable: false,
	writable: true,
	value: 'nonEnumerablePropVALUE'
});

const instanceFromFunctionObject = new functionObject();

Object.defineProperty(instanceFromFunctionObject, 'propEnumerable', {
	configurable: true,
	enumerable: true,
	writable: true,
	value: 'propEnumerableVALUE'
});

Object.defineProperty(instanceFromFunctionObject, 'propNonEnumerable', {
	configurable: true,
	enumerable: false,
	writable: true,
	value: 'propNonEnumerableVALUE'
});

instanceFromFunctionObject.a = {
	b: {
		c: x => x
	},
	d: 3,
	f: {
		g: 'h'
	}
};

module.exports = {
	instanceFromFunctionObject,
	functionObject
}