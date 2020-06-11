//////////////
// Function //
//////////////

function functionWithProperties() {}

// Function Inner Property
functionWithProperties.functionWithPropertiesEnumerablePropEnumerable = 'functionWithPropertiesEnumerablePropEnumerableVALUE';

Object.defineProperty(functionWithProperties, 'functionWithPropertiesEnumerablePropNonEnumerable', {
	configurable: true,
	enumerable: false,
	writable: true,
	value: 'functionWithPropertiesEnumerablePropNonEnumerableVALUE'
});

Object.defineProperty(functionWithProperties.prototype, 'protoEnumerableProp', {
	configurable: true,
	enumerable: true,
	writable: true,
	value: 'protoEnumerablePropVALUE'
});

Object.defineProperty(functionWithProperties.prototype, 'protoNonEnumerableProp', {
	configurable: true,
	enumerable: false,
	writable: true,
	value: 'nonEnumerablePropVALUE'
});

///////////////////////////////////
// Object Instance from Function //
// Object.defineProperty 		 //
///////////////////////////////////

const instanceFromFunctionWithProperties = new functionWithProperties();

Object.defineProperty(instanceFromFunctionWithProperties, 'propEnumerable', {
	configurable: true,
	enumerable: true,
	writable: true,
	value: 'propEnumerableVALUE'
});

Object.defineProperty(instanceFromFunctionWithProperties, 'propNonEnumerable', {
	configurable: true,
	enumerable: false,
	writable: true,
	value: 'propNonEnumerableVALUE'
});

////////////////////
// Object Literal //
////////////////////

const fnTest = x => console.log('fnTest!');
fnTest.innerFn = x => console.log('fnTest.innerFn!');

const objectLiteral = {
	a: {
		b: {
			c: x => x
		},
		d: 'e',
		f: {
			g: 'h'
		}
	},
	fn: fnTest,
	z: {
		k: {},
		zk: 'ZK',
		N: 1984,
		de: { ep: 10 },
		kz: {
			zz: {
				kk: function ha() {}
			},
			k: 'K',
			fnR: fnTest
		}
	}
};

///////////
// CLASS //
///////////
class classRef3 {
	constructor() {
		this.z = 'classRef3';
	}

	static classRef3Static() {
		console.log('classRef3Static');
	}

	fffn() {
		console.log('classRef3Static fffn');
	}

	ffn() {
		console.log('classRef3Static ffn');
	}
}

class classRef2 extends classRef3 {
	constructor() {
		super();
		this.zz = 'classRef2';
		this.superFn = {
			superInnerFn: x => console.log(`superFn!`)
		};

		this.superFn.superInnerFn.fnWithProp = x => console.log(`fnWithProp!`);
	}

	static classRef2Static() {
		console.log('classRef2Static');
	}

	ffn() {
		console.log('classRef2Static ffn');
	}
}

class classRef extends classRef2 {
	constructor() {
		super();
		this.z = 'classRef';
		this.instanceFn = x => console.log(`instanceFn!`);
	}

	static classRefStatic() {
		console.log('classRefStatic');
	}

	fn() {
		console.log('classRefStatic fn');
	}
}

////////////////////////////////
// OBJECT INSTANCE FROM CLASS //
////////////////////////////////

const instanceFromClassRef = new classRef();
Object.defineProperty(instanceFromClassRef, 'instanceFnNonEnumerable', {
	value: 'instanceFnNonEnumerableVALUE'
});

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

const objectCreatedWithParentProto = Object.create(Parent, {
	ownNonEmurableProp: {
		value: 'ownNonEmurablePropVALUE'
	},
	ownEmurableProp: {
		value: 'ownEmurablePropVALUE',
		enumerable: true
	}
});
objectCreatedWithParentProto.enumerableProp = 'enumerablePropVALUE';

