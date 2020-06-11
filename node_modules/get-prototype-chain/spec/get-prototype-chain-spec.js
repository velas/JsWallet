'use strict';

const prototypeChain = require('../get-prototype-chain.js');

describe('prototype-chain', () => {
  describe('complex hierarchy', () => {
    class A {

    }
    class B extends A {

    }
    class C extends B {

    }

    const Obj = new C();

    it('should walk the prototype chain and return objects', () => {
      const chain = prototypeChain(Obj).map(x => x.constructor.name);
      // we expect to see C twice, one for the instance, and one for it's
      // prototype
      expect(chain).toEqual(['C', 'C', 'B', 'A', 'Object']);
    });
  });

  describe('simple object', () => {
    const Obj = {};
    it('should walk the prototype chain and return objects', () => {
      const chain = prototypeChain(Obj).map(x => x.constructor.name);
      expect(chain).toEqual(['Object', 'Object']);
    });

  });
});
