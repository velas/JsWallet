//Patching crypto for bitcoinjs-lib to work
//The problem is solved in 5-th version of this lib, but we use 3.3.2 for now
const crypto = require('crypto')
const sourceCreateHash = crypto.createHash
crypto.createHash = function createHash(alg) {
  try{
    return sourceCreateHash(alg)
  } catch(e) {
    if (alg === 'rmd160') {
      return sourceCreateHash('ripemd160')
    }
    throw e;
  }
}