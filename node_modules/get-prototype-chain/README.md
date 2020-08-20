# get-prototype-chain [![Build Status](https://travis-ci.org/leahciMic/get-prototype-chain.svg?branch=master)](https://travis-ci.org/leahciMic/get-prototype-chain)

Returns an array with the passed in object's prototype chain (in
ascending order).

## Install

```sh
npm install --save get-prototype-chain
```

## Usage

```js
const getPrototypeChain = require('get-prototype-chain');

class A {

}

class B extends A {

}

class C extends B {

}

var obj = new C();

getPrototypeChain(obj).map(x => x.constructor.name)

// returns ['C', 'C', 'B', 'A', 'Object']
```
