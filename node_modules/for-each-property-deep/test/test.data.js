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
	forEachOwnEnumerableProperty: {
		keys: ['functionWithPropertiesEnumerablePropEnumerable'],
		paths: ['functionWithPropertiesEnumerablePropEnumerable'],
	},
	forEachOwnNonenumerableProperty: {
		keys: ['functionWithPropertiesEnumerablePropNonEnumerable'],
		paths: ['functionWithPropertiesEnumerablePropNonEnumerable'],
	},
	forEachOwnEnumerableAndNonenumerableProperty: {
		keys: ['functionWithPropertiesEnumerablePropEnumerable','functionWithPropertiesEnumerablePropNonEnumerable'],
		paths: ['functionWithPropertiesEnumerablePropEnumerable', 'functionWithPropertiesEnumerablePropNonEnumerable' ],
	},
	forEachEnumerableProperty: {
		keys: ['functionWithPropertiesEnumerablePropEnumerable'],
		paths: ['functionWithPropertiesEnumerablePropEnumerable'],
	},
	forEachNonenumerableProperty: {
		keys: ['functionWithPropertiesEnumerablePropNonEnumerable'],
		paths: ['functionWithPropertiesEnumerablePropNonEnumerable'],
	},
	forEachEnumerableAndNonenumerableProperty: {
		keys: ['functionWithPropertiesEnumerablePropEnumerable','functionWithPropertiesEnumerablePropNonEnumerable'],
		paths: ['functionWithPropertiesEnumerablePropEnumerable', 'functionWithPropertiesEnumerablePropNonEnumerable'],
	}
}, {
	name: 'instanceFromFunctionWithProperties',
	ref: instanceFromFunctionWithProperties,
	forEachOwnEnumerableProperty: {
		keys: ['propEnumerable'],
		paths: ['propEnumerable'],
	},
	forEachOwnNonenumerableProperty: {
		keys: ['propNonEnumerable'],
		paths: ['propNonEnumerable'],
	},
	forEachOwnEnumerableAndNonenumerableProperty: {
		keys: ['propEnumerable','propNonEnumerable'],
		paths: ['propEnumerable', 'propNonEnumerable'],
	},
	forEachEnumerableProperty: {
		keys: ['propEnumerable','protoEnumerableProp'],
		paths: ['propEnumerable', 'protoEnumerableProp'],
	},
	forEachNonenumerableProperty: {
		keys: ['propNonEnumerable','protoNonEnumerableProp'],
		paths: ['propNonEnumerable', 'protoNonEnumerableProp'],
	},
	forEachEnumerableAndNonenumerableProperty: {
		keys: ['propEnumerable','propNonEnumerable','protoEnumerableProp','protoNonEnumerableProp'],
		paths: ['propEnumerable', 'propNonEnumerable', 'protoEnumerableProp', 'protoNonEnumerableProp'],
	},
}, {
	name: 'objectLiteral',
	ref: objectLiteral,
	forEachOwnEnumerableProperty: {
		keys: ['a','b','c','d','f','g','fn','innerFn','z','k','zk','N','de','ep','kz','zz','kk','k','fnR'],
		paths: ["a","a.b","a.b.c","a.d","a.f","a.f.g","fn","fn.innerFn","z","z.k","z.zk","z.N","z.de","z.de.ep","z.kz","z.kz.zz","z.kz.zz.kk","z.kz.k","z.kz.fnR"],
	},
	forEachOwnNonenumerableProperty: {
		keys: [],
		paths: [],
	},
	forEachOwnEnumerableAndNonenumerableProperty: {
		keys: ['a','b','c','d','f','g','fn','innerFn','z','k','zk','N','de','ep','kz','zz','kk','k','fnR'],
		paths: ["a","a.b","a.b.c","a.d","a.f","a.f.g","fn","fn.innerFn","z","z.k","z.zk","z.N","z.de","z.de.ep","z.kz","z.kz.zz","z.kz.zz.kk","z.kz.k","z.kz.fnR"],
	},
	forEachEnumerableProperty: {
		keys: ['a','b','c','d','f','g','fn','innerFn','z','k','zk','N','de','ep','kz','zz','kk','k','fnR'],
		paths: ["a","a.b","a.b.c","a.d","a.f","a.f.g","fn","fn.innerFn","z","z.k","z.zk","z.N","z.de","z.de.ep","z.kz","z.kz.zz","z.kz.zz.kk","z.kz.k","z.kz.fnR"],
	},
	forEachNonenumerableProperty: {
		keys: [],
		paths: [],
	},
	forEachEnumerableAndNonenumerableProperty: {
		keys: ['a','b','c','d','f','g','fn','innerFn','z','k','zk','N','de','ep','kz','zz','kk','k','fnR'],
		paths: ["a","a.b","a.b.c","a.d","a.f","a.f.g","fn","fn.innerFn","z","z.k","z.zk","z.N","z.de","z.de.ep","z.kz","z.kz.zz","z.kz.zz.kk","z.kz.k","z.kz.fnR"]
	},
}, {
	name: 'classRef',
	ref: classRef,
	forEachOwnEnumerableProperty: {
		keys: [],
		paths: [],
	},
	forEachOwnNonenumerableProperty: {
		keys: ['classRefStatic'],
		paths: ['classRefStatic'],
	},
	forEachOwnEnumerableAndNonenumerableProperty: {
		keys: ['classRefStatic'],
		paths: ['classRefStatic'],
	},
	forEachEnumerableProperty: {
		keys: [],
		paths: [],
	},
	forEachNonenumerableProperty: {
		keys: ['classRefStatic','classRef2Static','classRef3Static'],
		paths: ['classRefStatic','classRef2Static','classRef3Static'],
	},
	forEachEnumerableAndNonenumerableProperty: {
		keys: ['classRefStatic','classRef2Static','classRef3Static'],
		paths: ['classRefStatic','classRef2Static','classRef3Static']
	},
}, {

	name: 'instanceFromClassRef',
	ref: instanceFromClassRef,
	forEachOwnEnumerableProperty: {
		keys: ['z','zz','superFn','superInnerFn','fnWithProp','instanceFn'],
		paths: ["z","zz","superFn","superFn.superInnerFn","superFn.superInnerFn.fnWithProp","instanceFn"]
	},
	forEachOwnNonenumerableProperty: {
		keys: ['instanceFnNonEnumerable'],
		paths: ["instanceFnNonEnumerable"]
	},
	forEachOwnEnumerableAndNonenumerableProperty: {
		keys: ['z','zz','superFn','superInnerFn','fnWithProp','instanceFn','instanceFnNonEnumerable'],
		paths: ["z","zz","superFn","superFn.superInnerFn","superFn.superInnerFn.fnWithProp","instanceFn","instanceFnNonEnumerable"]
	},
	forEachEnumerableProperty: {
		keys: ['z','zz','superFn','superInnerFn','fnWithProp','instanceFn'],
		paths: ["z","zz","superFn","superFn.superInnerFn","superFn.superInnerFn.fnWithProp","instanceFn"]
	},
	forEachNonenumerableProperty: {
		keys: ['instanceFnNonEnumerable','fn','ffn','fffn','ffn'],
		paths: ["instanceFnNonEnumerable","fn","ffn","fffn","ffn"]
	},
	forEachEnumerableAndNonenumerableProperty: {
		keys: ['z','zz','superFn','superInnerFn','fnWithProp','instanceFn','instanceFnNonEnumerable','fn','ffn','fffn','ffn'],
		paths: ["z","zz","superFn","superFn.superInnerFn","superFn.superInnerFn.fnWithProp","instanceFn","instanceFnNonEnumerable","fn","ffn","fffn","ffn"]
	},
}, {
	name: 'objectCreatedWithParentProto',
	ref: objectCreatedWithParentProto,
	forEachOwnEnumerableProperty: {
		keys: ['ownEmurableProp','enumerableProp'],
		paths: ["ownEmurableProp","enumerableProp"],
	},
	forEachOwnNonenumerableProperty: {
		keys: ['ownNonEmurableProp'],
		paths: ["ownNonEmurableProp"],
	},
	forEachOwnEnumerableAndNonenumerableProperty: {
		keys: ['ownNonEmurableProp','ownEmurableProp','enumerableProp'],
		paths: ["ownNonEmurableProp","ownEmurableProp","enumerableProp"],
	},
	forEachEnumerableProperty: {
		keys: ['ownEmurableProp','enumerableProp','ParentEnumerableProp'],
		paths: ["ownEmurableProp","enumerableProp","ParentEnumerableProp"],
	},
	forEachNonenumerableProperty: {
		keys: ['ownNonEmurableProp','parentNonEnumerableProp'],
		paths: ["ownNonEmurableProp","parentNonEnumerableProp"],
	},
	forEachEnumerableAndNonenumerableProperty: {
		keys: ['ownNonEmurableProp','ownEmurableProp','enumerableProp','ParentEnumerableProp','parentNonEnumerableProp'],
		paths: ["ownNonEmurableProp","ownEmurableProp","enumerableProp","ParentEnumerableProp","parentNonEnumerableProp"]
	},
}];