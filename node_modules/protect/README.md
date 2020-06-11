# [protect](https://github.com/hex7c0/protect)

[![NPM version](https://img.shields.io/npm/v/protect.svg)](https://www.npmjs.com/package/protect)
[![Linux Status](https://img.shields.io/travis/hex7c0/protect.svg?label=linux-osx)](https://travis-ci.org/hex7c0/protect)
[![Windows Status](https://img.shields.io/appveyor/ci/hex7c0/protect.svg?label=windows)](https://ci.appveyor.com/project/hex7c0/protect)
[![Dependency Status](https://img.shields.io/david/hex7c0/protect.svg)](https://david-dm.org/hex7c0/protect)
[![Coveralls](https://img.shields.io/coveralls/hex7c0/protect.svg)](https://coveralls.io/r/hex7c0/protect)

protect your object from being overridden

## Installation

Install through NPM

```bash
npm install protect
```
or
```bash
git clone git://github.com/hex7c0/protect.git
```

## API

inside nodejs project
```js
var protect = require('protect');

var newObj = protect({
    foo: 'ciao'
});

newObj.ciao = 'ciao';
newObj.foo = 123;
```
with this exception
```sh
a.foo = 123;
      ^
TypeError: Cannot assign to read only property 'foo' of [object Object]
```

### protect(obj, [normal])

#### options

 - `obj` - **Object** Your object *(default "required")*
 - `normal` - **Boolean** Using `{}` constructor *(default "Object.create(null)")*

## Examples

Take a look at my [examples](examples)

### [License GPLv3](LICENSE)