module.exports = [{
	name: 'functionWithProperties',
	ref: functionWithProperties,
	forEachOwnEnumerableProperty: ['functionWithPropertiesEnumerablePropEnumerable'],
	forEachOwnNonenumerableProperty: ['functionWithPropertiesEnumerablePropNonEnumerable'],
	forEachOwnEnumerableAndNonenumerableProperty: ['functionWithPropertiesEnumerablePropEnumerable', 'functionWithPropertiesEnumerablePropNonEnumerable'],
	forEachEnumerableProperty: ['functionWithPropertiesEnumerablePropEnumerable'],
	forEachNonenumerableProperty: ['functionWithPropertiesEnumerablePropNonEnumerable'],
	forEachEnumerableAndNonenumerableProperty: ['functionWithPropertiesEnumerablePropEnumerable', 'functionWithPropertiesEnumerablePropNonEnumerable']
}, {
	name: 'instanceFromFunctionWithProperties',
	ref: instanceFromFunctionWithProperties,
	forEachOwnEnumerableProperty: ['propEnumerable'],
	forEachOwnNonenumerableProperty: ['propNonEnumerable'],
	forEachOwnEnumerableAndNonenumerableProperty: ['propEnumerable', 'propNonEnumerable'],
	forEachEnumerableProperty: ['propEnumerable', 'protoEnumerableProp'],
	forEachNonenumerableProperty: ['propNonEnumerable', 'protoNonEnumerableProp'],
	forEachEnumerableAndNonenumerableProperty: ['propEnumerable', 'propNonEnumerable', 'protoEnumerableProp', 'protoNonEnumerableProp']
}, {
	name: 'objectLiteral',
	ref: objectLiteral,
	forEachOwnEnumerableProperty: ['a', 'fn', 'z'],
	forEachOwnNonenumerableProperty: [],
	forEachOwnEnumerableAndNonenumerableProperty: ['a', 'fn', 'z'],
	forEachEnumerableProperty: ['a', 'fn', 'z'],
	forEachNonenumerableProperty: [],
	forEachEnumerableAndNonenumerableProperty: ['a', 'fn', 'z']
}, {
	name: 'classRef',
	ref: classRef,
	forEachOwnEnumerableProperty: [],
	forEachOwnNonenumerableProperty: ['classRefStatic'],
	forEachOwnEnumerableAndNonenumerableProperty: ['classRefStatic'],
	forEachEnumerableProperty: [],
	forEachNonenumerableProperty: ['classRefStatic', 'classRef2Static', 'classRef3Static'],
	forEachEnumerableAndNonenumerableProperty: ['classRefStatic', 'classRef2Static', 'classRef3Static']
}, {

	name: 'instanceFromClassRef',
	ref: instanceFromClassRef,
	forEachOwnEnumerableProperty: ['z', 'zz', 'superFn', 'instanceFn'],
	forEachOwnNonenumerableProperty: ['instanceFnNonEnumerable'],
	forEachOwnEnumerableAndNonenumerableProperty: ['z', 'zz', 'superFn', 'instanceFn', 'instanceFnNonEnumerable'],
	forEachEnumerableProperty: ['z', 'zz', 'superFn', 'instanceFn'],
	forEachNonenumerableProperty: ['instanceFnNonEnumerable', 'fn', 'ffn', 'fffn', 'ffn'],
	forEachEnumerableAndNonenumerableProperty: ['z', 'zz', 'superFn', 'instanceFn', 'instanceFnNonEnumerable', 'fn', 'ffn', 'fffn', 'ffn']
}, {
	name: 'objectCreatedWithParentProto',
	ref: objectCreatedWithParentProto,
	forEachOwnEnumerableProperty: ['ownEmurableProp', 'enumerableProp'],
	forEachOwnNonenumerableProperty: ['ownNonEmurableProp'],
	forEachOwnEnumerableAndNonenumerableProperty: ['ownEmurableProp', 'enumerableProp', 'ownNonEmurableProp'],
	forEachEnumerableProperty: ['ownEmurableProp', 'enumerableProp', 'ParentEnumerableProp'],
	forEachNonenumerableProperty: ['ownNonEmurableProp', 'parentNonEnumerableProp'],
	forEachEnumerableAndNonenumerableProperty: ['ownNonEmurableProp', 'ownEmurableProp', 'enumerableProp', 'ParentEnumerableProp', 'parentNonEnumerableProp']
}];